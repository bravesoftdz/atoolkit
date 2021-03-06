{**
@Abstract Util functions
@Author Prof1983 <prof1983@ya.ru>
@Created 30.09.2009
@LastMod 30.01.2013
}
unit AUtils;

TODO: Use AUtilsMain.pas

{$ifdef A04}{$DEFINE ADepr}{$endif}

interface

uses
  SysUtils, {$IFNDEF FPC}Windows,{$ENDIF}
  ABase, ABaseUtils, AStringUtils, AStrings, ASystem;

// ----

function Init(): AError; stdcall; deprecated; // Use AUtils_Init()
function Done(): AError; stdcall; deprecated; // Use AUtils_Fin()

function ChangeFileExtP(const FileName, Extension: APascalString): APascalString; stdcall;

function ChangeFileExtWS(const FileName, Extension: AWideString): AWideString; stdcall;

function DateToStrP(Value: TDateTime): APascalString; stdcall;

function DateToStrWS(Value: TDateTime): AWideString; stdcall;

function DeleteFileP(const FileName: APascalString): AError; stdcall;

function DeleteFileWS(const FileName: AWideString): AError; stdcall;

function DirectoryExistsP(const Directory: APascalString): ABoolean; stdcall;

function ExpandFileNameP(const FileName: APascalString): APascalString; stdcall;

function ExpandFileNameWS(const FileName: AWideString): AWideString; stdcall;

function ExtractFileExt(const FileName: AString_Type; out Res: AString_Type): AInteger; stdcall;

// ��������� ���������� ����� �� ������� ��������.
function ExtractFileExtP(const FileName: APascalString): APascalString; stdcall;

// ��������� ���������� ����� �� ������� ��������.
function ExtractFileExtWS(const FileName: AWideString): AWideString; stdcall;

function ExtractFilePath(const FileName: AString_Type; out Res: AString_Type): AInteger; stdcall;

// ��������� ���� � �����.
function ExtractFilePathP(const FileName: APascalString): APascalString; stdcall;

// ��������� ���� � �����.
function ExtractFilePathWS(const FileName: AWideString): AWideString; stdcall;

function FileExists(const FileName: AString_Type): ABoolean; stdcall;

// ���������� True, ���� ��������� ���� ����������.
function FileExistsP(const FileName: APascalString): ABoolean; stdcall;

// ���������� True, ���� ��������� ���� ����������.
function FileExistsWS(const FileName: AWideString): ABoolean; stdcall;

// ����������� ����� � ������.
function FloatToStr(Value: AFloat; out Res: AString_Type): AInteger; stdcall;

function FloatToStr2WS(Value: AFloat; DigitsAfterComma: Integer; ReplaceComma, Delimer: ABoolean): AWideString; stdcall;

// ����������� ����� � ������ c ����� ������� ����� �������.
function FloatToStrA(Value: AFloat; DigitsAfterComma: AInteger; out Res: AString_Type): AInteger; stdcall;

// ����������� ����� � ������ c ����� ������� ����� �������.
function FloatToStrAP(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; stdcall;

// ����������� ����� � ������ c ����� ������� ����� �������.
function FloatToStrAWS(Value: AFloat; DigitsAfterComma: Integer = 2): AWideString; stdcall;

// ����������� ����� � ������ ��� ������ � �� (SQL). ��� SQL ��������� ����������� - �����.
function FloatToStrB(Value: AFloat; Digits: AInteger; out Res: AString_Type): AInteger; stdcall;

// ����������� ����� � ������ ��� ������ � �� (SQL). ��� SQL ��������� ����������� - �����.
function FloatToStrBP(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; stdcall;

// ����������� ����� � ������ ��� ������ � �� (SQL). ��� SQL ��������� ����������� - �����.
function FloatToStrBWS(Value: AFloat; DigitsAfterComma: Integer = 2): AWideString; stdcall;

function FloatToStrC(Value: AFloat; Digits: AInteger; out Res: AString_Type): AInteger; stdcall;

function FloatToStrCP(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; stdcall;

function FloatToStrCWS(Value: AFloat; DigitsAfterComma: Integer = 2): AWideString; stdcall;

function FloatToStrD(Value: AFloat; out Res: AString_Type): AInteger; stdcall;

function FloatToStrDP(Value: AFloat): APascalString; stdcall;

function FloatToStrDWS(Value: AFloat): AWideString; stdcall;

// ����������� ����� � ������.
function FloatToStrP(Value: AFloat): APascalString; stdcall;

// ����������� ����� � ������.
function FloatToStrWS(Value: AFloat): AWideString; stdcall;

function FormatFloat1(Value: AFloat; Count, Digits: AInteger; out Res: AString_Type): AInteger; stdcall;

function FormatFloatP(Value: AFloat; DigitsBeforeComma, DigitsAfterComma: AInteger): APascalString; stdcall;

function FormatFloatWS(Value: AFloat; DigitsBeforeComma, DigitsAfterComma: AInteger): AWideString; stdcall;

// ����������� ����� � ������ ������� "%Nd".
function FormatInt(Value, Count: AInteger; out Res: AString_Type): AInteger; stdcall;

// ����������� ����� � ������ ������� "%Nd".
function FormatIntP(Value, Count: AInteger): APascalString; stdcall;

// ����������� ����� � ������ ������� "%Nd".
function FormatIntWS(Value, Count: AInteger): AWideString; stdcall;

// ���������� ������ ���������� �� ������������ ����� (Len > 0) ��� ������ ��������� ����� (L < 0).
function FormatStr(const Value: AString_Type; Len: AInteger; out Res: AString_Type): AInteger; stdcall;

// ���������� ������ ���������� �� ������������ ����� (Len > 0) ��� ������ ��������� ����� (L < 0).
function FormatStrAnsi(const Value: AnsiString; Len: AInteger): AnsiString; stdcall;

// ���������� ������ ���������� �� ������������ ����� (Len > 0) ��� ������ ��������� ����� (L < 0).
function FormatStrP(const Value: APascalString; Len: AInteger): APascalString; stdcall;

// ���������� ������ ���������� �� ������������ ����� (Len > 0) ��� ������ ��������� ����� (L < 0).
function FormatStrWS(const Value: AWideString; Len: AInteger): AWideString; stdcall;

function GetNowDateTime(): TDateTime; stdcall;

// ��������� Format() � ������ � ����� ��������� ����������. ��������: "������ � %s".
function FormatStrStr(const FormatStr, S: APascalString): APascalString; stdcall;

// ��������� Format() � ������ � ����� ��������� ����������. ��������: "������ � %s".
function FormatStrStrWS(const FormatStr, S: AWideString): AWideString; stdcall;

function IntToStr(Value: AInteger; out Res: AString_Type): AInteger; stdcall;

// ����������� ����� � ������.
function IntToStrP(Value: AInteger): APascalString; stdcall;

// ����������� ����� � ������.
function IntToStrWS(Value: AInteger): AWideString; stdcall;

function NormalizeFloat(Value: AFloat): AFloat; stdcall;

// �������� �� ������������ ������� ������ �� #
function NormalizeStr(const Value: AString_Type; out Res: AString_Type): AInteger; stdcall;

// �������� �� ������������ ������� ������ �� #
function NormalizeStrP(const Value: APascalString): APascalString; stdcall;

// �������� �� ������������ ������� ������ �� #
function NormalizeStrWS(const Value: AWideString): AWideString; stdcall;

{ �������� �� ������������ ������� ������ �� �������,
  ������� ������ (#13#10) �������� �� ���� ������. }
function NormalizeStrSpace(const Value: AString_Type; out Res: AString_Type): AInteger; stdcall;

{ �������� �� ������������ ������� ������ �� �������,
  ������� ������ (#13#10) �������� �� ���� ������. }
function NormalizeStrSpaceP(const Value: APascalString): APascalString; stdcall;

{ �������� �� ������������ ������� ������ �� �������,
  ������� ������ (#13#10) �������� �� ���� ������. }
function NormalizeStrSpaceWS(const Value: AWideString): AWideString; stdcall;

function Power(Base, Exponent: AFloat): AFloat; stdcall;

{ �������� ��� ����� �� ������� ��� ��� ������� �� ����� � ����������� �� ������������ ��������.
  ���� �������� DecimalSeparator ������, �� ������������ ��������� ������������. }
function ReplaceComma(const S: AString_Type; DecimalSeparator: AChar {= #0};
    ClearSpace: ABoolean {= True}; out Res: AString_Type): AInteger; stdcall;

{ �������� ��� ����� �� ������� ��� ��� ������� �� ����� � ����������� �� ������������ ��������.
  ���� �������� DecimalSeparator ������, �� ������������ ��������� ������������. }
function ReplaceCommaP(const S: APascalString; DecimalSeparator: AChar = #0;
    ClearSpace: ABoolean = True): APascalString; stdcall;

{ �������� ��� ����� �� ������� ��� ��� ������� �� ����� � ����������� �� ������������ ��������.
  ���� �������� DecimalSeparator ������, �� ������������ ��������� ������������. }
function ReplaceCommaWS(const S: AWideString; DecimalSeparator: AChar = #0;
    ClearSpace: ABoolean = True): AWideString; stdcall;

{ ��������� �������� �� ���������� ���-�� �������� ���� � �������� �� ���������� ���-�� ������ ����� �������.
  Digits1 - ���-�� �������� ���� (Meaning numbers)
  DigitsAfterComma - ����������� ����������� ���-�� ������ ����� ������� (Numbers after a comma) }
function Round2(Value: Real; Digits1, DigitsAfterComma: Integer): Real; stdcall;

function StrToDate(const Value: AString_Type): TDateTime; stdcall;

//** ����������� ����/����� �� ������.
function StrToDateA(Value: PAnsiChar): TDateTime; stdcall;

//** ����������� ����/����� �� ������.
function StrToDateWS(const Value: AWideString): TDateTime; stdcall;

function StrToFloat(const Value: AString_Type): AFloat; stdcall;

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������.
  Use StrToFloatWS() or StrToFloatDefP(S,0) }
function StrToFloat1(const S: AString_Type; DefValue: AFloat = 0): AFloat; stdcall; deprecated;

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function StrToFloatDef(const S: AString_Type; DefValue: AFloat): AFloat; stdcall;

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function StrToFloatDefP(const S: APascalString; DefValue: AFloat): AFloat; stdcall;

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function StrToFloatDefWS(const S: AWideString; DefValue: AFloat): AFloat; stdcall;

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function StrToFloatP(const S: APascalString): AFloat; stdcall;

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function StrToFloatWS(const S: AWideString): AFloat; stdcall;

function StrToInt(const Value: AString_Type): AInteger; stdcall;

function StrToInt1(const S: APascalString; DefValue: AInteger = 0): AInteger; stdcall; deprecated; // Use StrToIntDefP(S,0)

function StrToIntDefP(const S: APascalString; DefValue: AInteger): AInteger; stdcall;

function StrToIntDefWS(const S: AWideString; DefValue: AInteger): AInteger; stdcall;

// ����������� ������ � �����.
function StrToIntP(const S: APascalString): AInteger; stdcall;

// ����������� ������ � �����.
function StrToIntWS(const S: AWideString): AInteger; stdcall;

// ��������� ��� ������� ������ � ������ �������.
function String_ToLowerP(const S: APascalString): APascalString; stdcall;

// ��������� ��� ������� ������ � ������ �������.
function String_ToLowerWS(const S: AWideString): AWideString; stdcall;

// ��������� ��� ������� ������ � ������� �������.
function String_ToUpper(const S: AString_Type; out Res: AString_Type): AInteger; stdcall; deprecated; // Use AString_ToUpper()

// ��������� ��� ������� ������ � ������� �������.
function String_ToUpperP(const S: APascalString): APascalString; stdcall; deprecated; // Use AString_ToUpperP()

// ��������� ��� ������� ������ � ������� �������.
function String_ToUpperWS(const S: AWideString): AWideString; stdcall; deprecated; // Use AString_ToUpperWS()

function TryStrToDate(const S: AString_Type; var Value: TDateTime): ABoolean; stdcall;

function TryStrToDateP(const S: APascalString; var Value: TDateTime): ABoolean; stdcall;

function TryStrToDateWS(const S: AWideString; var Value: TDateTime): ABoolean; stdcall;

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function TryStrToFloat(const S: AString_Type; var Value: AFloat): ABoolean; stdcall;

{ ����������� ������ � Float32. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function TryStrToFloat32(const S: AString_Type; var Value: AFloat32): ABoolean; stdcall;

{ ����������� ������ � Float32. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function TryStrToFloat32P(const S: APascalString; var Value: AFloat32): ABoolean; stdcall;

{ ����������� ������ � Float32. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function TryStrToFloat32WS(const S: AWideString; var Value: AFloat32): ABoolean; stdcall;

{ ����������� ������ � Float64. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function TryStrToFloat64(const S: AString_Type; var Value: AFloat64): ABoolean; stdcall;

{ ����������� ������ � Float64. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function TryStrToFloat64P(const S: APascalString; var Value: AFloat64): ABoolean; stdcall;

{ ����������� ������ � Float64. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function TryStrToFloat64WS(const S: AWideString; var Value: AFloat64): ABoolean; stdcall;

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function TryStrToFloatP(const S: APascalString; var Value: AFloat): ABoolean; stdcall;

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function TryStrToFloatWS(const S: AWideString; var Value: AFloat): ABoolean; stdcall;

function TryStrToInt(const S: AString_Type; var Value: AInteger): ABoolean; stdcall;

function TryStrToIntWS(const S: AWideString; var Value: AInteger): ABoolean; stdcall;

function UpperStringP(const S: APascalString): APascalString; stdcall; deprecated; // Use String_ToUpperP()

{ Trims leading and trailing spaces and control characters from a string.
  ������� ������ � ��������� ������� }
function Trim(const S: AString_Type; out Res: AString_Type): AInteger; stdcall;

{ Trims leading and trailing spaces and control characters from a string.
  ������� ������ � ��������� �������. }
function TrimP(const S: APascalString): APascalString; stdcall;

{ Trims leading and trailing spaces and control characters from a string.
  ������� ������ � ��������� �������. }
function TrimWS(const S: AWideString): AWideString; stdcall;

//** ������� ��������� ���-�� �����������.
function Sleep(Milliseconds: AUInt): AError; stdcall;

//** ������� ��������� ���-�� �����������.
procedure Sleep02(Milliseconds: AUInt); stdcall;

//** ���������� ������� ���� � �����.
function Time_Now(): TDateTime; stdcall; // Use GetNowDateTime()

{ Utils }

{$ifdef ADepr}

function Utils_NormalizeFloat(Value: AFloat): AFloat; stdcall;

// �������� �� ������������ ������� ������ �� #
function Utils_NormalizeStr(const Value: APascalString): APascalString; stdcall;

procedure Utils_Sleep(Milliseconds: AUInt); stdcall;

function Utils_Time_Now: TDateTime; stdcall; // Use GetNowDateTime()

function Utils_StrToFloat(const Value: APascalString): AFloat; stdcall;

function Utils_StrToInt(const Value: APascalString): AInteger; stdcall;

{ ���������� ����� Base � ������� Exponent.
  Analog: SysUtils.Power(Base, Exponent) }
function Utils_Power(Base, Exponent: AFloat): AFloat; stdcall;

// ����������� ����� � ������ ������� "%Nd".
function Utils_FormatInt(Value, Count: AInteger): APascalString; stdcall;

function Utils_FormatStr(const Value: APascalString; Len: AInteger): APascalString; stdcall;

function Utils_FormatStrAnsi(const Value: AnsiString; Len: AInteger): AnsiString; stdcall;

function Utils_StrToDate(const Value: APascalString): TDateTime; stdcall;

function Utils_String_ToLower(const S: APascalString): APascalString;

{ Private }

type // ��� ������ �������
  TWinVersion = (wvUnknown, wv95, wv98, wvME, wvNT3, wvNT4, wvW2K, wvXP, wv2003);

{$IFNDEF FPC}
// ������ ������������ ������� ��� ������� �������� �����
//   Result:    ������ ������������ �������
function WinVersion: TWinVersion;
{$ENDIF}

{$endif ADepr}

implementation

uses
  AUtilsMain;

{ Private }

{$ifdef ADepr}

{$IFNDEF FPC}
function WinVersion: TWinVersion;
var
  OSVersionInfo: TOSVersionInfo;
begin
  Result := wvUnknown;
  OSVersionInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(OSVersionInfo) then
  begin
    case OSVersionInfo.DwMajorVersion of
      3: Result := wvNT3;
      4: case OSVersionInfo.DwMinorVersion of
           0: if (OSVersionInfo.dwPlatformId = VER_PLATFORM_WIN32_NT) then
                Result := wvNT4
              else
                Result := wv95;
           10: Result := wv98;
           90: Result := wvME;
         end;
      5: case OSVersionInfo.DwMinorVersion of
           0: Result := wvW2K;
           1: Result := wvXP;
           2: Result := wv2003;
         end;
    end;
  end;
end;
{$ENDIF}

{$endif ADepr}

{ Utils }

function ChangeFileExtP(const FileName, Extension: APascalString): APascalString; stdcall;
begin
  Result := AUtils_ChangeFileExtP(FileName, Extension);
end;

function ChangeFileExtWS(const FileName, Extension: AWideString): AWideString; stdcall;
begin
  Result := AUtils_ChangeFileExtWS(FileName, Extension);
end;

function DateToStrP(Value: TDateTime): APascalString; stdcall;
begin
  Result := AUtils_DateToStrP(Value);
end;

function DateToStrWS(Value: TDateTime): AWideString; stdcall;
begin
  Result := AUtils_DateToStrWS(Value);
end;

function DeleteFileP(const FileName: APascalString): AError; stdcall;
begin
  Result := AUtils_DeleteFileP(FileName);
end;

function DeleteFileWS(const FileName: AWideString): AError; stdcall;
begin
  Result := AUtils_DeleteFileWS(FileName);
end;

function DirectoryExistsP(const Directory: APascalString): ABoolean; stdcall;
begin
  Result := AUtils_DirectoryExistsP(Directory);
end;

function Done(): AError; stdcall;
begin
  Result := AUtils_Fin();
end;

function ExpandFileNameP(const FileName: APascalString): APascalString; stdcall;
begin
  Result := AUtils_ExpandFileNameP(FileName);
end;

function ExpandFileNameWS(const FileName: AWideString): AWideString; stdcall;
begin
  Result := AUtils_ExpandFileNameWS(FileName);
end;

function ExtractFileExt(const FileName: AString_Type; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_ExtractFileExt(FileName, Res);
end;

function ExtractFileExtP(const FileName: APascalString): APascalString; stdcall;
begin
  Result := AUtils_ExtractFileExtP(FileName);
end;

function ExtractFileExtWS(const FileName: AWideString): AWideString; stdcall;
begin
  Result := AUtils_ExtractFileExtWS(FileName);
end;

function ExtractFilePath(const FileName: AString_Type; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_ExtractFilePath(FileName, Res);
end;

function ExtractFilePathP(const FileName: APascalString): APascalString; stdcall;
begin
  Result := AUtils_ExtractFilePathP(FileName);
end;

function ExtractFilePathWS(const FileName: AWideString): AWideString; stdcall;
begin
  Result := AUtils_ExtractFilePathWS(FileName);
end;

function FileExists(const FileName: AString_Type): ABoolean; stdcall;
begin
  Result := AUtils_FileExists(FileName);
end;

function FileExistsP(const FileName: APascalString): ABoolean; stdcall;
begin
  Result := AUtils_FileExistsP(FileName);
end;

function FileExistsWS(const FileName: AWideString): ABoolean; stdcall;
begin
  Result := AUtils_FileExistsWS(FileName);
end;

function FloatToStr(Value: AFloat; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_FloatToStr(Value, Res);
end;

function FloatToStr2WS(Value: AFloat; DigitsAfterComma: Integer; ReplaceComma, Delimer: ABoolean): AWideString; stdcall;
begin
  Result := AUtils_FloatToStr2WS(Value, DigitsAfterComma, ReplaceComma, Delimer);
end;

function FloatToStrA(Value: AFloat; DigitsAfterComma: AInteger; out Res: AString_Type): AInteger; stdcall;
begin
  try
    Result := AString_AssignP(Res, AUtils_FloatToStrAP(Value, DigitsAfterComma));
  except
    Result := 0;
  end;
end;

function FloatToStrAP(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrAP(Value, DigitsAfterComma);
end;

function FloatToStrAWS(Value: AFloat; DigitsAfterComma: Integer = 2): AWideString; stdcall;
begin
  Result := AUtils_FloatToStrAP(Value, DigitsAfterComma);
end;

function FloatToStrB(Value: AFloat; Digits: AInteger; out Res: AString_Type): AInteger; stdcall;
begin
  try
    Result := AString_AssignP(Res, AUtils_FloatToStrBP(Value, Digits));
  except
    Result := 0;
  end;
end;

function FloatToStrBP(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrBP(Value, DigitsAfterComma);
end;

function FloatToStrBWS(Value: AFloat; DigitsAfterComma: Integer = 2): AWideString; stdcall;
begin
  Result := AUtils_FloatToStrBP(Value, DigitsAfterComma);
end;

function FloatToStrC(Value: AFloat; Digits: AInteger; out Res: AString_Type): AInteger; stdcall;
begin
  try
    Result := AString_AssignP(Res, AUtils_FloatToStrCP(Value, Digits));
  except
    Result := 0;
  end;
end;

function FloatToStrCP(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrCP(Value, DigitsAfterComma);
end;

function FloatToStrCWS(Value: AFloat; DigitsAfterComma: Integer = 2): AWideString; stdcall;
begin
  Result := AUtils_FloatToStrCP(Value, DigitsAfterComma);
end;

function FloatToStrD(Value: AFloat; out Res: AString_Type): AInteger; stdcall;
begin
  try
    Result := AString_AssignP(Res, AUtils_FloatToStrDP(Value));
  except
    Result := 0;
  end;
end;

function FloatToStrDP(Value: AFloat): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrDP(Value);
end;

function FloatToStrDWS(Value: AFloat): AWideString; stdcall;
begin
  Result := AUtils_FloatToStrDP(Value);
end;

function FloatToStrP(Value: AFloat): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrP(Value);
end;

function FloatToStrWS(Value: AFloat): AWideString; stdcall;
begin
  Result := AUtils_FloatToStrWS(Value);
end;

function FormatFloat1(Value: AFloat; Count, Digits: AInteger; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_FormatFloat(Value, Count, Digits, Res);
end;

function FormatFloatP(Value: AFloat; DigitsBeforeComma, DigitsAfterComma: AInteger): APascalString; stdcall;
begin
  Result := AUtils_FormatFloatP(Value, DigitsBeforeComma, DigitsAfterComma);
end;

function FormatFloatWS(Value: AFloat; DigitsBeforeComma, DigitsAfterComma: AInteger): AWideString; stdcall;
begin
  Result := AUtils_FormatFloatWS(Value, DigitsBeforeComma, DigitsAfterComma);
end;

function FormatInt(Value, Count: AInteger; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_FormatInt(Value, Count, Res);
end;

function FormatIntP(Value, Count: AInteger): APascalString; stdcall;
begin
  Result := AUtils_FormatIntP(Value, Count);
end;

function FormatIntWS(Value, Count: AInteger): AWideString; stdcall;
begin
  Result := AUtils_FormatIntWS(Value, Count);
end;

function FormatStr(const Value: AString_Type; Len: AInteger; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_FormatStr(Value, Len, Res);
end;

function FormatStrAnsi(const Value: AnsiString; Len: AInteger): AnsiString; stdcall;
begin
  Result := AUtils_FormatStrAnsi(Value, Len);
end;

function FormatStrP(const Value: APascalString; Len: AInteger): APascalString; stdcall;
begin
  Result := AUtils_FormatStrP(Value, Len);
end;

function FormatStrStr(const FormatStr, S: APascalString): APascalString; stdcall;
begin
  Result := AUtils_FormatStrStrP(FormatStr, S);
end;

function FormatStrStrWS(const FormatStr, S: AWideString): AWideString; stdcall;
begin
  Result := AUtils_FormatStrStrWS(FormatStr, S);
end;

function FormatStrWS(const Value: AWideString; Len: AInteger): AWideString; stdcall;
begin
  Result := AUtils_FormatStrWS(Value, Len);
end;

function GetNowDateTime(): TDateTime;
begin
  Result := AUtils_GetNowDateTime();
end;

function Init(): AError; stdcall;
begin
  Result := AUtils_Init();
end;

function IntToStr(Value: AInteger; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_IntToStr(Value, Res);
end;

function IntToStrP(Value: AInteger): APascalString; stdcall;
begin
  Result := AUtils_IntToStrP(Value);
end;

function IntToStrWS(Value: AInteger): AWideString; stdcall;
begin
  Result := AUtils_IntToStrWS(Value);
end;

function NormalizeFloat(Value: AFloat): AFloat; stdcall;
begin
  Result := AUtils_NormalizeFloat(Value);
end;

function NormalizeStr(const Value: AString_Type; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_NormalizeStr(Value, Res);
end;

function NormalizeStrP(const Value: APascalString): APascalString; stdcall;
begin
  Result := AUtils_NormalizeStrP(Value);
end;

function NormalizeStrSpace(const Value: AString_Type; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_NormalizeStrSpace(Value, Res);
end;

function NormalizeStrSpaceP(const Value: APascalString): APascalString; stdcall;
begin
  Result := AUtils_NormalizeStrSpaceP(Value);
end;

function NormalizeStrSpaceWS(const Value: AWideString): AWideString; stdcall;
begin
  Result := AUtils_NormalizeStrSpaceWS(Value);
end;

function NormalizeStrWS(const Value: AWideString): AWideString; stdcall;
begin
  Result := AUtils_NormalizeStrWS(Value);
end;

function Power(Base, Exponent: AFloat): AFloat; stdcall;
begin
  Result := AUtils_Power(Base, Exponent);
end;

function ReplaceComma(const S: AString_Type; DecimalSeparator: AChar;
    ClearSpace: ABoolean; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AUtils_ReplaceComma(S, DecimalSeparator, ClearSpace, Res);
end;

function ReplaceCommaP(const S: APascalString; DecimalSeparator: AChar = #0;
    ClearSpace: ABoolean = True): APascalString; stdcall;
begin
  Result := AUtils_ReplaceCommaP(S, DecimalSeparator, ClearSpace);
end;

function ReplaceCommaWS(const S: AWideString; DecimalSeparator: AChar = #0;
    ClearSpace: ABoolean = True): AWideString; stdcall;
begin
  Result := AUtils_ReplaceCommaWS(S, DecimalSeparator, ClearSpace);
end;

function Round2(Value: Real; Digits1, DigitsAfterComma: Integer): Real; stdcall;
begin
  Result := AUtils_Round2(Value, Digits1, DigitsAfterComma);
end;

function Sleep(Milliseconds: AUInt): AError; stdcall;
begin
  Result := AUtils_Sleep(Milliseconds);
end;

procedure Sleep02(Milliseconds: AUInt); stdcall;
begin
  AUtils_Sleep(Milliseconds);
end;

function String_ToLowerP(const S: APascalString): APascalString; stdcall;
begin
  Result := AString_ToLowerP(S);
end;

function String_ToLowerWS(const S: AWideString): AWideString; stdcall;
begin
  Result := AString_ToLowerP(S);
end;

function String_ToUpper(const S: AString_Type; out Res: AString_Type): AInteger; stdcall;
begin
  Result := AString_ToUpper(S, Res);
end;

function String_ToUpperP(const S: APascalString): APascalString; stdcall;
begin
  Result := AString_ToUpperP(S);
end;

function String_ToUpperWS(const S: AWideString): AWideString; stdcall;
begin
  Result := AString_ToUpperWS(S);
end;

function StrToDate(const Value: AString_Type): TDateTime; stdcall;
begin
  try
    Result := AUtils_StrToDateP(AString_ToPascalString(Value));
  except
    Result := 0;
  end;
end;

function StrToDateA(Value: PAnsiChar): TDateTime; stdcall;
begin
  Result := AUtils_StrToDateP(Value);
end;

function StrToDateWS(const Value: AWideString): TDateTime; stdcall;
begin
  Result := AUtils_StrToDateP(Value);
end;

function StrToFloat(const Value: AString_Type): AFloat; stdcall;
begin
  try
    Result := AUtils_StrToFloatP(AString_ToPascalString(Value));
  except
    Result := 0;
  end;
end;

function StrToFloat1(const S: AString_Type; DefValue: AFloat): AFloat; stdcall;
begin
  Result := StrToFloatDef(S, DefValue);
end;

function StrToFloatDef(const S: AString_Type; DefValue: AFloat): AFloat; stdcall;
begin
  try
    Result := AUtils_StrToFloatDefP(AString_ToPascalString(S), DefValue);
  except
    Result := DefValue;
  end;
end;

function StrToFloatDefP(const S: APascalString; DefValue: AFloat): AFloat; stdcall;
begin
  Result := AUtils_StrToFloatDefP(S, DefValue);
end;

function StrToFloatDefWS(const S: AWideString; DefValue: AFloat): AFloat; stdcall;
begin
  Result := AUtils_StrToFloatDefP(S, DefValue);
end;

function StrToFloatP(const S: APascalString): AFloat; stdcall;
begin
  Result := AUtils_StrToFloatDefP(S, 0);
end;

function StrToFloatWS(const S: AWideString): AFloat; stdcall;
begin
  Result := AUtils_StrToFloatDefP(S, 0);
end;

function StrToInt(const Value: AString_Type): AInteger; stdcall;
begin
  try
    Result := AUtils_StrToIntP(AString_ToPascalString(Value));
  except
    Result := 0;
  end;
end;

function StrToInt1(const S: APascalString; DefValue: AInteger = 0): AInteger; stdcall;
begin
  Result := AUtils_StrToIntDefP(S, DefValue);
end;

function StrToIntDefP(const S: APascalString; DefValue: AInteger): AInteger; stdcall;
begin
  Result := AUtils_StrToIntDefP(S, DefValue);
end;

function StrToIntDefWS(const S: AWideString; DefValue: AInteger): AInteger; stdcall;
begin
  Result := AUtils_StrToIntDefP(S, DefValue);
end;

function StrToIntP(const S: APascalString): AInteger; stdcall;
begin
  Result := AUtils_StrToIntDefP(S, 0);
end;

function StrToIntWS(const S: AWideString): AInteger; stdcall;
begin
  Result := AUtils_StrToIntDefP(S, 0);
end;

function Time_Now: TDateTime; stdcall;
begin
  Result := AUtils_GetNowDateTime();
end;

function Trim(const S: AString_Type; out Res: AString_Type): AInteger; stdcall;
begin
  try
    Result := AString_AssignP(Res, AUtils_TrimP(AString_ToPascalString(S)));
  except
    Result := 0;
  end;
end;

function TrimP(const S: APascalString): APascalString; stdcall;
begin
  Result := AUtils_TrimP(S);
end;

function TrimWS(const S: AWideString): AWideString; stdcall;
begin
  Result := AUtils_TrimP(S);
end;

function TryStrToDate(const S: AString_Type; var Value: TDateTime): ABoolean; stdcall;
begin
  try
    Result := AUtils_TryStrToDateP(AString_ToPascalString(S), Value);
  except
    Result := False;
  end;
end;

function TryStrToDateP(const S: APascalString; var Value: TDateTime): ABoolean; stdcall;
begin
  Result := AUtils_TryStrToDateP(S, Value);
end;

function TryStrToDateWS(const S: AWideString; var Value: TDateTime): ABoolean; stdcall;
begin
  Result := AUtils_TryStrToDateP(S, Value);
end;

function TryStrToFloat(const S: AString_Type; var Value: AFloat): ABoolean; stdcall;
begin
  try
    Result := AUtils_TryStrToFloatP(AString_ToPascalString(S), Value);
  except
    Result := False;
  end;
end;

function TryStrToFloat32(const S: AString_Type; var Value: AFloat32): ABoolean; stdcall;
begin
  try
    Result := AUtils_TryStrToFloat32P(AString_ToPascalString(S), Value);
  except
    Result := False;
  end;
end;

function TryStrToFloat32P(const S: APascalString; var Value: AFloat32): ABoolean; stdcall;
begin
  Result := AUtils_TryStrToFloat32P(S, Value);
end;

function TryStrToFloat32WS(const S: AWideString; var Value: AFloat32): ABoolean; stdcall;
begin
  Result := AUtils_TryStrToFloat32P(S, Value);
end;

function TryStrToFloat64(const S: AString_Type; var Value: AFloat64): ABoolean; stdcall;
begin
  try
    Result := AUtils_TryStrToFloat64P(AString_ToPascalString(S), Value);
  except
    Result := False;
  end;
end;

function TryStrToFloat64P(const S: APascalString; var Value: AFloat64): ABoolean; stdcall;
begin
  Result := AUtils_TryStrToFloat64P(S, Value);
end;

function TryStrToFloat64WS(const S: AWideString; var Value: AFloat64): ABoolean; stdcall;
begin
  Result := AUtils_TryStrToFloat64P(S, Value);
end;

function TryStrToFloatP(const S: APascalString; var Value: AFloat): ABoolean; stdcall;
begin
  Result := AUtils_TryStrToFloatP(S, Value);
end;

function TryStrToFloatWS(const S: AWideString; var Value: AFloat): ABoolean; stdcall;
begin
  Result := AUtils_TryStrToFloatP(S, Value);
end;

function TryStrToInt(const S: AString_Type; var Value: AInteger): ABoolean; stdcall;
begin
  try
    Result := AUtils_TryStrToIntP(AString_ToPascalString(S), Value);
  except
    Result := False;
  end;
end;

function TryStrToIntWS(const S: AWideString; var Value: AInteger): ABoolean; stdcall;
begin
  Result := AUtils_TryStrToIntP(S, Value);
end;

function UpperStringP(const S: APascalString): APascalString; stdcall;
begin
  Result := AString_ToUpperP(S);
end;

{ Utils }

{$ifdef ADepr}

function Utils_FloatToStr(Value: AFloat): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrP(Value);
end;

function Utils_FloatToStrA(Value: AFloat; DigitsAfterComma: AInteger = 2): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrAP(Value, DigitsAfterComma);
end;

function Utils_FloatToStrB(Value: AFloat; DigitsAfterComma: AInteger): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrBP(Value, DigitsAfterComma);
end;

function Utils_FloatToStrC(Value: AFloat; DigitsAfterComma: AInteger): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrCP(Value, DigitsAfterComma);
end;

function Utils_FloatToStrD(Value: AFloat): APascalString; stdcall;
begin
  Result := AUtils_FloatToStrDP(Value);
end;

function Utils_FormatFloat(Value: AFloat; Count, Digits: AInteger): APascalString; stdcall;
begin
  Result := AUtils_FormatFloatP(Value, Count, Digits);
end;

function Utils_FormatInt(Value, Count: AInteger): APascalString; stdcall;
begin
  Result := AUtils_FormatIntP(Value, Count);
end;

function Utils_FormatStr(const Value: APascalString; Len: AInteger): APascalString; stdcall;
begin
  Result := AUtils_FormatStrP(Value, Len);
end;

function Utils_FormatStrAnsi(const Value: AnsiString; Len: AInteger): AnsiString; stdcall;
begin
  Result := AUtils_FormatStrAnsi(Value, Len);
end;

function Utils_NormalizeFloat(Value: AFloat): AFloat; stdcall;
begin
  Result := AUtils_NormalizeFloat(Value);
end;

function Utils_NormalizeStr(const Value: APascalString): APascalString; stdcall;
begin
  Result := AUtils_NormalizeStrP(Value);
end;

function Utils_NormalizeStrSpace(const Value: APascalString): APascalString; stdcall;
begin
  Result := AUtilsMain.Utils_NormalizeStrSpace(Value);
end;

function Utils_Power(Base, Exponent: AFloat): AFloat; stdcall;
begin
  Result := AUtils_Power(Base, Exponent);
end;

function Utils_ReplaceComma(const S: APascalString; DecimalSeparator: AChar; ClearSpace: ABoolean): APascalString; stdcall;
begin
  AUtilsMain.Utils_ReplaceComma(S, DecimalSeparator, ClearSpace);
end;

procedure Utils_Sleep(Milliseconds: AUInt); stdcall;
begin
  AUtils_Sleep(Milliseconds);
end;

function Utils_String_ToLower(const S: APascalString): APascalString;
begin
  Result := AString_ToLowerP(S);
end;

function Utils_String_ToUpper(const S: APascalString): APascalString;
begin
  Result := AString_ToUpperP(S);
end;

function Utils_StrToDate(const Value: APascalString): TDateTime;
begin
  Result := AUtils_StrToDateP(Value);
end;

function Utils_StrToFloat(const Value: APascalString): AFloat;
begin
  Result := AUtils_StrToFloatP(Value);
end;

function Utils_StrToFloat1(const S: APascalString; DefValue: AFloat = 0): AFloat;
begin
  Result := AUtils_StrToFloatDefP(S, DefValue);
end;

function Utils_StrToInt(const Value: APascalString): AInteger;
begin
  Result := AUtils_StrToIntP(Value);
end;

function Utils_StrToInt1(const S: APascalString; DefValue: AInteger = 0): AInteger;
begin
  Result := AUtils_StrToIntDefP(S, DefValue);
end;

function Utils_Time_Now: TDateTime;
begin
  Result := AUtils_GetNowDateTime();
end;

function Utils_Trim(const S: APascalString): APascalString;
begin
  Result := AUtils_TrimP(S);
end;

function Utils_TryStrToDate(const S: APascalString; var Value: TDateTime): Boolean;
begin
  Result := AUtils_TryStrToDateP(S, Value);
end;

function Utils_TryStrToFloat(const S: APascalString; var Value: AFloat): ABoolean;
begin
  Result := AUtils_TryStrToFloatP(S, Value);
end;

function Utils_TryStrToFloat32(const S: APascalString; var Value: AFloat32): ABoolean;
begin
  Result := AUtils_TryStrToFloat32P(S, Value);
end;

function Utils_TryStrToFloat64(const S: APascalString; var Value: AFloat64): ABoolean;
begin
  Result := AUtils_TryStrToFloat64P(S, Value);
end;

function Utils_TryStrToInt(const S: APascalString; var Value: AInteger): ABoolean;
begin
  Result := AUtils_TryStrToIntP(S, Value);
end;

function Utils_UpperString(const S: APascalString): APascalString;
begin
  Result := AString_ToUpperP(S);
end;

{$endif ADepr}

end.

