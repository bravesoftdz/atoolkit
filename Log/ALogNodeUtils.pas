{**
@Abstract(ALogNode functions)
@Author(Prof1983 prof1983@ya.ru)
@Created(06.07.2012)
@LastMod(09.07.2012)
@Version(0.5)
}
unit ALogNodeUtils;

interface

uses
  ABase, ATypes;

function ALogNode_AddToLog(LogNode: ALogNode; LogGroup: TLogGroupMessage; LogType: TLogTypeMessage;
    const StrMsg: APascalString): AInt;

function ALogNode_Free(LogNode: ALogNode): AError;

function ALogNode_Show(LogNode: ALogNode): AError;

implementation

uses
  ALogNodeImpl;

function ALogNode_AddToLog(LogNode: ALogNode; LogGroup: TLogGroupMessage; LogType: TLogTypeMessage;
    const StrMsg: APascalString): AInt;
begin
  if (LogNode = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if not(TObject(LogNode) is TALogNode) then
  begin
    Result := -3;
    Exit;
  end;
  try
    Result := TALogNode(LogNode).AddToLog(LogGroup, LogType, StrMsg);
  except
    Result := -1;
  end;
end;

function ALogNode_Free(LogNode: ALogNode): AError;
begin
  if (TObject(LogNode) is TALogNode) then
    IInterface(TALogNode(LogNode))._Release();
  Result := 0;
end;

function ALogNode_Show(LogNode: ALogNode): AError;
begin
  if (LogNode = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if not(TObject(LogNode) is TALogNode) then
  begin
    Result := -3;
    Exit;
  end;
  try
    TALogNode(LogNode).Show();
    Result := 0;
  except
    Result := -1;
  end;
end;

end.