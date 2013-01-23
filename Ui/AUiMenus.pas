{**
@Abstract AUi Menus
@Author Prof1983 <prof1983@ya.ru>
@Created 16.08.2011
@LastMod 23.01.2013
}
unit AUiMenus;

{$define AStdCall}
{define UseToolMenu}

interface

uses
  Menus, ABase, AStrings,
  AUiBase, AUiData, AUiEventsObj;

// --- AUiMenu ---

function AUiMenu_AddItem0(Parent: AMenuItem; MenuItem: AMenuItem;
    Weight: AInteger): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_AddItem1(Menu: AMenu; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_AddItem1P(Menu: AMenu; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem;

function AUiMenu_AddItem2(Parent: AMenuItem; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_AddItem2P(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: Integer): AMenuItem;

function AUiMenu_AddItem2WS(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: Integer): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_AddItem2WS02(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc02; ImageId, Weight: Integer): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_AddItem2WS03(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight: AInteger): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_AddItem3(Parent: AMenuItem; MenuItem: AMenuItem;
    Weight: AInteger): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_AddItem3WS(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight, Tag: AInteger): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_AddItem3WS03(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight, Tag: AInteger): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_AddItem4P(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight, Tag: AInteger): AMenuItem;

function AUiMenu_AddItemExP(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    ImageId, Weight, Tag: AInteger; out ResIndex: AInteger): AError;

function AUiMenu_AddItemEx2P(ParentMenuItem: AMenuItem; const Name, Text, Hint: APascalString;
    OnClick: ACallbackProc; ItemType, ImageId, Weight, Tag: AInt): AMenuItem;

function AUiMenu_Clear(MenuItem: AMenuItem): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_GetItems(Menu: AMenu): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_GetSubMenuP(Parent: AMenuItem; const Name, Text: APascalString;
    ImageId, Weight: AInt): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_FindItemByName(MenuItem: AMenuItem; const Name: AString_Type): AMenuItem; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_FindItemByNameP(MenuItem: AMenuItem; const Name: APascalString): AMenuItem;

function AUiMenu_New(MenuType: AInteger): AMenu; {$ifdef AStdCall}stdcall;{$endif}

function AUiMenu_SetChecked(MenuItem: AMenuItem; Checked: ABoolean): AError; {$ifdef AStdCall}stdcall;{$endif}

// --- UI_Menu ---

function UI_Menu_AddItem(Menu: AMenu; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; deprecated; // Use AUiMenu_AddItem1P()

function UI_Menu_GetItems(Menu: AMenu): AMenuItem; deprecated; // Use AUiMenu_GetItems()

function UI_Menu_New(MenuType: AInteger): AMenu; deprecated; // Use AUiMenu_New()

// --- MenuItem ---

function UI_MenuItem_Add(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageID, Weight, Tag: Integer): AMenuItem; deprecated; // Use AUiMenu_AddItem4P()

function UI_MenuItem_Add02(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc02; ImageID, Weight: Integer): AMenuItem; deprecated; // Use AUiMenu_AddItem2WS02()

function UI_MenuItem_Add03(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc03; ImageID, Weight, Tag: Integer): AMenuItem; deprecated; // Use AUiMenu_AddItem3WS03()

function UI_MenuItem_Add2(Parent: AMenuItem; MenuItem: AMenuItem;
    Weight: AInteger): AMenuItem; deprecated; // AUiMenu_AddItem3()

function UI_MenuItem_AddEx(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    ImageID, Weight, Tag: AInteger; out ResIndex: AInteger): AError; deprecated; // Use AUiMenu_AddItemExP()

function UI_MenuItem_FindByName(MenuItem: AMenuItem; const Name: APascalString): AMenuItem; deprecated; // Use AUiMenu_FindItemByNameP()

implementation

{ Private }

function _AddMenuItem(Parent, Value: AMenuItem; Weight: AInteger): AInteger;
var
  I: Integer;
begin
  I := Length(FMenuItems);
  SetLength(FMenuItems, I + 1);
  FMenuItems[I].Parent := Parent;
  FMenuItems[I].MenuItem := Value;
  FMenuItems[I].Weight := Weight;
  Result := I;
end;

function _Find(Parent, Item: AMenuItem): AInt;
var
  I: Integer;
begin
  for I := 0 to TMenuItem(Parent).Count - 1 do
  begin
    if (AMenuItem(TMenuItem(Parent).Items[I]) = Item) then
    begin
      Result := I;
      Exit;
    end;
  end;
  Result := -1;
end;

function _FindByName(MenuItem: AMenuItem; const Name: APascalString): AInteger;
var
  I: Integer;
begin
  for I := 0 to TMenuItem(MenuItem).Count - 1 do
  begin
    if (TMenuItem(MenuItem).Items[I].Name = Name) then
    begin
      Result := I;
      Exit;
    end;
  end;
  Result := -1;
end;

// --- AUiMenu ---

function AUiMenu_AddItem0(Parent: AMenuItem; MenuItem: AMenuItem;
    Weight: AInteger): AMenuItem;
begin
  Result := AUiMenu_AddItem3(Parent, MenuItem, Weight);
end;

function AUiMenu_AddItem1(Menu: AMenu; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem;
var
  MenuItems: AMenuItem;
begin
  try
    {$ifdef UseToolMenu}
    xxx
    {$endif}

    MenuItems := AUiMenu_GetItems(Menu);

    if (MenuItems = 0) then
    begin
      Result := 0;
      Exit;
    end;

    Result := AUiMenu_AddItem4P(MenuItems,
        AString_ToPascalString(Name), AString_ToPascalString(Text),
        OnClick, ImageId, Weight, 0);
  except
    Result := 0;
  end;
end;

function AUiMenu_AddItem1P(Menu: AMenu; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem;
var
  MenuItems: AMenuItem;
begin
  try
    {$ifdef UseToolMenu}
    xxx
    {$endif}

    MenuItems := AUiMenu_GetItems(Menu);

    if (MenuItems = 0) then
    begin
      Result := 0;
      Exit;
    end;

    Result := AUiMenu_AddItem4P(MenuItems, Name, Text, OnClick, ImageId, Weight, 0);
  except
    Result := 0;
  end;
end;

function AUiMenu_AddItem2(Parent: AMenuItem; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem;
begin
  Result := AUiMenu_AddItem4P(Parent,
      AString_ToPascalString(Name), AString_ToPascalString(Text),
      OnClick, ImageId, Weight, 0);
end;

function AUiMenu_AddItem2P(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: Integer): AMenuItem;
begin
  Result := AUiMenu_AddItem4P(ParentMenuItem, Name, Text, OnClick, ImageId, Weight, 0);
end;

function AUiMenu_AddItem2WS(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: Integer): AMenuItem;
begin
  Result := AUiMenu_AddItem4P(Parent, Name, Text, OnClick, ImageId, Weight, 0);
end;

function AUiMenu_AddItem2WS02(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc02; ImageId, Weight: AInteger): AMenuItem;
var
  Res: AError;
  ResIndex: AInteger;
begin
  try
    {$ifdef UseToolMenu}
    xxx
    {$endif}

    Res := AUiMenu_AddItemExP(Parent, Name, Text, ImageId, Weight, 0, ResIndex);
    if (Res < 0) then
    begin
      Result := 0;
      Exit;
    end;
    if (Res = 0) then
      FMenuItems[ResIndex].OnClick02 := OnClick;
    Result := FMenuItems[ResIndex].MenuItem;
  except
    Result := 0;
  end;
end;

function AUiMenu_AddItem2WS03(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight: AInteger): AMenuItem;
begin
  Result := AUiMenu_AddItem3WS03(Parent, Name, Text, OnClick, ImageId, Weight, 0);
end;

function AUiMenu_AddItem3(Parent: AMenuItem; MenuItem: AMenuItem;
    Weight: AInteger): AMenuItem;
var
  I: Integer;
  Res: AMenuItem;
begin
  try
    {$ifdef UseToolMenu}
    xxx
    {$endif}

    Res := AddObject(TMenuItem(MenuItem));
    I := Length(FMenuItems);
    SetLength(FMenuItems, I + 1);
    FMenuItems[I].Parent := Parent;
    FMenuItems[I].MenuItem := Res;
    FMenuItems[I].Weight := Weight;
    Result := Res;
  except
    Result := 0;
  end;
end;

function AUiMenu_AddItem3WS(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight, Tag: AInteger): AMenuItem;
begin
  Result := AUiMenu_AddItem4P(Parent, Name, Text, OnClick, ImageId, Weight, Tag);
end;

function AUiMenu_AddItem3WS03(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight, Tag: AInteger): AMenuItem;
var
  Res: AError;
  ResIndex: AInteger;
begin
  try
    {$ifdef UseToolMenu}
    xxx
    {$endif}

    Res := AUiMenu_AddItemExP(Parent, Name, Text, ImageId, Weight, 0, ResIndex);
    if (Res < 0) then
    begin
      Result := 0;
      Exit;
    end;
    if (Res = 0) then
      FMenuItems[ResIndex].OnClick03 := OnClick;
    Result := FMenuItems[ResIndex].MenuItem;
  except
    Result := 0;
  end;
end;

function AUiMenu_AddItem4P(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight, Tag: AInteger): AMenuItem;
begin
  try
    Result := AUiMenu_AddItemEx2P(ParentMenuItem, Name, Text, '', OnClick, 0, ImageId, Weight, Tag);
  except
    Result := 0;
  end;
end;

function AUiMenu_AddItemExP(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    ImageId, Weight, Tag: AInteger; out ResIndex: AInteger): AError;
begin
  Result := AUiMenu_AddItemEx2P(ParentMenuItem, Name, Text, '', nil, 0, ImageId, Weight, Tag);
  ResIndex := _Find(ParentMenuItem, Result);
end;

function AUiMenu_AddItemEx2P(ParentMenuItem: AMenuItem; const Name, Text, Hint: APascalString;
    OnClick: ACallbackProc; ItemType, ImageId, Weight, Tag: AInt): AMenuItem;
var
  I: Integer;
  Index: Integer;
  IndexMax: Integer;
  WeightMax: Integer;
  Item: TMenuItem;
  mi: TMenuItem;
  Value: AMenuItem;
  ResIndex: AInt;
begin
  try
    {$ifdef UseToolMenu}
    xxx
    {$endif}

    Item := TMenuItem(ParentMenuItem);

    if not(Assigned(Item)) then
    begin
      Result := 0;
      Exit;
    end;

    Value := AUiMenu_FindItemByNameP(ParentMenuItem, 'mi'+Name);

    if (Value <> 0) then
    begin
      ResIndex := FindMenuItem(Value);
      if (ResIndex < 0) then
        _AddMenuItem(ParentMenuItem, Value, 0);
      Result := FMenuItems[ResIndex].MenuItem;
      Exit;
    end;

    // ������ ������ �������� ��� �������
    IndexMax := -1;
    WeightMax := High(Integer);
    for I := 0 to High(FMenuItems) do
    begin
      if (FMenuItems[I].Parent = ParentMenuItem) and (FMenuItems[I].Weight > Weight) and (FMenuItems[I].Weight < WeightMax) then
      begin
        IndexMax := I;
        WeightMax := FMenuItems[I].Weight;
      end;
    end;
    Index := IndexMax;

    mi := TMenuItem.Create(nil);
    mi.Name := 'mi'+Name;
    mi.Caption := Text;
    mi.OnClick := UI_.MenuItemClick;
    mi.Tag := Tag;

    if (Index >= 0) then
      Item.Insert(TMenuItem(FMenuItems[Index].MenuItem).MenuIndex, mi)
    else
      Item.Add(mi);

    Value := AddObject(mi);
    ResIndex := _AddMenuItem(ParentMenuItem, Value, Weight);

    {$IFDEF A01}
      FMenuItems[ResIndex].OnClick02 := OnClick;
    {$ELSE}
      {$IFDEF A02}
      FMenuItems[ResIndex].OnClick02 := OnClick;
      {$ELSE}
      FMenuItems[ResIndex].OnClick03 := OnClick;
      {$ENDIF A02}
    {$ENDIF A01}

    Result := Value;
  except
    Result := 0;
  end;
end;

function AUiMenu_Clear(MenuItem: AMenuItem): AError;
begin
  try
    {$ifdef UseToolMenu}
    xxx
    {$endif}

    TMenuItem(MenuItem).Clear();
    Result := 0;
  except
    Result := -1;
  end;
end;

function AUiMenu_GetItems(Menu: AMenu): AMenuItem;
var
  O: TObject;
begin
  try
    O := AUiData.GetObject(Menu);
    if Assigned(O) and (O is TMenu) then
    begin
      Result := Integer(TMenu(O).Items);
    end
    else
      Result := 0;
  except
    Result := 0;
  end;
end;

function AUiMenu_GetSubMenuP(Parent: AMenuItem; const Name, Text: APascalString;
    ImageId, Weight: AInt): AMenuItem;
var
  Index: Integer;
begin
  try
    Index := _FindByName(Parent, Name);
    if (Index >= 0) then
    begin
      Result := AMenuItem(TMenuItem(Parent).Items[Index]);
      Exit;
    end;
    Result := AUiMenu_AddItem1P(Parent, Name, Text, nil, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function AUiMenu_FindItemByName(MenuItem: AMenuItem; const Name: AString_Type): AMenuItem;
begin
  Result := AUiMenu_FindItemByNameP(MenuItem, AString_ToPascalString(Name));
end;

function AUiMenu_FindItemByNameP(MenuItem: AMenuItem; const Name: APascalString): AMenuItem;
var
  I: Integer;
begin
  try
    {$ifdef UseToolMenu}
    xxx
    {$endif}

    I := _FindByName(MenuItem, Name);
    if (I >= 0) then
      Result := AMenuItem(TMenuItem(MenuItem).Items[I])
    else
      Result := 0;
  except
    Result := 0;
  end;
end;

function AUiMenu_New(MenuType: AInteger): AMenu;
begin
  try
    {$ifdef UseToolMenu}
    {$endif}

    Result := AMenu(TPopupMenu.Create(nil));
  except
    Result := 0;
  end;
end;

function AUiMenu_SetChecked(MenuItem: AMenuItem; Checked: ABoolean): AError;
begin
  try
    {$ifdef UseToolMenu}
    xxx
    {$endif}

    TMenuItem(MenuItem).Checked := Checked;
    Result := -1;
  except
    Result := 0;
  end;
end;

{ Menu }

function UI_Menu_AddItem(Menu: AMenu; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: Integer): AMenuItem;
begin
  Result := AUiMenu_AddItem1P(Menu, Name, Text, OnClick, ImageId, Weight);
end;

function UI_Menu_GetItems(Menu: AMenu): AMenuItem;
begin
  Result := AUiMenu_GetItems(Menu);
end;

function UI_Menu_New(MenuType: AInteger): AMenu;
begin
  Result := AUiMenu_New(MenuType);
end;

{ MenuItem }

function UI_MenuItem_Add(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageID, Weight, Tag: Integer): AMenuItem;
begin
  Result := AUiMenu_AddItem4P(ParentMenuItem, Name, Text, OnClick, ImageId, Weight, Tag);
end;

function UI_MenuItem_Add02(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc02; ImageID, Weight: Integer): AMenuItem;
begin
  Result := AUiMenu_AddItem2WS02(ParentMenuItem, Name, Text,
      OnClick, ImageId, Weight);
end;

function UI_MenuItem_Add03(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc03; ImageID, Weight, Tag: Integer): AMenuItem;
begin
  Result :=  AUiMenu_AddItem3WS03(ParentMenuItem, Name, Text,
      OnClick, ImageId, Weight, Tag);
end;

function UI_MenuItem_Add2(Parent: AMenuItem; MenuItem: AMenuItem; Weight: Integer): AMenuItem;
begin
  Result := AUiMenu_AddItem3(Parent, MenuItem, Weight);
end;

function UI_MenuItem_AddEx(ParentMenuItem: AMenuItem; const Name, Text: APascalString;
    ImageID, Weight, Tag: AInteger; out ResIndex: AInteger): AError;
begin
  Result := AUiMenu_AddItemExP(ParentMenuItem, Name, Text, ImageId, Weight, Tag, ResIndex);
end;

function UI_MenuItem_FindByName(MenuItem: AMenuItem; const Name: APascalString): AMenuItem;
begin
  Result := AUiMenu_FindItemByNameP(MenuItem, Name);
end;

end.
 