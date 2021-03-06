﻿{**
@Abstract Класс работы с XML документом
@Author Prof1983 <prof1983@ya.ru>
@Created 07.03.2007
@LastMod 17.12.2012
}
unit AXmlDocumentImpl;

{define ADepr}

interface

uses
  SysUtils, XmlDoc, XmlIntf,
  ABase, ABaseUtils2, AConsts2, ADocumentImpl, ATypes,
  {$ifdef ADepr}AXmlDocumentIntf,{$endif} AXmlDocumentUtils, AXmlNodeUtils;

type
  {**
    XML документ.
    Класс реализует интерфейс IProfXmlDocument
  }
  TProfXmlDocument = class{$ifdef ADepr}(TInterfacedObject, IProfXmlDocument){$endif}
  public
      //** XML документ
    FDocument: IXmlDocument; //FDocument: TXmlDocument;
    FDocumentElement: AProfXmlNode;
      //** Название главного элемента документа (используется при создании XML документа)
    FDefElementName: WideString; //FDocumentElementName: WideString;
    FDefFileName: WideString;
    FEncoding: WideString;   // Набор символов = 'Windows-1251'
      //** Имя файла XML документа
    FFileName: WideString;
    FInitialized: ABoolean;
    FOnAddToLog: TAddToLogProc;
    FStandAlone: WideString; // Указывает на внешнее описание = ''
    FVersion: WideString;    // Версия XML = '1.0'
  protected
    function DoDocumentTag(Node: AProfXmlNode1): Boolean; virtual;
    function Get_DocumentElement(): IXmlNode;
  public
    function GetDocumentElement(): AProfXmlNode;
      //** Возвращает имя файла документа
    function GetFileName(): WideString;
    {**
      Открыт ли документ?
      Реализация метода IsDocumentOpened должна проверить соответствующие свойства Объекта для определения состояния документа.
    }
    function GetIsDocumentOpened(): WordBool; safecall;
    {**
      Открыт ли документ?
      Реализация метода IsOpened должна проверить соответствующие свойства
      Объекта для определения состояния документа.
    }
    function GetIsOpened(): WordBool; safecall;
    function GetSelf(): AXmlDocument;
    procedure SetFileName(const Value: WideString);
  public
      //** Закрыть документ
    procedure CloseDocument(); safecall;
      //** Загрузить из файла
    function LoadFromFile(const AFileName: WideString): WordBool;
      //** Загрузить из строки (Не рекомендуется использовать)
    function LoadFromString(const Value1: WideString): WordBool;
    {$ifdef ADepr}
      //** Сохранить в файл
    function SaveToFile(const FileName: WideString = ''): WordBool; deprecated; // Use AXmlDocument_SaveToFileP()
    {$endif}
    function SaveToString(var Value: WideString): Boolean;
      //** Открыть документ
    function OpenDocument(): AError; safecall;
      //** (не рекомендуется использовать)
    procedure OpenA(); deprecated; // Delete
  public
    function AddToLog(LogGroup: TLogGroupMessage; LogType: TLogTypeMessage;
        const StrMsg: String; Params: array of const): ABoolean;
    procedure CreateDocument();
    function Initialize(): WordBool; virtual;
  public
    constructor Create(const FileName: WideString = ''; const ElementName: WideString = 'Config';
        AddToLog: TAddToLogProc = nil);
    procedure Free();
  public
      //** XML документ (не рекомендуется использовать)
    property Controller: IXmlDocument read FDocument write FDocument;
    property DefElementName: WideString read FDefElementName write FDefElementName;
    property DefFileName: WideString read FDefFileName write FDefFileName;
      //** XML документ (не рекомендуется использовать)
    property Document: IXmlDocument read FDocument; //property Document: TXmlDocument read FDocument; //implements IXMLDocument;
      //** ProfNode
    property DocumentElement: AProfXmlNode read GetDocumentElement;
    //property DocumentElement: IXmlNode read Get_DocumentElement;
      //** Название главного элемента документа (используется при создании XML документа)
    //property DocumentElementName: WideString read FDocumentElementName write FDocumentElementName; - Use DefElementName
    property Encoding: WideString read FEncoding write FEncoding;
      //** Имя файла XML документа
    property FileName: WideString read GetFileName write SetFileName;
    property OnAddToLog: TAddToLogProc{TAddToLog} read FOnAddToLog write FOnAddToLog; //property OnToLog: TAddToLogProc read FToLog write FToLog;
    property OnToLog: TAddToLogProc read FOnAddToLog write FOnAddToLog;
    property StandAlone: WideString read FStandAlone write FStandAlone;
    property Version: WideString read FVersion write FVersion;
  end;

implementation

{ TProfXmlDocument }

function TProfXmlDocument.AddToLog(LogGroup: TLogGroupMessage; LogType: TLogTypeMessage;
    const StrMsg: String; Params: array of const): ABoolean;
begin
  Result := False;
  if Assigned(FOnAddToLog) then
  try
    Result := (FOnAddToLog(LogGroup, LogType, Format(StrMsg, Params)) > 0);
  except
  end;
end;

procedure TProfXmlDocument.CloseDocument();
begin
  if Assigned(FDocument) then
  begin
    //FDocument.SaveToFile(FFileName);
    FDocument.Active := False;
    FDocument := nil;
  end;
end;

constructor TProfXmlDocument.Create(const FileName, ElementName: WideString;
    AddToLog: TAddToLogProc);
begin
  inherited Create();
  FOnAddToLog := AddToLog;
  FDefFileName := FileName;
  FDefElementName := ElementName;
end;

procedure TProfXmlDocument.CreateDocument();
begin
  // Создаем документ
  AddToLog(lgGeneral, ltInformation, 'Создаем документ', []);
  FDocument.FileName := '';
  // Активируем документ
  AddToLog(lgGeneral, ltInformation, 'Активируем документ', []);
  FDocument.Active := True;
  // Задаем кодировку
  AddToLog(lgGeneral, ltInformation, 'Задаем кодировку "Windows-1251"', []);
  FDocument.Encoding := 'Windows-1251';
  // Задаем версию
  AddToLog(lgGeneral, ltInformation, 'Задаем версию "1.0"', []);
  FDocument.Version := '1.0';
  // Задаем отступы
  AddToLog(lgGeneral, ltInformation, 'Задаем отступы <2 пробела>', []);
  FDocument.NodeIndentStr := '  ';
  // Создаем главный элемент документа
  AddToLog(lgGeneral, ltInformation, 'Создаем главный элемент документа "Config"', []);
  //if FDefElementName = '' then FDefElementName := 'Config';
  if (FDefElementName <> '') then
  begin
    FDocument.AddChild(FDefElementName);
    // Создаем дочерние элементы
    AddToLog(lgGeneral, ltInformation, 'Создаем дочерние элементы', []);
    // ...
  end;
end;

{function TProfXmlDocument.CreateNode(const NameOrData: DOMString; NodeType: TNodeType = ntElement;
    const AddlData: DOMString = ''): IXmlNode;
begin
  Result := TProfXmlNode.Create(CreateDOMNode(DOMDocument, NameOrData,
    NodeType, AddlData), nil, Self);
end;}

function TProfXmlDocument.DoDocumentTag(Node: AProfXmlNode1): Boolean;
// Чтение тега <?...?>
begin
  Result := False;
end;

procedure TProfXmlDocument.Free();
begin
  if Assigned(FDocument) then
  try
    if (FDocument.FileName <> '') then
      FDocument.SaveToFile('');
    try
      //FDocument.Free();
    finally
      FDocument := nil;
    end;
  except
  end;

  AXmlNode_Free(FDocumentElement);
  FDocumentElement := 0;
  inherited Free;
end;

function TProfXmlDocument.GetDocumentElement(): AProfXmlNode;
begin
  Result := AXmlDocument_GetDocumentElement(Self.GetSelf());
end;

function TProfXmlDocument.GetFileName(): WideString;
begin
  Result := FFileName;
end;

function TProfXmlDocument.GetIsDocumentOpened(): WordBool;
begin
  Result := Assigned(FDocument);
  if Result then
  try
    Result := FDocument.Active;
  except
  end;
end;

function TProfXmlDocument.GetIsOpened(): WordBool;
begin
  Result := GetIsDocumentOpened();
end;

function TProfXmlDocument.GetSelf(): AXmlDocument;
begin
  Result := AXmlDocument(Self);
end;

function TProfXmlDocument.Get_DocumentElement(): IXmlNode{TProfXmlNode};
begin
  Result := FDocument.DocumentElement
  //Result := TProfXmlNode(DocumentElement);
end;

function TProfXmlDocument.Initialize(): WordBool;
begin
  if FInitialized then
  begin
    Result := True;
    Exit;
  end;

  Result := True;

  // Проверка сущестрования директории
  if (FDefFileName <> '') then
    ForceDirectories(ExtractFilePath(FDefFileName));

  if not(Assigned(FDocument)) then
    FDocument := TXmlDocument.Create(nil);

  FDocument.ParseOptions := [poPreserveWhiteSpace];

  if (FDefFileName = '') then
    CreateDocument()
  else
  try
    FDocument.LoadFromFile(FDefFileName);
  except
    on E: Exception do
    begin
      // Произошла ошибка при открытиии файла
      AddToLog(lgGeneral, ltError, 'Произошла ошибка при открытиии файла конфигураций "%s"', [FDefFileName]);

      // Создаем документ
      CreateDocument();

      // Сохраняем документ
      AddToLog(lgGeneral, ltInformation, 'Сохраняем документ', []);
      FDocument.FileName := FDefFileName;
      FDocument.SaveToFile('');
    end;
  end;

  // DocumentElement
  FDocumentElement := AXmlNode_New2(FDocument.DocumentElement);

  FInitialized := True;
end;

function TProfXmlDocument.LoadFromFile(const AFileName: WideString): WordBool;
var
  F: TextFile;
  S: string;
  Str: string;
  FileName: WideString;
begin
  //Result := False;

  if (AFileName = '') then
    FileName := FFileName
  else
    FileName := AFileName;

  if (FFileName = '') then
    FFileName := FileName;

  if Assigned(FDocument) then
  begin
    try
      FDocument.LoadFromFile(FileName);
      Result := True;
    except
      Result := False;
    end;
    Exit;
  end;

  AddToLog(lgGeneral, ltInformation, 'Загрузка XML файла "%s"', [FileName]);
  // if not(FileExists(FileName)) then Exit;
  AssignFile(F, FileName);
  {$I-}Reset(F);{$I+}
  Result := (IOResult = 0);
  if not(Result) then
  begin
    {$I-}CloseFile(F);{$I+}
    Exit;
  end;
  // Перевод файла в одну строку
  Str := '';
  while not(Eof(F)) do
  begin
    ReadLn(F, S);
    S := StrDeleteSpace(S, [dsFirst, dsLast, dsRep]);
    Str := Str + S;
  end;
  {$I-}CloseFile(F);{$I+}
  Result := LoadFromString(Str);
end;

function TProfXmlDocument.LoadFromString(const Value1: WideString): WordBool;
var
  I: Integer;
  IEnd: Integer;
  S: string;
  Line: Integer;
  Node: AProfXmlNode1;
  Value: WideString;
begin
  Value := Value1;
  {if Assigned(FDocument) then
  begin
    FDocument.LoadFromXml(Value);
    Result := True;
    Exit;
  end;}

  if (Assigned(FDocument)) then
  begin
    // Закрываем документ
    if FDocument.Active then
      FDocument.Active := False;
    // Задаем XML
    FDocument.XML.Clear();
    FDocument.XML.Add(Value);
    // Открываем XML документ
    try
      FDocument.Active := True;
      Self.GetDocumentElement();
    except
      Result := False;
      Exit;
    end;
  end;

  Result := False;
  Line := 0;
  // Чтение <?...?> тегов
  repeat
    Inc(Line);
    I := Pos(WideString('<?'), Value);
    if I > 0 then
    begin
      IEnd := Pos(WideString('?>'), Value);
      if IEnd = 0 then
      begin
        AddToLog(lgGeneral, ltError, err_Xml_Load1, [Line]);
        Exit;
      end;
      S := Copy(Value, 3, IEnd - 3);
      Delete(Value, 1, IEnd+1);
      //
      I := Pos('<', Value);
      if I = 0 then
      begin
        AddToLog(lgGeneral, ltError, err_Xml_Load2, [Line]);
      end;
      // #13#10
      IEnd := Pos(WideString(#13#10), Value);
      if IEnd < I then Inc(Line);
      Value := Copy(Value, I, Length(Value));
      //S := strDeleteSpace(S);

      Node := AXmlNode_New1(0);
      AXmlNode_SetXml(Node, '<' + S + '/>');
      if (AnsiUpperCase(AXmlNode_GetName(Node)) = 'XML') then
      begin
        FEncoding := AXmlNode_GetAttributeValue2(Node, 'encoding', False);
        FVersion := AXmlNode_GetAttributeValue2(Node, 'version', False);
      end
      else
        DoDocumentTag(Node);
      AXmlNode_Free(Node);
    end;
  until I = 0;
  // Чтение DocumentElement
  Result := (AXmlNode_SetXml(FDocumentElement, Value) >= 0);
end;

{function TProfXmlDocument.NewNode(const ADomNode: IDOMNode; const AParentNode: TXMLNode;
    const OwnerDoc: TXMLDocument): TXmlNode;
begin
  Result := TProfXmlNode.Create(ADomNode, AParentNode, OwnerDoc);
end;}

function TProfXmlDocument.OpenDocument(): AError;
var
  FCreate: Boolean;
begin
  FCreate := True;
  Result := RESULT_OK;

  if FCreate then
  begin
//  // Проверка сущестрования директории
//  if FFileName <> '' then
//    ForceDirectories(ExtractFilePath(FFileName));
  end;

  Initialize();

  FDocument.ParseOptions := [poPreserveWhiteSpace];

  if (FFileName = '') then
  begin
    if FCreate then
    begin
      CreateDocument();
      Result := RESULT_XML_DOCUMENT_CREATE;
    end
    else
      Result := RESULT_XML_DOCUMENT_NOTCREATE;
  end
  else
  try
    FDocument.LoadFromFile(FFileName);
    GetDocumentElement();
    Result := RESULT_OK;
  except
    on E: Exception do
    begin
      Result := RESULT_ERROR;
      if FCreate then
      begin
        // Произошла ошибка при открытиии файла
        //AddToLog(lgGeneral, ltError, 'Произошла ошибка при открытиии файла конфигураций "%s"', [FDefFileName]);

        CreateDocument();
        Result := RESULT_XML_DOCUMENT_CREATE;

        // Сохраняем документ
        //AddToLog(lgGeneral, ltInformation, 'Сохраняем документ', []);
        FDocument.FileName := FFileName;
        FDocument.SaveToFile('');

        GetDocumentElement();
      end;
    end;
  end;
end;

procedure TProfXmlDocument.OpenA();
begin
  GetDocumentElement();
end;

{$ifdef ADepr}
function TProfXmlDocument.SaveToFile(const FileName: WideString): WordBool;
begin
  Result := (AXmlDocument_SaveToFileP(AXmlDocument(Self), FileName) >= 0);
end;
{$endif}

function TProfXmlDocument.SaveToString(var Value: WideString): Boolean;
begin
  if Assigned(FDocument) then
  begin
    try
      Value := FDocument.XML.Text;
      Result := True;
    except
      Result := False;
    end;
    Exit;
  end;

  // Сохранение тегов <?...?>
  if (FVersion <> '') then
  begin
    if (FEncoding = '') then
      Value := '<? xml version="' + FVersion + '" ?>'+#13#10
    else
      Value := '<? xml version="' + FVersion + '" encoding="' + FEncoding + '" ?>'+#13#10;
  end
  else
    Value := '';
  Value := Value + AXmlNode_GetXmlA(FDocumentElement, '');
  Result := True;
end;

procedure TProfXmlDocument.SetFileName(const Value: WideString);
begin
  FFileName := Value;
end;

end.
