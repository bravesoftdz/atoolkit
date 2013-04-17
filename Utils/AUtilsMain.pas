{**
@Abstract AUtils - Main
@Author Prof1983 <prof1983@ya.ru>
@Created 28.09.2011
@LastMod 17.04.2013
}
unit AUtilsMain;

{$define AStdCall}

interface

uses
  SysUtils,
  ABase,
  AStringBaseUtils,
  AStringMain,
  AStringUtils,
  ASystemMain;

// --- AUtils ---

function AUtils_ChangeFileExt(const FileName, Extension: AString_Type;
    out Res: AString_Type): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUtils_ChangeFileExtP(const FileName, Extension: APascalString): APascalString; stdcall;

function AUtils_ChangeFileExtWS(const FileName, Extension: AWideString): AWideString; stdcall;

function AUtils_CharToUpper(Value: AChar): AChar; stdcall;

function AUtils_DateToStr(Value: TDateTime; out Res: AString_Type): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUtils_DateToStrP(Value: TDateTime): APascalString; stdcall;

function AUtils_DateToStrWS(Value: TDateTime): AWideString; stdcall;

function AUtils_DeleteFile(const FileName: AString_Type): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUtils_DeleteFileP(const FileName: APascalString): AError; stdcall;

function AUtils_DeleteFileWS(const FileName: AWideString): AError; stdcall;

function AUtils_DirectoryExists(const Directory: AString_Type): ABoolean; {$ifdef AStdCall}stdcall;{$endif}

function AUtils_DirectoryExistsP(const Directory: APascalString): ABoolean; stdcall;

function AUtils_ExpandFileName(const FileName: AString_Type; out Res: AString_Type): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUtils_ExpandFileNameP(const FileName: APascalString): APascalString; stdcall;

function AUtils_ExpandFileNameWS(const FileName: AWideString): AWideString; stdcall;

function AUtils_ExtractFileExt(const FileName: AString_Type; out Res: AString_Type): AInteger; stdcall;

function AUtils_ExtractFileExtP(const FileName: APascalString): APascalString; stdcall;

function AUtils_ExtractFileExtWS(const FileName: AWideString): AWideString; stdcall;

function AUtils_ExtractFileName(const FileName: AString_Type; out Res: AString_Type): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUtils_ExtractFileNameP(const FileName: APascalString): APascalString; stdcall;

function AUtils_ExtractFilePath(const FileName: AString_Type; out Res: AString_Type): AInteger; stdcall;

function AUtils_ExtractFilePathP(const FileName: APascalString): APascalString; stdcall;

function AUtils_ExtractFilePathWS(const FileName: AWideString): AWideString; stdcall;

function AUtils_FileExists(const FileName: AString_Type): ABoolean; stdcall;

function AUtils_FileExistsP(const FileName: APascalString): ABoolean; stdcall;

function AUtils_FileExistsWS(const FileName: AWideString): ABoolean; stdcall;

function AUtils_Fin(): AError; stdcall;

function AUtils_FloatToStr(Value: AFloat; out Res: AString_Type): AInteger; stdcall;

function AUtils_FloatToStr2(Value: AFloat; DigitsAfterComma: AInteger;
    ReplaceComma, Delimer: ABoolean; out Res: AString_Type): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUtils_FloatToStr2P(Value: AFloat; DigitsAfterComma: AInteger;
    ReplaceComma, Delimer: ABoolean): APascalString; stdcall;

function AUtils_FloatToStr2WS(Value: AFloat; DigitsAfterComma: AInteger;
    ReplaceComma, Delimer: ABoolean): AWideString; stdcall;

function AUtils_FloatToStrAP(Value: AFloat; DigitsAfterComma: AInteger = 2): APascalString; stdcall;

function AUtils_FloatToStrBP(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; stdcall;

function AUtils_FloatToStrCP(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; stdcall;

function AUtils_FloatToStrDP(Value: AFloat): APascalString; stdcall;

function AUtils_FloatToStrP(Value: AFloat): APascalString; stdcall;

function AUtils_FloatToStrWS(Value: AFloat): AWideString; stdcall;

function AUtils_ForceDirectories(const Dir: AString_Type): AError; stdcall;

function AUtils_ForceDirectoriesA(Dir: AStr): AError; stdcall;

function AUtils_ForceDirectoriesP(const Dir: APascalString): AError;

function AUtils_FormatFloat(Value: AFloat; Count, Digits: AInteger;
    out Res: AString_Type): AInteger; stdcall;

function AUtils_FormatFloatP(Value: AFloat; DigitsBeforeComma, DigitsAfterComma: AInteger): APascalString; stdcall;

function AUtils_FormatFloatWS(Value: AFloat; DigitsBeforeComma, DigitsAfterComma: AInteger): AWideString; stdcall;

function AUtils_FormatInt(Value, Count: AInteger; out Res: AString_Type): AInteger; stdcall;

function AUtils_FormatIntP(Value, Count: AInteger): APascalString; stdcall;

function AUtils_FormatIntWS(Value, Count: AInteger): AWideString; stdcall;

function AUtils_FormatStr(const Value: AString_Type; Len: AInteger; out Res: AString_Type): AInteger; stdcall;

function AUtils_FormatStrAnsi(const Value: AnsiString; Len: AInteger): AnsiString; stdcall;

function AUtils_FormatStrP(const Value: APascalString; Len: AInteger): APascalString; stdcall;

function AUtils_FormatStrStr(const FormatStr, S: AString_Type; out Res: AString_Type): AError; stdcall;

function AUtils_FormatStrStrA(FormatStr, S: AStr; Res: AStr; MaxLen: AInt): AError; stdcall;

function AUtils_FormatStrStrP(const FormatStr, S: APascalString): APascalString; stdcall;

function AUtils_FormatStrStrWS(const FormatStr, S: AWideString): AWideString; stdcall;

function AUtils_FormatStrWS(const Value: AWideString; Len: AInteger): AWideString; stdcall;

function AUtils_GetNowDateTime(): TDateTime; {$ifdef AStdCall}stdcall;{$endif}

function AUtils_Init(): AError; stdcall;

function AUtils_IntToStr(Value: AInteger; out Res: AString_Type): AInteger; stdcall;

function AUtils_IntToStrP(Value: AInteger): APascalString; stdcall;

function AUtils_IntToStrWS(Value: AInteger): AWideString; stdcall;

function AUtils_NormalizeFloat(Value: AFloat): AFloat; stdcall;

function AUtils_NormalizeStr(const Value: AString_Type; out Res: AString_Type): AInteger; stdcall;

function AUtils_NormalizeStrP(const Value: APascalString): APascalString; stdcall;

function AUtils_NormalizeStrSpace(const Value: AString_Type; out Res: AString_Type): AInteger; stdcall;

function AUtils_NormalizeStrSpaceP(const Value: APascalString): APascalString; stdcall;

function AUtils_NormalizeStrSpaceWS(const Value: AWideString): AWideString; stdcall;

function AUtils_NormalizeStrWS(const Value: AWideString): AWideString; stdcall;

function AUtils_Power(Base, Exponent: AFloat): AFloat; stdcall;

function AUtils_ReplaceComma(const S: AString_Type; DecimalSeparator: AChar;
    ClearSpace: ABoolean; out Res: AString_Type): AInteger; stdcall;

function AUtils_ReplaceCommaP(const S: APascalString; DecimalSeparator: AChar = #0;
    ClearSpace: ABoolean = True): APascalString; stdcall;

function AUtils_ReplaceCommaWS(const S: AWideString; DecimalSeparator: AChar = #0;
    ClearSpace: ABoolean = True): AWideString; stdcall;

function AUtils_Round2(Value: Real; Digits1, DigitsAfterComma: Integer): Real; stdcall;

function AUtils_Sleep(Milliseconds: AUInt): AError; stdcall;

function AUtils_StrToDate(const Value: AString_Type): TDateTime; stdcall;

function AUtils_StrToDateP(const Value: APascalString): TDateTime;

function AUtils_StrToFloat(const Value: AString_Type): AFloat; stdcall;

function AUtils_StrToFloatDef(const S: AString_Type; DefValue: AFloat): AFloat; stdcall;

{** ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
    � �������� ������ ����� �������������� ��������� � �������� �������. }
function AUtils_StrToFloatDefP(const S: APascalString; DefValue: AFloat): AFloat;

function AUtils_StrToFloatP(const Value: APascalString): AFloat;

function AUtils_StrToInt(const Value: AString_Type): AInt; stdcall;

function AUtils_StrToIntDef(const S: AString_Type; DefValue: AInt): AInt; stdcall;

function AUtils_StrToIntDefP(const S: APascalString; DefValue: AInteger): AInteger; 

function AUtils_StrToIntP(const Value: APascalString): AInteger;

function AUtils_Trim(var S: AString_Type): AError; stdcall;

function AUtils_TrimP(const S: APascalString): APascalString;

function AUtils_TryStrToDate(const S: AString_Type; var Value: TDateTime): AError; stdcall;

function AUtils_TryStrToDateP(const S: APascalString; var Value: TDateTime): ABoolean;

{** ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
    � �������� ������ ����� �������������� ��������� � �������� �������. }
function AUtils_TryStrToFloatP(const S: APascalString; var Value: AFloat): ABoolean;

function AUtils_TryStrToFloat32(const S: AString_Type; var Value: AFloat32): AError; stdcall;

{** ����������� ������ � Float32. ������������ ����� ���� ��� �����, ��� � �������.
    � �������� ������ ����� �������������� ��������� � �������� �������. }
function AUtils_TryStrToFloat32P(const S: APascalString; var Value: AFloat32): ABoolean;

function AUtils_TryStrToFloat64(const S: AString_Type; var Value: AFloat64): AError; {$ifdef AStdCall}stdcall;{$endif}

{** ����������� ������ � Float64. ������������ ����� ���� ��� �����, ��� � �������.
    � �������� ������ ����� �������������� ��������� � �������� �������. }
function AUtils_TryStrToFloat64P(const S: APascalString; var Value: AFloat64): ABoolean;

function AUtils_TryStrToInt(const S: AString_Type; var Value: AInt): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUtils_TryStrToIntP(const S: APascalString; var Value: AInteger): ABoolean;

// --- Utils ---

function Utils_ExtractFileExt(const FileName: APascalString): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_ExtractFileExtP()'{$endif};

function Utils_ExtractFilePath(const FileName: APascalString): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_ExtractFilePathP()'{$endif};

function Utils_FileExists(const FileName: APascalString): ABoolean; deprecated {$ifdef ADeprText}'Use AUtils_FileExistsP()'{$endif};

//** ����������� ����� � ������.
function Utils_FloatToStr(Value: AFloat): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_FloatToStrP()'{$endif};

//** ����������� ����� � ������.
function Utils_FloatToStr2(Value: AFloat; DigitsAfterComma: Integer; ReplaceComma,
    Delimer: ABoolean): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_FloatToStr2P()'{$endif};

//** ����������� ����� � ������ c ����� ������� ����� �������
function Utils_FloatToStrA(Value: AFloat; DigitsAfterComma: AInteger = 2): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_FloatToStrAP()'{$endif};

//** ����������� ����� � ������ ��� ������ � �� (SQL). ��� SQL ��������� ����������� - �����.
function Utils_FloatToStrB(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_FloatToStrBP()'{$endif};

function Utils_FloatToStrC(Value: AFloat; DigitsAfterComma: Integer = 2): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_FloatToStrCP()'{$endif};

function Utils_FloatToStrD(Value: AFloat): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_FloatToStrDP()'{$endif};

function Utils_FormatFloat(Value: AFloat; DigitsBeforeComma,
    DigitsAfterComma: AInteger): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_FormatFloatP()'{$endif};

//** ����������� ����� � ������.
function Utils_IntToStr(Value: AInteger): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_IntToStrP()'{$endif};

function Utils_NormalizeStrSpace(const Value: APascalString): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_NormalizeStrSpaceP()'{$endif};

{ �������� ��� ����� �� ������� ��� ��� ������� �� ����� � ����������� �� ������������ ��������.
  ���� �������� DecimalSeparator ������, �� ������������ ��������� ������������. }
function Utils_ReplaceComma(const S: APascalString; DecimalSeparator: AChar = #0; ClearSpace: ABoolean = True): APascalString;

{ ��������� �������� �� ���������� ���-�� �������� ���� � �������� �� ���������� ���-�� ������ ����� �������.
  Digits1 - ���-�� �������� ���� (Meaning numbers)
  DigitsAfterComma - ����������� ����������� ���-�� ������ ����� ������� (Numbers after a comma) }
function Utils_Round2(Value: Real; Digits1, DigitsAfterComma: Integer): Real;

function Utils_String_ToLower(const S: APascalString): APascalString; deprecated {$ifdef ADeprText}'Use AString_ToLowerP()'{$endif};

function Utils_String_ToUpper(const S: APascalString): APascalString; deprecated {$ifdef ADeprText}'Use AString_ToUpperP()'{$endif};

{ Trims leading and trailing spaces and control characters from a string.
  ������� ������ � ��������� ������� }
function Utils_Trim(const S: APascalString): APascalString; deprecated {$ifdef ADeprText}'Use AUtils_TrimP()'{$endif};

function Utils_TryStrToDate(const S: APascalString; var Value: TDateTime): ABoolean; deprecated {$ifdef ADeprText}'Use AUtils_TryStrToDateP()'{$endif};

{ ����������� ������ � Float. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function Utils_TryStrToFloat(const S: APascalString; var Value: AFloat): ABoolean; deprecated {$ifdef ADeprText}'Use AUtils_TryStrToFloatP()'{$endif};

{ ����������� ������ � Float32. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function Utils_TryStrToFloat32(const S: APascalString; var Value: AFloat32): ABoolean; deprecated {$ifdef ADeprText}'Use AUtils_TryStrToFloat32P()'{$endif};

{ ����������� ������ � Float64. ������������ ����� ���� ��� �����, ��� � �������.
  � �������� ������ ����� �������������� ��������� � �������� �������. }
function Utils_TryStrToFloat64(const S: APascalString; var Value: AFloat64): ABoolean; deprecated {$ifdef ADeprText}'Use AUtils_TryStrToFloat64P()'{$endif};

function Utils_TryStrToInt(const S: APascalString; var Value: AInteger): ABoolean; deprecated {$ifdef ADeprText}'Use AUtils_TryStrToIntP()'{$endif};

implementation

// --- AUtils ---

function AUtils_ChangeFileExt(const FileName, Extension: AString_Type;
    out Res: AString_Type): AError;
var
  S: APascalString;
begin
  S := AUtils_ChangeFileExtP(AString_ToPascalString(FileName), AString_ToPascalString(Extension));
  Result := AString_AssignP(Res, S);
end;

function AUtils_ChangeFileExtP(const FileName, Extension: APascalString): APascalString;
begin
  try
    Result := SysUtils.ChangeFileExt(FileName, Extension);
  except
    Result := '';
  end;
end;

function AUtils_ChangeFileExtWS(const FileName, Extension: AWideString): AWideString;
begin
  try
    Result := SysUtils.ChangeFileExt(FileName, Extension);
  except
    Result := '';
  end;
end;

function AUtils_CharToUpper(Value: AChar): AChar;
var
  S: String;
begin
  try
    SetLength(S, 1);
    S[1] := Value;
    Result := SysUtils.UpperCase(S)[1];
  except
    Result := #0;
  end;
end;

function AUtils_DateToStr(Value: TDateTime; out Res: AString_Type): AError;
var
  S: APascalString;
begin
  S := AUtils_DateToStrP(Value);
  Result := AString_AssignP(Res, S);
end;

function AUtils_DateToStrP(Value: TDateTime): APascalString;
begin
  try
    Result := SysUtils.DateToStr(Value);
  except
    Result := '';
  end;
end;

function AUtils_DateToStrWS(Value: TDateTime): AWideString;
begin
  try
    Result := SysUtils.DateToStr(Value);
  except
    Result := '';
  end;
end;

function AUtils_DeleteFile(const FileName: AString_Type): AError;
begin
  Result := AUtils_DeleteFileP(AString_ToPascalString(FileName));
end;

function AUtils_DeleteFileP(const FileName: APascalString): AError;
begin
  try
    if SysUtils.DeleteFile(FileName) then
      Result := 0
    else
      Result := -2;
  except
    Result := -1;
  end;
end;

function AUtils_DeleteFileWS(const FileName: AWideString): AError;
begin
  try
    if SysUtils.DeleteFile(FileName) then
      Result := 0
    else
      Result := -2;
  except
    Result := -1;
  end;
end;

function AUtils_DirectoryExists(const Directory: AString_Type): ABoolean;
begin
  Result := AUtils_DirectoryExistsP(AString_ToPascalString(Directory));
end;

function AUtils_DirectoryExistsP(const Directory: APascalString): ABoolean;
begin
  try
    Result := SysUtils.DirectoryExists(Directory);
  except
    Result := False;
  end;
end;

function AUtils_ExpandFileName(const FileName: AString_Type; out Res: AString_Type): AError;
var
  S: APascalString;
begin
  S := AUtils_ExpandFileNameP(AString_ToPascalString(FileName));
  Result := AString_AssignP(Res, S);
end;

function AUtils_ExpandFileNameP(const FileName: APascalString): APascalString;
begin
  try
    Result := SysUtils.ExpandFileName(FileName);
  except
    Result := '';
  end;
end;

function AUtils_ExpandFileNameWS(const FileName: AWideString): AWideString;
begin
  try
    Result := SysUtils.ExpandFileName(FileName);
  except
    Result := '';
  end;
end;

function AUtils_ExtractFileExt(const FileName: AString_Type; out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res,
        AUtils_ExtractFileExtP(AString_ToPascalString(FileName))
        );
  except
    Result := 0;
  end;
end;

function AUtils_ExtractFileExtP(const FileName: APascalString): APascalString;
begin
  try
    Result := SysUtils.ExtractFileExt(FileName);
  except
    Result := '';
  end;
end;

function AUtils_ExtractFileExtWS(const FileName: AWideString): AWideString;
begin
  try
    Result := SysUtils.ExtractFileExt(FileName);
  except
    Result := '';
  end;
end;

function AUtils_ExtractFileName(const FileName: AString_Type; out Res: AString_Type): AError;
var
  S: APascalString;
begin
  S := AUtils_ExtractFileNameP(AString_ToPascalString(FileName));
  Result := AString_AssignP(Res, S);
end;

function AUtils_ExtractFileNameP(const FileName: APascalString): APascalString;
begin
  try
    Result := SysUtils.ExtractFileName(FileName);
  except
    Result := '';
  end;
end;

function AUtils_ExtractFilePath(const FileName: AString_Type; out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res,
        AUtils_ExtractFilePathP(AString_ToPascalString(FileName))
        );
  except
    Result := 0;
  end;
end;

function AUtils_ExtractFilePathP(const FileName: APascalString): APascalString;
begin
  try
    Result := SysUtils.ExtractFilePath(FileName);
  except
    Result := '';
  end;
end;

function AUtils_ExtractFilePathWS(const FileName: AWideString): AWideString;
begin
  try
    Result := SysUtils.ExtractFilePath(FileName);
  except
    Result := '';
  end;
end;

function AUtils_FileExists(const FileName: AString_Type): ABoolean;
begin
  try
    Result := AUtils_FileExistsP(AString_ToPascalString(FileName));
  except
    Result := False;
  end;
end;

function AUtils_FileExistsP(const FileName: APascalString): ABoolean;
begin
  try
    Result := SysUtils.FileExists(FileName);
  except
    Result := False;
  end;
end;

function AUtils_FileExistsWS(const FileName: AWideString): ABoolean;
begin
  Result := AUtils_FileExistsP(FileName);
end;

function AUtils_Fin(): AError;
begin
  Result := 0;
end;

function AUtils_FloatToStr(Value: AFloat; out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res, AUtils_FloatToStrP(Value));
  except
    Result := 0;
  end;
end;

function AUtils_FloatToStr2(Value: AFloat; DigitsAfterComma: AInteger;
    ReplaceComma, Delimer: ABoolean; out Res: AString_Type): AError;
var
  S: APascalString;
begin
  S := AUtils_FloatToStr2P(Value, DigitsAfterComma, ReplaceComma, Delimer);
  Result := AString_AssignP(Res, S);
end;

function AUtils_FloatToStr2P(Value: AFloat; DigitsAfterComma: AInteger;
    ReplaceComma, Delimer: ABoolean): APascalString;
begin
  if Delimer then
    Result := AUtils_FloatToStrCP(Value, DigitsAfterComma)
  else
    Result := AUtils_FloatToStrAP(Value, DigitsAfterComma);
  if ReplaceComma then
    Result := AUtils_ReplaceCommaP(Result);
end;

function AUtils_FloatToStr2WS(Value: AFloat; DigitsAfterComma: AInteger;
    ReplaceComma, Delimer: ABoolean): AWideString;
begin
  try
    if Delimer then
      Result := AUtils_FloatToStrCP(Value, DigitsAfterComma)
    else
      Result := AUtils_FloatToStrAP(Value, DigitsAfterComma);
    if ReplaceComma then
      Result := AUtils_ReplaceCommaP(Result);
  except
    Result := '';
  end;
end;

function AUtils_FloatToStrAP(Value: AFloat; DigitsAfterComma: AInteger): APascalString;
begin
  try
    Result := SysUtils.FloatToStrF(Value, ffFixed, 10, DigitsAfterComma);
  except
    Result := '';
  end;
end;

function AUtils_FloatToStrBP(Value: AFloat; DigitsAfterComma: AInteger): APascalString; stdcall;
begin
  try
    Result := AUtilsMain.Utils_ReplaceComma(AUtils_FloatToStrAP(Value, DigitsAfterComma), '.');
  except
    Result := '';
  end;
end;

function AUtils_FloatToStrCP(Value: AFloat; DigitsAfterComma: AInteger): APascalString; stdcall;
begin
  try
    case DigitsAfterComma of
      0: Result := SysUtils.FormatFloat('### ### ### ##0', Value);
      1: Result := SysUtils.FormatFloat('### ### ### ##0.0', Value);
      2: Result := SysUtils.FormatFloat('### ### ### ##0.00', Value);
      3: Result := SysUtils.FormatFloat('### ### ### ##0.000', Value);
      4: Result := SysUtils.FormatFloat('### ### ### ##0.0000', Value);
      5: Result := SysUtils.FormatFloat('### ### ### ##0.00000', Value);
    else
      Result := SysUtils.FormatFloat('### ### ### ##0.00', Value);
    end;
  except
    Result := '';
  end;
end;

function AUtils_FloatToStrDP(Value: AFloat): APascalString; stdcall;
begin
  try
    Result := SysUtils.FormatFloat(',0.00', Value);
  except
    Result := '';
  end;
end;

function AUtils_FloatToStrP(Value: AFloat): APascalString;
begin
  try
    Result := SysUtils.FloatToStr(Value);
  except
    Result := '';
  end;
end;

function AUtils_FloatToStrWS(Value: AFloat): AWideString;
begin
  try
    Result := AUtilsMain.Utils_FloatToStr(Value);
  except
    Result := '';
  end;
end;

function AUtils_ForceDirectories(const Dir: AString_Type): AError;
begin
  Result := AUtils_ForceDirectoriesP(AString_ToPascalString(Dir));
end;

function AUtils_ForceDirectoriesA(Dir: AStr): AError;
begin
  Result := AUtils_ForceDirectoriesP(Dir);
end;

function AUtils_ForceDirectoriesP(const Dir: APascalString): AError;
begin
  try
    if ForceDirectories(Dir) then
      Result := 0
    else
      Result := -2;
  except
    Result := -1;
  end;
end;

function AUtils_FormatFloat(Value: AFloat; Count, Digits: AInteger;
    out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res, AUtils_FormatFloatP(Value, Count, Digits));
  except
    Result := 0;
  end;
end;

function AUtils_FormatFloatP(Value: AFloat; DigitsBeforeComma, DigitsAfterComma: AInteger): APascalString;
var
  FormatS: string;
begin
  try
    if (DigitsBeforeComma >= 0) and (DigitsBeforeComma <= 9) and (DigitsAfterComma >= 0) and (DigitsAfterComma <= 9) then
    begin
      FormatS := '%' + Chr(Ord('0')+DigitsBeforeComma) + '.' + Chr(Ord('0')+DigitsAfterComma) + 'f';
      Result := Format(FormatS,[Value]);
    end
    else
      Result := AUtils_FloatToStrBP(Value, DigitsAfterComma);
  except
    Result := '';
  end;
end;

function AUtils_FormatFloatWS(Value: AFloat; DigitsBeforeComma, DigitsAfterComma: AInteger): AWideString;
begin
  try
    Result := AUtilsMain.Utils_FormatFloat(Value, DigitsBeforeComma, DigitsAfterComma);
  except
    Result := '';
  end;
end;

function AUtils_FormatInt(Value, Count: AInteger; out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res, AUtils_FormatIntP(Value, Count));
  except
    Result := 0;
  end;
end;

function AUtils_FormatIntP(Value, Count: AInteger): APascalString;
begin
  try
    if (Count > 0) and (Count <= 9) then
      Result := Format('%'+Chr(Ord('0')+Count)+'d',[Value])
    else
      Result := SysUtils.IntToStr(Value);
  except
    Result := '';
  end;
end;

function AUtils_FormatIntWS(Value, Count: AInteger): AWideString;
begin
  try
    Result := AUtils_FormatIntP(Value, Count);
  except
    Result := '';
  end;
end;

function AUtils_FormatStr(const Value: AString_Type; Len: AInteger; out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res,
        AUtils_FormatStrP(AString_ToPascalString(Value), Len)
        );
  except
    Result := 0;
  end;
end;

function AUtils_FormatStrAnsi(const Value: AnsiString; Len: AInteger): AnsiString;
begin
  if (Len = 0) then
  begin
    Result := '';
    Exit;
  end;

  try
    if (Length(Value) = Abs(Len)) then
      Result := Value
    else if (Length(Value) > Abs(Len)) then
      Result := Copy(Value, 1, Abs(Len))
    else
    begin
      if (Len > 0) then
        Result := Value
      else
      begin
        Len := -Len;
        SetLength(Result, Len);
        FillChar(Result[1], Len, ' ');
        Move(Value[1], Result[Len-Length(Value)+1], Length(Value));
      end;
    end;
  except
    Result := '';
  end;
end;

function AUtils_FormatStrP(const Value: APascalString; Len: AInteger): APascalString;
begin
  try
    Result := AUtils_FormatStrAnsi(Value, Len);
  except
    Result := '';
  end;
end;

function AUtils_FormatStrStr(const FormatStr, S: AString_Type; out Res: AString_Type): AError;
begin
  Result := AString_AssignP(Res, AUtils_FormatStrStrP(AString_ToPascalString(FormatStr), AString_ToPascalString(S)));
end;

function AUtils_FormatStrStrA(FormatStr, S: AStr; Res: AStr; MaxLen: AInt): AError;
var
  SRes: APascalString;
begin
  SRes := AUtils_FormatStrStrP(AStr_ToPascalString(FormatStr), AStr_ToPascalString(S));
  Result := AStr_AssignP(Res, SRes, MaxLen);
end;

function AUtils_FormatStrStrP(const FormatStr, S: APascalString): APascalString;
begin
  try
    Result := Format(FormatStr, [S]);
  except
    Result := FormatStr;
  end;
end;

function AUtils_FormatStrStrWS(const FormatStr, S: AWideString): AWideString;
begin
  try
    Result := Format(FormatStr, [S]);
  except
    Result := FormatStr;
  end;
end;

function AUtils_FormatStrWS(const Value: AWideString; Len: AInteger): AWideString;
begin
  try
    Result := AUtils_FormatStrAnsi(AnsiString(Value), Len);
  except
    Result := '';
  end;
end;

function AUtils_GetNowDateTime(): TDateTime;
begin
  try
    Result := SysUtils.Now();
  except
    Result := 0;
  end;
end;

function AUtils_Init(): AError;
begin
  if (ASystem_Init() < 0) then
  begin
    Result := -2;
    Exit;
  end;

  Result := 0;
end;

function AUtils_IntToStr(Value: AInteger; out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res, AUtils_IntToStrP(Value));
  except
    Result := 0;
  end;
end;

function AUtils_IntToStrP(Value: AInteger): APascalString;
begin
  try
    Result := SysUtils.IntToStr(Value);
  except
    Result := '';
  end;
end;

function AUtils_IntToStrWS(Value: AInteger): AWideString;
begin
  try
    Result := SysUtils.IntToStr(Value);
  except
    Result := '';
  end;
end;

function AUtils_NormalizeFloat(Value: AFloat): AFloat;
begin
  try
    Result := AUtils_StrToFloatP(AUtils_FloatToStrAP(Value));
  except
    Result := 0;
  end;
end;

function AUtils_NormalizeStr(const Value: AString_Type; out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res,
        AUtils_NormalizeStrP(AString_ToPascalString(Value))
        );
  except
    Result := 0;
  end;
end;

function AUtils_NormalizeStrP(const Value: APascalString): APascalString;
var
  I: Integer;
  S: string;
begin
  try
    S := Value;
    for I := 1 to Length(S) do
    begin
      if (Ord(S[I]) < 31) then // ������
        S[I] := '#';
    end;
    Result := S;
  except
    Result := '';
  end;
end;

function AUtils_NormalizeStrSpace(const Value: AString_Type; out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res,
        AUtils_NormalizeStrSpaceP(AString_ToPascalString(Value))
        );
  except
    Result := 0;
  end;
end;

function AUtils_NormalizeStrSpaceP(const Value: APascalString): APascalString; stdcall;
var
  I: Integer;
  J: Integer;
begin
  try
    SetLength(Result, Length(Value));
    I := 0;
    J := 0;
    while (I < Length(Value)) do
    begin
      Inc(I);
      Inc(J);
      if (I < Length(Value)) and (Value[I] = #13) and (Value[I+1] = #10) then
      begin
        Result[J] := ' ';
        Inc(I);
      end
      else if (Ord(Result[I]) < 31) then // ������
        Result[J] := ' '
      else
        Result[J] := Value[I];
    end;
    SetLength(Result, J);
  except
    Result := '';
  end;
end;

function AUtils_NormalizeStrSpaceWS(const Value: AWideString): AWideString;
begin
  try
    Result := AUtilsMain.Utils_NormalizeStrSpace(Value);
  except
    Result := '';
  end;
end;

function AUtils_NormalizeStrWS(const Value: AWideString): AWideString;
begin
  Result := AUtils_NormalizeStrP(Value);
end;

function AUtils_Power(Base, Exponent: AFloat): AFloat;
begin
  try
    Result := Exp(Exponent * Ln(Base));
  except
    Result := 0;
  end;
end;

function AUtils_ReplaceComma(const S: AString_Type; DecimalSeparator: AChar;
    ClearSpace: ABoolean; out Res: AString_Type): AInteger;
begin
  try
    Result := AString_AssignP(Res,
        AUtils_ReplaceCommaP(AString_ToPascalString(S), DecimalSeparator, ClearSpace)
        );
  except
    Result := 0;
  end;
end;

function AUtils_ReplaceCommaP(const S: APascalString; DecimalSeparator: AChar;
    ClearSpace: ABoolean): APascalString;
begin
  try
    Result := AUtilsMain.Utils_ReplaceComma(S, DecimalSeparator, ClearSpace);
  except
    Result := '';
  end;
end;

function AUtils_ReplaceCommaWS(const S: AWideString; DecimalSeparator: AChar;
    ClearSpace: ABoolean): AWideString;
begin
  try
    Result := AUtilsMain.Utils_ReplaceComma(S, DecimalSeparator, ClearSpace);
  except
    Result := '';
  end;
end;

function AUtils_Round2(Value: Real; Digits1, DigitsAfterComma: Integer): Real;
begin
  try
    Result := Utils_Round2(Value, Digits1, DigitsAfterComma);
  except
    Result := 0;
  end;
end;

function AUtils_Sleep(Milliseconds: AUInt): AError;
begin
  try
    ASystem_ProcessMessages();
    SysUtils.Sleep(Milliseconds);
    Result := 0;
  except
    Result := -1;
  end;
end;

function AUtils_StrToDate(const Value: AString_Type): TDateTime;
begin
  try
    Result := AUtils_StrToDateP(AString_ToPascalString(Value));
  except
    Result := 0;
  end;
end;

function AUtils_StrToDateP(const Value: APascalString): TDateTime;
begin
  try
    Result := SysUtils.StrToDate(Value);
  except
    Result := 0;
  end;
end;

function AUtils_StrToFloat(const Value: AString_Type): AFloat;
begin
  try
    Result := AUtils_StrToFloatP(AString_ToPascalString(Value));
  except
    Result := 0;
  end;
end;

function AUtils_StrToFloatDef(const S: AString_Type; DefValue: AFloat): AFloat;
begin
  try
    Result := AUtils_StrToFloatDefP(AString_ToPascalString(S), DefValue);
  except
    Result := DefValue;
  end;
end;

function AUtils_StrToInt(const Value: AString_Type): AInt;
begin
  try
    Result := AUtils_StrToIntP(AString_ToPascalString(Value));
  except
    Result := 0;
  end;
end;

function AUtils_StrToIntDef(const S: AString_Type; DefValue: AInt): AInt;
begin
  try
    Result := AUtils_StrToIntDefP(AString_ToPascalString(S), DefValue);
  except
    Result := DefValue;
  end;
end;

function AUtils_StrToFloatDefP(const S: APascalString; DefValue: AFloat): AFloat;
var
  Value: AFloat64;
begin
  if AUtils_TryStrToFloat64P(S, Value) then
    Result := Value
  else
    Result := DefValue;
end;

function AUtils_StrToFloatP(const Value: APascalString): AFloat;
begin
  if not(AUtils_TryStrToFloatP(Value, Result)) then
    Result := 0;
end;

function AUtils_StrToIntDefP(const S: APascalString; DefValue: AInteger): AInteger;
begin
  try
    if not(AUtils_TryStrToIntP(S, Result)) then
      Result := DefValue;
  except
    Result := DefValue;
  end;
end;

function AUtils_StrToIntP(const Value: APascalString): AInteger;
begin
  if not(AUtils_TryStrToIntP(Value, Result)) then
    Result := 0;
end;

function AUtils_Trim(var S: AString_Type): AError;
begin
  try
    Result := AString_AssignP(S, SysUtils.Trim(AString_ToPascalString(S)));
  except
    Result := -1;
  end;
end;

function AUtils_TrimP(const S: APascalString): APascalString;
begin
  try
    Result := SysUtils.Trim(S);
  except
    Result := '';
  end;
end;

function AUtils_TryStrToDate(const S: AString_Type; var Value: TDateTime): AError;
begin
  try
    if AUtils_TryStrToDateP(AString_ToPascalString(S), Value) then
      Result := 0
    else
      Result := -2;
  except
    Result := -1;
  end;
end;

function AUtils_TryStrToDateP(const S: APascalString; var Value: TDateTime): ABoolean;
begin
  try
    Result := SysUtils.TryStrToDate(S, Value);
  except
    Result := False;
  end;
end;

function AUtils_TryStrToFloatP(const S: APascalString; var Value: AFloat): ABoolean;
begin
  {$IFDEF AFloat32}
  Result := AUtils_TryStrToFloat32P(S, Value);
  {$ELSE}
  Result := AUtils_TryStrToFloat64P(S, Value);
  {$ENDIF}
end;

function AUtils_TryStrToFloat32(const S: AString_Type; var Value: AFloat32): AError;
begin
  try
    if AUtils_TryStrToFloat32P(AString_ToPascalString(S), Value) then
      Result := 0
    else
      Result := -2;
  except
    Result := -1;
  end;
end;

function AUtils_TryStrToFloat32P(const S: APascalString; var Value: AFloat32): ABoolean;
var
  Value1: Extended;
  S1: string;
begin
  try
    S1 := SysUtils.Trim(Utils_ReplaceComma(S));
    if (S1 <> '') then
    begin
      Result := SysUtils.TryStrToFloat(S1, Value1);
      if Result then
        Value := Value1;
    end
    else
      Result := False;
  except
    Result := False;
  end;
end;

function AUtils_TryStrToFloat64(const S: AString_Type; var Value: AFloat64): AError;
begin
  try
    if AUtils_TryStrToFloat64P(AString_ToPascalString(S), Value) then
      Result := 0
    else
      Result := -2;
  except
    Result := -1;
  end;
end;

function AUtils_TryStrToFloat64P(const S: APascalString; var Value: AFloat64): ABoolean;
var
  Value1: Extended;
  S1: string;
begin
  try
    S1 := SysUtils.Trim(Utils_ReplaceComma(S));
    if (S1 <> '') then
    begin
      Result := SysUtils.TryStrToFloat(S1, Value1);
      if Result then
        Value := Value1;
    end
    else
      Result := False;
  except
    Result := False;
  end;
end;

function AUtils_TryStrToInt(const S: AString_Type; var Value: AInt): AError;
begin
  try
    if AUtils_TryStrToIntP(AString_ToPascalString(S), Value) then
      Result := 0
    else
      Result := -2;
  except
    Result := -1;
  end;
end;

function AUtils_TryStrToIntP(const S: APascalString; var Value: AInteger): ABoolean;
begin
  try
    Result := SysUtils.TryStrToInt(SysUtils.Trim(S), Value);
  except
    Result := False;
  end;
end;

// --- Utils ---

function Utils_ExtractFileExt(const FileName: APascalString): APascalString;
begin
  Result := AUtils_ExtractFileExtP(FileName);
end;

function Utils_ExtractFilePath(const FileName: APascalString): APascalString;
begin
  Result := AUtils_ExtractFilePathP(FileName);
end;

function Utils_FileExists(const FileName: APascalString): ABoolean;
begin
  Result := AUtils_FileExistsP(FileName);
end;

function Utils_FloatToStr(Value: AFloat): APascalString;
begin
  Result := AUtils_FloatToStrP(Value);
end;

function Utils_FloatToStr2(Value: AFloat; DigitsAfterComma: Integer; ReplaceComma, Delimer: ABoolean): APascalString;
begin
  Result := AUtils_FloatToStr2P(Value, DigitsAfterComma, ReplaceComma, Delimer);
end;

function Utils_FloatToStrA(Value: AFloat; DigitsAfterComma: AInteger = 2): APascalString;
begin
  Result := AUtils_FloatToStrAP(Value, DigitsAfterComma);
end;

function Utils_FloatToStrB(Value: AFloat; DigitsAfterComma: AInteger): APascalString;
begin
  Result := AUtils_FloatToStrBP(Value, DigitsAfterComma);
end;

function Utils_FloatToStrC(Value: AFloat; DigitsAfterComma: AInteger): APascalString;
begin
  Result := AUtils_FloatToStrCP(Value, DigitsAfterComma);
end;

function Utils_FloatToStrD(Value: AFloat): APascalString;
begin
  Result := AUtils_FloatToStrDP(Value);
end;

function Utils_FormatFloat(Value: AFloat; DigitsBeforeComma, DigitsAfterComma: AInteger): APascalString;
begin
  Result := AUtils_FormatFloatP(Value, DigitsBeforeComma, DigitsAfterComma);
end;

function Utils_IntToStr(Value: AInteger): APascalString;
begin
  Result := AUtils_IntToStrP(Value);
end;

function Utils_NormalizeStrSpace(const Value: APascalString): APascalString;
begin
  Result := AUtils_NormalizeStrSpaceP(Value);
end;

function Utils_ReplaceComma(const S: APascalString; DecimalSeparator: AChar; ClearSpace: ABoolean): APascalString;
var
  ic: Integer;
  SS: APascalString;
begin
  if (DecimalSeparator = #0) then
  begin
    {$IFDEF VER220}
    DecimalSeparator := AChar(FormatSettings.DecimalSeparator);
    {$ELSE}
    DecimalSeparator := AChar(SysUtils.DecimalSeparator);
    {$ENDIF}
  end;
  if (DecimalSeparator <> '.') and (DecimalSeparator <> ',') then
    raise Exception.Create('������ � ReplaceComma(). �������� DecimalSeparator ������ ���� ����� ��� �������.');

  // 44 - �������; 46 - �����
  ic := 1;
  SS := '';
  while (ic <= (Length(S))) do
  begin
    if not(ClearSpace) or (S[ic] <> ' ') then
    begin
      if (DecimalSeparator = '.') then
      begin
        if S[ic] = ',' then
          SS := SS + '.'
        else
          SS := SS + S[ic];
      end
      else
      begin
        if (S[ic] = '.') then
          SS := SS + ','
        else
          SS := SS + S[ic];
      end;
    end;
    ic := ic + 1;
  end;
  Result := SS;
end;

function Utils_Round2(Value: Real; Digits1, DigitsAfterComma: Integer): Real;

  function DigitToValue(Digits: Integer): Integer;
  begin
    case Digits of
      1: Result := 1;
      2: Result := 10;
      3: Result := 100;
      4: Result := 1000;
      5: Result := 10000;
      6: Result := 100000;
      7: Result := 1000000;
      8: Result := 10000000;
      9: Result := 100000000;
    else
      Result := 1000000000;
    end;
  end;

  // ��������� �� ���������� ���-�� �������� ����
  function Round2(Value: Real): Real;
  var
    E: Real;
  begin
    if (Value < 0.000000001) then
    begin
      Result := 0;
      Exit;
    end
    else if (Value < 0.00000001) then
      E := 1000000000
    else if (Value < 0.0000001) then
      E := 100000000
    else if (Value < 0.000001) then
      E := 10000000
    else if (Value < 0.00001) then
      E := 1000000
    else if (Value < 0.0001) then
      E := 100000
    else if (Value < 0.001) then
      E := 10000
    else if (Value < 0.01) then
      E := 1000
    else if (Value < 0.1) then
      E := 100
    else
      E := 10;

    E := E*DigitToValue(Digits1);

    Result := Round(Value*E) / E;
  end;

var
  E: Real;
  IsOtr: Boolean;
begin
  if (Digits1 < 0) then
    Digits1 := 0;
  if (DigitsAfterComma < 0) then
    DigitsAfterComma := 0;

  if (Value < 0) then
  begin
    IsOtr := True;
    Value := -Value;
  end
  else
    IsOtr := False;

  // �������� ����������� ���-�� ������ ����� �������
  if (DigitsAfterComma = 0) then
    Value := Round(Value)
  else
  begin
    E := DigitToValue(DigitsAfterComma+1);
    Value := Round(Value*E) / E;
  end;

  // ��������� �� ���������� ���-�� �������� ����
  if (Value < 1) then
    Result := Round2(Value)
  else if (Value < 10000) then
    Result := Round2(Value/10000)*10000
  else if (Value < 100000000) then
    Result := Round2(Value/100000000)*100000000
  else if (Value < 1000000000000) then
    Result := Round2(Value/1000000000000)*1000000000000
  else //if (Value < 10000000000000000) then
    Result := Round2(Value/10000000000000000)*10000000000000000;

  if IsOtr then
    Result := -Result;
end;

function Utils_String_ToLower(const S: APascalString): APascalString;
begin
  Result := AStringUtils.AString_ToLowerP(S);
end;

function Utils_String_ToUpper(const S: APascalString): APascalString;
begin
  Result := AStringUtils.AString_ToUpperP(S);
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

end.
 