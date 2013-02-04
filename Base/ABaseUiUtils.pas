{**
@Abstract ������� ������ �������� ����� � �� ��������������. ������� ������� for Delphi 5,7,2005,2006
@Author Prof1983 <prof1983@ya.ru>
@Created 06.06.2004
@LastMod 04.02.2013
}
unit ABaseUiUtils;

interface

uses
  Dialogs, ExtCtrls, Forms, Windows,
  ABase,
  ABaseUtils2,
  ABaseUtils3,
  ATypes;

type
  TWndType = type AInt; // Windows.UINT
  TWndRes = type AInt;

{** Close window }
function wndClose(Handle: THandle32): AError;

{** ������ ������ ����� }
function wndDialogOpen(var AFileName: WideString): WordBool;

{** Input query window
    @param HParent - ������������� ������������� ����
    @param Caption - ��������� ����
    @param Text - ����� ����
    @param Value - (in/out) ��������� �� ������
    @param uType - ��� ����
    @return - ������� ������ }
function wnd_Input(
  HParent: THandle32;
  Caption: String;
  Text: String;
  var Value: String;
  uType: TWndType = 1
  ): TWndRes;

{** Input Int64 query window
  @param HParent - ������������� ������������� ����
  @param Caption - ��������� ����
  @param Text - ����� ����
  @param Value - (in/out) ��������
  @param uType - ��� ���� }
function wnd_InputUInt064(
  HParent: THandle32;
  Caption: String;
  Text: String;
  var Value: AUInt64;
  uType: TWndType = 1
  ): TWndRes;

{** ������� ���� � ����������
  @param HParent - ������������� ������������� ����
  @param Caption - ��������� ����
  @param Text - ����� ����
  @param uType =mb_OkCancel
  @return - ������� ������ }
function wnd_Message(
  HParent: THandle32;
  Caption: String;
  Text: String;
  uType: TWndType = 0
  ): TWndRes;

implementation

// -- API ---

function __CloseHandle(hObject: THandle32): Boolean; stdcall; external 'kernel32.dll' name 'CloseHandle';
function __GetLastError(): AInt32; stdcall; external 'kernel32.dll' name 'GetLastError';

// --- Public ---

function wndClose(Handle: THandle32): AError;
begin
  Result := (Integer(__CloseHandle(Handle)));
end;

function wndDialogOpen(var AFileName: WideString): WordBool;
var
  Dialog: TOpenDialog;
begin
  Dialog := TOpenDialog.Create(nil);
  try
    Dialog.FileName := AFileName;
    Result := Dialog.Execute;
    if Result then AFileName := Dialog.FileName;
  finally
    Dialog.Free();
  end;
end;

function wnd_Input(HParent: THandle32; Caption: String; Text: String; var Value: String; uType: TWndType): TWndRes;
begin
  if InputQuery(Caption, Text, Value) then
    Result := 0
  else
    Result := 1;
end;

function wnd_InputUInt064(HParent: THandle32; Caption, Text: String; var Value: AUInt64; uType: TWndType = 1): TWndRes;
var
  S: String;
begin
  S := cUInt64ToStr(Value);
  Result := wnd_Input(HParent, PChar(Caption), PChar(Text), S, uType);
  Value := cStrToUInt64(S);
end;

function wnd_Memo(HParent: THandle32; Caption, Text: String): TWndRes;
begin
  Result := wnd_Message(HParent, PChar(Caption), PChar(Text), $0);
end;

function wnd_Message(HParent: THandle32; Caption, Text: String; uType: TWndType = 0): TWndRes;
begin
  Result := MessageBox(HParent, PChar(Text), PChar(Caption), uType);
end;

end.
