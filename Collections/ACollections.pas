{**
@Abstract ACollections
@Author Prof1983 <prof1983@ya.ru>
@Created 29.06.2011
@LastMod 18.12.2012
}
unit ACollections;

interface

uses
  ABase,
  ABaseTypes,
  AStringLists;

function Init(): AError; stdcall;

function Done(): AError; stdcall;

//** ��������� ������ � ������. ���������� ������, �� �������� ��� ������ ���������.
function StringList_Add(StringList: AStringList; const Value: AString_Type): AInteger; stdcall;

//** ��������� ������ � ������. ���������� ������, �� �������� ��� ������ ���������.
function StringList_AddA(StringList: AStringList; Value: PAnsiChar): AInteger; stdcall;

//** ��������� ������ � ������. ���������� ������, �� �������� ��� ������ ���������.
function StringList_AddP(StringList: AStringList; const Value: APascalString): AInteger; stdcall;

//** ��������� ������ � ������. ���������� ������, �� �������� ��� ������ ���������.
// Use StringList_AddP()
function StringList_AddPS(StringList: AStringList; const Value: APascalString): AInteger; stdcall; deprecated;

//** ��������� ������ � ������. ���������� ������, �� �������� ��� ������ ���������.
function StringList_AddWS(StringList: AStringList; const Value: AWideString): AInteger; stdcall;

//** ������� ��� ��������.
function StringList_Clear(StringList: AStringList): AError; stdcall;

function StringList_Count(StringList: AStringList): AInteger; stdcall;

function StringList_Delete(StringList: AStringList; Index: AInteger): AError; stdcall;

{**
  ��������� � ������ ������ �� ���������� �������.
  ��������, ������������ �� ����� �� ������� Index � �����, ��������� ������, ����� ����������
  ����� ��� ������������ �������.
}
function StringList_Insert(StringList: AStringList; Index: AInteger;
    Value: AString_Type): AInteger; stdcall;

{**
  ��������� � ������ ������ �� ���������� �������.
  ��������, ������������ �� ����� �� ������� Index � �����, ��������� ������, ����� ����������
  ����� ��� ������������ �������.
}
function StringList_InsertP(StringList: AStringList; Index: AInteger;
    const Value: APascalString): AError; stdcall;

//** ������� ���������-������ �����.
function StringList_New(): AStringList; stdcall;

{**
  ������� �� ������ ������, ������������� �� ���������� �������.
  ��������, ����������� �� ��������� ��������� �����, ����� ������������� �������������� �����.
}
function StringList_RemoveAt(StringList: AStringList; Index: AInteger): AInteger; stdcall;

implementation

function Done(): AError; stdcall;
begin
  Result := 0;
end;

function Init(): AError; stdcall;
begin
  Result := 0;
end;

function StringList_Add(StringList: AStringList; const Value: AString_Type): AInteger; stdcall;
begin
  Result := AStringList_Add(StringList, Value);
end;

function StringList_AddA(StringList: AStringList; Value: PAnsiChar): AInteger; stdcall;
begin
  Result := AStringList_AddA(StringList, Value);
end;

function StringList_AddP(StringList: AStringList; const Value: APascalString): AInteger; stdcall;
begin
  Result := AStringList_AddP(StringList, Value);
end;

function StringList_AddPS(StringList: AStringList; const Value: APascalString): AInteger; stdcall;
begin
  Result := AStringList_AddP(StringList, Value);
end;

function StringList_AddWS(StringList: AStringList; const Value: AWideString): AInteger; stdcall;
begin
  Result := AStringList_AddP(StringList, Value);
end;

function StringList_Clear(StringList: AStringList): AError; stdcall;
begin
  Result := AStringList_Clear(StringList);
end;

function StringList_Count(StringList: AStringList): AInteger; stdcall;
begin
  Result := AStringList_GetCount(StringList);
end;

function StringList_Delete(StringList: AStringList; Index: AInteger): AError; stdcall;
begin
  Result := AStringList_Delete(StringList, Index);
end;

function StringList_Insert(StringList: AStringList; Index: AInteger;
    Value: AString_Type): AInteger; stdcall;
begin
  Result := AStringList_Insert(StringList, Index, Value);
end;

function StringList_InsertP(StringList: AStringList; Index: AInteger;
    const Value: APascalString): AError; stdcall;
begin
  Result := AStringList_InsertP(StringList, Index, Value);
end;

function StringList_New(): AStringList; stdcall;
begin
  Result := AStringList_New();
end;

function StringList_RemoveAt(StringList: AStringList; Index: AInteger): AInteger; stdcall;
begin
  Result := AStringList_Delete(StringList, Index);
end;

end.
