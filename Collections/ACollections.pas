{**
@Abstract ACollections
@Author Prof1983 <prof1983@ya.ru>
@Created 29.06.2011
@LastMod 18.02.2013
}
unit ACollections;

interface

uses
  ABase,
  ABaseTypes,
  AStringLists;

function Fin(): AError; stdcall;

function Init(): AError; stdcall;

//** ��������� ������ � ������. ���������� ������, �� �������� ��� ������ ���������.
function StringList_Add(StringList: AStringList; const Value: AString_Type): AInt; stdcall;

//** ��������� ������ � ������. ���������� ������, �� �������� ��� ������ ���������.
function StringList_AddA(StringList: AStringList; Value: PAnsiChar): AInt; stdcall;

//** ��������� ������ � ������. ���������� ������, �� �������� ��� ������ ���������.
function StringList_AddP(StringList: AStringList; const Value: APascalString): AInt; stdcall;

//** ������� ��� ��������.
function StringList_Clear(StringList: AStringList): AError; stdcall;

function StringList_Count(StringList: AStringList): AInt; stdcall;

function StringList_Delete(StringList: AStringList; Index: AInt): AError; stdcall;

{**
  ��������� � ������ ������ �� ���������� �������.
  ��������, ������������ �� ����� �� ������� Index � �����, ��������� ������, ����� ����������
  ����� ��� ������������ �������.
}
function StringList_Insert(StringList: AStringList; Index: AInt; Value: AString_Type): AInt; stdcall;

{**
  ��������� � ������ ������ �� ���������� �������.
  ��������, ������������ �� ����� �� ������� Index � �����, ��������� ������, ����� ����������
  ����� ��� ������������ �������.
}
function StringList_InsertP(StringList: AStringList; Index: AInt;
    const Value: APascalString): AError; stdcall;

//** ������� ���������-������ �����.
function StringList_New(): AStringList; stdcall;

{**
  ������� �� ������ ������, ������������� �� ���������� �������.
  ��������, ����������� �� ��������� ��������� �����, ����� ������������� �������������� �����.
}
function StringList_RemoveAt(StringList: AStringList; Index: AInt): AInt; stdcall;

implementation

function Fin(): AError;
begin
  Result := 0;
end;

function Init(): AError;
begin
  Result := 0;
end;

function StringList_Add(StringList: AStringList; const Value: AString_Type): AInt;
begin
  Result := AStringList_Add(StringList, Value);
end;

function StringList_AddA(StringList: AStringList; Value: PAnsiChar): AInt;
begin
  Result := AStringList_AddA(StringList, Value);
end;

function StringList_AddP(StringList: AStringList; const Value: APascalString): AInt;
begin
  Result := AStringList_AddP(StringList, Value);
end;

function StringList_Clear(StringList: AStringList): AError;
begin
  Result := AStringList_Clear(StringList);
end;

function StringList_Count(StringList: AStringList): AInt;
begin
  Result := AStringList_GetCount(StringList);
end;

function StringList_Delete(StringList: AStringList; Index: AInt): AError;
begin
  Result := AStringList_Delete(StringList, Index);
end;

function StringList_Insert(StringList: AStringList; Index: AInt; Value: AString_Type): AInt;
begin
  Result := AStringList_Insert(StringList, Index, Value);
end;

function StringList_InsertP(StringList: AStringList; Index: AInt;
    const Value: APascalString): AError; stdcall;
begin
  Result := AStringList_InsertP(StringList, Index, Value);
end;

function StringList_New(): AStringList;
begin
  Result := AStringList_New();
end;

function StringList_RemoveAt(StringList: AStringList; Index: AInt): AInt;
begin
  Result := AStringList_Delete(StringList, Index);
end;

end.
