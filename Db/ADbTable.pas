{**
@Author Prof1983 <prof1983@ya.ru>
@Created 06.04.2006
@LastMod 05.02.2013

See ADb.txt
}
unit ADbTable;

interface

uses
  AdoDb, Classes, Variants,
  AConfig2007, ADbTypes, ADbUtils, AStorageObj, ATypes;

type
  {** Setup table and fields for the import, export and synchronization }
  TTableDM = class
  private
    FFieldsIn: TStringList;
    FFieldsOut: TStringList;
    FKeyFieldsIn: TStringList;
    FKeyFieldsOut: TStringList;

    FFieldsIn_Descr: TStringList;
    FFieldsOut_Descr: TStringList;
    FKeyFieldsIn_Descr: TStringList;
    FKeyFieldsOut_Descr: TStringList;

    FSqlInsert: WideString;
    FSqlUpdate: WideString;

    FOwner: TObject{TDataModule2};
    FTableNameIn: WideString;
    FTableNameOut: WideString;
    FTitle: WideString;
    FIOType: TDmType;
    FOnToLog: TProfAddToLog;
    function FieldsToStr(RecordSet: _RecordSet): string;
    function FieldValuesToStr(RecordSet: _RecordSet): string;
    function GetTitle(): WideString;
    function Insert(AConnectionIn, AConnectionOut: TAdoConnection; AFieldsIn, AFieldsOut: TStringList; ATableNameIn, ATableNameOut, AWhereIn: string): Boolean;
    function Update(AConnectionIn, AConnectionOut: TAdoConnection; AFieldsIn, AFieldsOut: TStringList; ATableNameIn, ATableNameOut, AWhereIn, AWhereOut: string): Boolean;
    function ToLog(AGroup: TLogGroupMessage; AType: TLogTypeMessage;
      const AStrMsg: WideString; AParams: array of const): Integer;
  public
    function Check(): Boolean;
    procedure Clear();
    function ConfigureLoad(AConfigNode: TConfigNode1): Boolean;
    function ConfigureSave(AConfigNode: TConfigNode1): Boolean;
    constructor Create(AOwner: TObject{TDataModule2});
    procedure Free();
    property IOType: TDMType read FIOType write FIOType;
    function LoadParams(AStorageName, AKeyName: string): Boolean;
    function SaveParams(AStorageName, AKeyName: string): Boolean;
  public
    class function GetFieldList(List: TStrings): string;
    class function GetFieldListSet(List: TStrings): string;
    class function QueryInsert(const ATableName: WideString; AFields: TStrings; AValues: WideString; const AShablon: WideString = ''): WideString;
    class function QuerySelect(const ATableName: WideString; AFields: TStrings; const AWhere: WideString = ''; const AShablon: WideString = ''): WideString;
    class function QueryUpdate(const ATableName: WideString; AFieldsSet: TStrings; const AWhere: WideString; const AShablon: WideString = ''): WideString;
  public
    function ExportData(): Boolean;
    function ImportData(): Boolean;
    function MoveData(AConnectionIn, AConnectionOut: TAdoConnection;
      AKeyFieldsIn, AKeyFieldsOut, AFieldsIn, AFieldsOut: TStringList;
      ATableNameIn, ATableNameOut: string): Boolean;
    // Refresh the data from In to Out
    function SynchronizeData(): Boolean;
  published
    // Field to copy in the local database
    property FieldsIn: TStringList read FFieldsIn;
    // Field to copy to an external database
    property FieldsOut: TStringList read FFieldsOut;
    // The key fields that will be a comparison in the local database
    property KeyFieldsIn: TStringList read FKeyFieldsIn;
    // The key fields that will be comparing the external database
    property KeyFieldsOut: TStringList read FKeyFieldsOut;

    property FieldsIn_Descr: TStringList read FFieldsIn_Descr;
    property FieldsOut_Descr: TStringList read FFieldsOut_Descr;
    property KeyFieldsIn_Descr: TStringList read FKeyFieldsIn_Descr;
    property KeyFieldsOut_Descr: TStringList read FKeyFieldsOut_Descr;

    property OnToLog: TProfAddToLog read FOnToLog write FOnToLog;

    property SqlInsert: WideString read FSqlInsert write FSqlInsert;
    property SqlUpdate: WideString read FSqlUpdate write FSqlUpdate;

    // The name of the table in the local database
    property TableNameIn: WideString read FTableNameIn write FTableNameIn;
    // The name of the table in an external database
    property TableNameOut: WideString read FTableNameOut write FTableNameOut;
    // The name of the таблици (for display)
    property Title: WideString read GetTitle write FTitle;
  end;

implementation

uses
  ADbDataModule2;

{$I ADbTable.inc}

{ TTableDM }

function TTableDM.Check(): Boolean;
var
  I: Integer;
  I2: Integer;
begin
  Result := False;
  if not(Assigned(FFieldsIn)) then
  begin
    ToLog(lgDataBase, ltError, SFieldIn, []);
    Exit;
  end;
  if not(Assigned(FFieldsOut)) then
  begin
    ToLog(lgDataBase, ltError, SFieldOut, []);
    Exit;
  end;
  if not(Assigned(FKeyFieldsIn)) then
  begin
    ToLog(lgDataBase, ltError, SKeyFieldsIn, []);
    Exit;
  end;
  if not(Assigned(FKeyFieldsOut)) then
  begin
    ToLog(lgDataBase, ltError, SKeyFieldsOut, []);
    Exit;
  end;

  // Comparison of колличесва fields
  if (FFieldsIn.Count <> FFieldsOut.Count) then
  begin
    ToLog(lgDataBase, ltError, SFieldsCount, []);
    Exit;
  end;
  if (FKeyFieldsIn.Count <> FKeyFieldsOut.Count) then
  begin
    ToLog(lgDataBase, ltError, SKeyFieldsCount, []);
    Exit;
  end;

  // Check the frequency of occurrence
  for I := 0 to FKeyFieldsIn.Count - 1 do
    for I2 := 0 to FFieldsIn.Count - 1 do
      if FKeyFieldsIn.Strings[I] = FFieldsIn.Strings[I2] then
      begin
        ToLog(lgDataBase, ltError, SFieldInError, [FKeyFieldsIn.Strings[I], FTableNameIn]);
        Exit;
      end;
  for I := 0 to FKeyFieldsOut.Count - 1 do
    for I2 := 0 to FFieldsOut.Count - 1 do
      if FKeyFieldsOut.Strings[I] = FFieldsOut.Strings[I2] then
      begin
        ToLog(lgDataBase, ltError, SFieldOutError, [FKeyFieldsIn.Strings[I], FTableNameOut]);
        Exit;
      end;

  Result := True;
end;

procedure TTableDM.Clear();
begin
  FFieldsIn.Clear();
  FFieldsOut.Clear();
  FKeyFieldsIn.Clear();
  FKeyFieldsOut.Clear();
  FTableNameIn := '';
  FTableNameOut := '';
  FTitle := '';
end;

function TTableDM.ConfigureLoad(AConfigNode: TConfigNode1): Boolean;
begin
  Result := Assigned(AConfigNode);
  if not(Result) then Exit;

  Clear();

  AConfigNode.ReadString('TableNameIn', FTableNameIn);
  AConfigNode.ReadString('TableNameOut', FTableNameOut);
  AConfigNode.ReadString('Title', FTitle);
  AConfigNode.ReadString('SqlInsert', FSqlInsert);
  AConfigNode.ReadString('SqlUpdate', FSqlUpdate);

  if not(XmlToStringList(AConfigNode.GetNodeByName1('FieldsIn'), FFieldsIn, FFieldsIn_Descr)) then Result := False;
  if not(XmlToStringList(AConfigNode.GetNodeByName1('FieldsOut'), FFieldsOut, FFieldsOut_Descr)) then Result := False;
  if not(XmlToStringList(AConfigNode.GetNodeByName1('KeyFieldsIn'), FKeyFieldsIn, FKeyFieldsIn_Descr)) then Result := False;
  if not(XmlToStringList(AConfigNode.GetNodeByName1('KeyFieldsOut'), FKeyFieldsOut, FKeyFieldsOut_Descr)) then Result := False;

  ToLog(lgGeneral, ltInformation, FFieldsIn.Text, []);
  ToLog(lgGeneral, ltInformation, FFieldsOut.Text, []);
end;

function TTableDM.ConfigureSave(AConfigNode: TConfigNode1): Boolean;
begin
  Result := Assigned(AConfigNode);
  if not(Result) then Exit;

  AConfigNode.Clear();
  //unConfig.SaveObjectToConfig(AConfigNode, Self, AddToLog);

  AConfigNode.WriteString('TableNameIn', FTableNameIn);
  AConfigNode.WriteString('TableNameOut', FTableNameOut);
  AConfigNode.WriteString('Title', FTitle);
  AConfigNode.WriteString('SqlInsert', FSqlInsert);
  AConfigNode.WriteString('SqlUpdate', FSqlUpdate);

  if not(StringListToXml(AConfigNode.GetNodeByName1('FieldsIn'), FFieldsIn, FFieldsIn_Descr)) then Result := False;
  if not(StringListToXml(AConfigNode.GetNodeByName1('FieldsOut'), FFieldsOut, FFieldsOut_Descr)) then Result := False;
  if not(StringListToXml(AConfigNode.GetNodeByName1('KeyFieldsIn'), FKeyFieldsIn, FKeyFieldsIn_Descr)) then Result := False;
  if not(StringListToXml(AConfigNode.GetNodeByName1('KeyFieldsOut'), FKeyFieldsOut, FKeyFieldsOut_Descr)) then Result := False;
end;

constructor TTableDM.Create(AOwner: TObject);
begin
  inherited Create();
  FOwner := AOwner;
  FFieldsIn := TStringList.Create();
  FFieldsOut := TStringList.Create();
  FKeyFieldsIn := TStringList.Create();
  FKeyFieldsOut := TStringList.Create();

  FFieldsIn_Descr := TStringList.Create();
  FFieldsOut_Descr := TStringList.Create();
  FKeyFieldsIn_Descr := TStringList.Create();
  FKeyFieldsOut_Descr := TStringList.Create();
end;

function TTableDM.ExportData(): Boolean;
begin
  Result := MoveData(TDataModule2(FOwner).ConnectionIn, TDataModule2(FOwner).ConnectionOut,
                     FKeyFieldsIn, FKeyFieldsOut,
                     FFieldsIn, FFieldsOut,
                     FTableNameIn, FTableNameOut);
end;

function TTableDM.FieldsToStr(RecordSet: _RecordSet): string;
var
  I: Integer;
begin
  Result := '';
  if RecordSet.Fields.Count > 0 then
  begin
    Result := RecordSet.Fields.Item[0].Name + '=' + VarToStr(RecordSet.Fields.Item[0].Value);
    for I := 1 to RecordSet.Fields.Count - 1 do
      Result := Result + ' ' + RecordSet.Fields.Item[I].Name + '=' + VarToStr(RecordSet.Fields.Item[I].Value);
  end;
end;

function TTableDM.FieldValuesToStr(RecordSet: _RecordSet): string;
var
  I: Integer;
begin
  Result := '';
  if RecordSet.Fields.Count > 0 then
  begin
    Result := VarToStr(RecordSet.Fields.Item[0].Value);
    for I := 0 to RecordSet.Fields.Count - 1 do
      Result := Result + ', ' + VarToStr(RecordSet.Fields.Item[I].Value);
  end;
end;

procedure TTableDM.Free();
begin
  if Assigned(FFieldsIn) then
  try
    FFieldsIn.Free();
  finally
    FFieldsIn := nil;
  end;
  if Assigned(FFieldsOut) then
  try
    FFieldsOut.Free();
  finally
    FFieldsOut := nil;
  end;
  if Assigned(FKeyFieldsIn) then
  try
    FKeyFieldsIn.Free();
  finally
    FKeyFieldsIn := nil;
  end;
  if Assigned(FKeyFieldsOut) then
  try
    FKeyFieldsOut.Free();
  finally
    FKeyFieldsOut := nil;
  end;

  if Assigned(FFieldsIn_Descr) then
  try
    FFieldsIn_Descr.Free();
  finally
    FFieldsIn_Descr := nil;
  end;
  if Assigned(FFieldsOut_Descr) then
  try
    FFieldsOut_Descr.Free();
  finally
    FFieldsOut_Descr := nil;
  end;
  if Assigned(FKeyFieldsIn_Descr) then
  try
    FKeyFieldsIn_Descr.Free();
  finally
    FKeyFieldsIn_Descr := nil;
  end;
  if Assigned(FKeyFieldsOut_Descr) then
  try
    FKeyFieldsOut_Descr.Free();
  finally
    FKeyFieldsOut_Descr := nil;
  end;

  inherited Free();
end;

class function TTableDM.GetFieldList(List: TStrings): string;
var
  I: Integer;
begin
  Result := '';
  if List.Count > 0 then
  begin
    Result := List.Strings[0];
    for I := 1 to List.Count - 1 do
      Result := Result + ', ' + List.Strings[I];
  end;
end;

class function TTableDM.GetFieldListSet(List: TStrings): string;
var
  I: Integer;
begin
  Result := '';
  if List.Count > 0 then
  begin
    Result := 'SET ' + List.Strings[0] + ' = ' + List.Values[List.Strings[0]];
    for I := 1 to List.Count - 1 do
      Result := Result + ', SET ' + List.Strings[0] + ' = ' + List.Values[List.Strings[0]];
  end;
end;

function TTableDM.GetTitle(): WideString;
begin
  if FTitle = '' then
    FTitle := FTableNameIn + ' ' + Naprav(TDataModule2(FOwner).DmType) + ' ' + FTableNameOut;
  Result := FTitle;
end;

function TTableDM.ImportData(): Boolean;
begin
  Result := MoveData(TDataModule2(FOwner).ConnectionOut, TDataModule2(FOwner).ConnectionIn,
                     FKeyFieldsOut, FKeyFieldsIn,
                     FFieldsOut, FFieldsIn,
                     FTableNameOut, FTableNameOut);
end;

function TTableDM.Insert(AConnectionIn, AConnectionOut: TAdoConnection; AFieldsIn, AFieldsOut: TStringList; ATableNameIn, ATableNameOut, AWhereIn: string): Boolean;
var
  rIn: _RecordSet;
  sIn: string;
  sOut: string;
begin
  try
    sIn := QuerySelect(ATableNameIn, AFieldsIn, AWhereIn);
    rIn := AConnectionIn.Execute(sIn);
    sOut := QueryInsert(ATableNameOut, FFieldsOut, FieldValuesToStr(rIn));
    AConnectionOut.Execute(sOut);
    Result := True;
  except
    Result := False;
  end;
end;

function TTableDM.LoadParams(AStorageName, AKeyName: string): Boolean;
var
  ps: TPropertyStorage;
begin
  ps := TPropertyStorage.Create(AStorageName);
  try
    ps.Open();
    ps.OpenKey(AKeyName + '\FieldsIn');
    ps.GetValueNames(FFieldsIn);
    ps.CloseKey();
    ps.OpenKey(AKeyName + '\FieldsOut');
    ps.GetValueNames(FFieldsOut);
    ps.CloseKey();
    ps.OpenKey(AKeyName + '\KeyFieldsIn');
    ps.GetValueNames(FKeyFieldsIn);
    ps.CloseKey();
    ps.OpenKey(AKeyName + '\KeyFieldsOut');
    ps.GetValueNames(FKeyFieldsOut);
    ps.CloseKey();
  finally
    ps.Free();
  end;
  Result := True;
end;

function TTableDM.MoveData(AConnectionIn, AConnectionOut: TAdoConnection;
  AKeyFieldsIn, AKeyFieldsOut, AFieldsIn, AFieldsOut: TStringList;
  ATableNameIn, ATableNameOut: string): Boolean;
var
  rIn: _RecordSet;
  sIn: string;
  sOut: string;
  rOut: _RecordSet;
  I: Integer;
  Res: Boolean;
begin
  Result := Check();
  if not(Result) then Exit;
  Result := False;
  try
    sIn := QuerySelect(ATableNameIn, AKeyFieldsIn);
    rIn := TDataModule2(FOwner).ConnectionIn.Execute(sIn);
    sOut := QuerySelect(ATableNameOut, AKeyFieldsOut);
    rOut := AConnectionOut.Execute(sOut);

    // Compare
    for I := 0 to rIn.Fields.Count - 1 do
    begin
      Res := (rIn.Fields.Item[I].Value = rOut.Fields.Item[I].Value);
      if Res then
        Update(AConnectionOut, AConnectionIn, AFieldsOut, AFieldsIn, ATableNameIn, ATableNameOut, FieldsToStr(rIn), FieldsToStr(rOut))
      else
        Insert(AConnectionOut, AConnectionIn, AFieldsOut, AFieldsIn, ATableNameIn, ATableNameOut, FieldsToStr(rIn));
    end;
    Result := True;
  except
  end;
end;

class function TTableDM.QueryInsert(const ATableName: WideString; AFields: TStrings; AValues: WideString; const AShablon: WideString = ''): WideString;
begin
  Result := 'INSERT INTO ' + ATableName + ' (' + GetFieldList(AFields) + ') VALUES (' + AValues + ')';
end;

class function TTableDM.QuerySelect(const ATableName: WideString; AFields: TStrings; const AWhere: WideString = ''; const AShablon: WideString = ''): WideString;
begin
  if AWhere = '' then
    Result := 'SELECT ' + GetFieldList(AFields) + ' FROM ' + ATableName
  else
    Result := 'SELECT ' + GetFieldList(AFields) + ' FROM ' + ATableName + ' WHERE ' + AWhere;
end;

class function TTableDM.QueryUpdate(const ATableName: WideString; AFieldsSet: TStrings; const AWhere: WideString; const AShablon: WideString = ''): WideString;
begin
  Result := 'UPDATE ' + ATableName + ' ' + GetFieldListSet(AFieldsSet) + ' WHERE ' + AWhere;
end;

function TTableDM.SaveParams(AStorageName, AKeyName: string): Boolean;
var
  I: Integer;
  ps: TPropertyStorage;
begin
  ps := TPropertyStorage.Create(AStorageName);
  try
    ps.Open();
    ps.OpenKey(AKeyName + '\FieldsIn');
    ps.ClearKey();
    for I := 0 to FFieldsIn.Count - 1 do
      ps.WriteString(FFieldsIn.Strings[I], '');
    ps.CloseKey();

    ps.OpenKey(AKeyName + '\FieldsOut');
    ps.ClearKey();
    for I := 0 to FFieldsIn.Count - 1 do
      ps.WriteString(FFieldsOut.Strings[I], '');
    ps.CloseKey();

    ps.OpenKey(AKeyName + '\KeyFieldsIn');
    ps.ClearKey();
    for I := 0 to FKeyFieldsIn.Count - 1 do
      ps.WriteString(FKeyFieldsIn.Strings[I], '');
    ps.CloseKey();

    ps.OpenKey(AKeyName + '\KeyFieldsOut');
    ps.ClearKey();
    for I := 0 to FKeyFieldsOut.Count - 1 do
      ps.WriteString(FKeyFieldsOut.Strings[I], '');
    ps.CloseKey();
  finally
    ps.Free();
  end;
  Result := True;
end;

function TTableDM.SynchronizeData(): Boolean;
begin
  Result := ExportData();
  Result := ImportData() and Result;
end;

function TTableDM.ToLog(AGroup: TLogGroupMessage; AType: TLogTypeMessage; const AStrMsg: WideString; AParams: array of const): Integer;
begin
  Result := -1;
  if Assigned(OnToLog) then
  try
    Result := OnToLog(AGroup, AType, AStrMsg, AParams);
  except
  end;
end;

function TTableDM.Update(AConnectionIn, AConnectionOut: TAdoConnection; AFieldsIn, AFieldsOut: TStringList; ATableNameIn, ATableNameOut, AWhereIn, AWhereOut: string): Boolean;
var
  rIn: _RecordSet;
  sIn: string;
  sOut: string;
  I: Integer;
begin
  try
    sIn := QuerySelect(ATableNameIn, AFieldsIn, AWhereIn);
    rIn := AConnectionIn.Execute(sIn);
    for I := 0 to rIn.Fields.Count - 1 do          // ???
      AFieldsOut.Values[AFieldsOut.Strings[I]] := VarToStr(rIn.Fields.Item[I].Value);
    sOut := QueryUpdate(ATableNameOut, FFieldsOut, AWhereOut);
    AConnectionOut.Execute(sOut);
    Result := True;
  except
    Result := False;
  end;
end;

end.
 