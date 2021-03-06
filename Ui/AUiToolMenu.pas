{**
@abstract AUi ToolMenu
@author Prof1983 <prof1983@ya.ru>
@created 28.02.2012
@lastmod 19.04.2013
}
unit AUiToolMenu;

{define AStdCall}

interface

uses
  ComCtrls, Menus,
  ABase,
  AStringMain,
  AUiBase,
  AUiControls,
  AUiData,
  AUiPageControl,
  AUiToolBar;

// --- AUiToolMenu ---

function AUiToolMenu_AddButtonP(ToolMenu: AToolMenu; const Name, Text, Hint: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInt): AButton;

function AUiToolMenu_AddNewItem(Parent: AToolMenu; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInt): AToolMenu; {$ifdef AStdCall}stdcall;{$endif}

function AUiToolMenu_AddNewItem2P(Parent: AToolMenu; const Name, Text, Hint: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInt): AToolMenu;

function AUiToolMenu_AddNewItemP(Parent: AToolMenu; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInt): AToolMenu;

function AUiToolMenu_AddNewSubMenu(Parent: AToolMenu; const Name, Text: AString_Type;
    ImageId, Weight: AInt): AToolMenu; {$ifdef AStdCall}stdcall;{$endif}

function AUiToolMenu_AddNewSubMenuP(Parent: AToolMenu; const Name, Text: APascalString;
    ImageId, Weight: AInt): AToolMenu;

function AUiToolMenu_GetSubMenu(Parent: AToolMenu; const Name, Text: AString_Type;
    ImageId, Weight: AInt): AToolMenu; {$ifdef AStdCall}stdcall;{$endif}

function AUiToolMenu_GetSubMenuP(Parent: AToolMenu; const Name, Text: APascalString;
    ImageId, Weight: AInt): AToolMenu;

function AUiToolMenu_New(Parent: AControl): AToolMenu; {$ifdef AStdCall}stdcall;{$endif}

implementation

// --- Private ---

function _FindToolMenuByName(Parent: AToolMenu; const Name: APascalString): AInt;
var
  I: AInt;
  ParentName: APascalString;
begin
  for I := 0 to High(FToolMenus) do
  begin
    if (FToolMenus[I].PageControl = Parent) and (FToolMenus[I].Page <> 0) then
    begin
      ParentName := TPageControl(FToolMenus[I].PageControl).Name;
      if (TTabSheet(FToolMenus[I].Page).Name = ParentName+'_'+Name) then
      begin
        Result := I;
        Exit;
      end;
    end;
  end;
  Result := -1;
end;

// --- AUiToolMenu ---

function AUiToolMenu_AddButtonP(ToolMenu: AToolMenu; const Name, Text, Hint: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInt): AButton;
begin
  Result := AUiToolBar_AddButtonP(ToolMenu, Name, Text, Hint, OnClick, ImageId, Weight);
end;

function AUiToolMenu_AddNewItem(Parent: AToolMenu; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInt): AToolMenu;
begin
  Result := AUiToolMenu_AddNewItemP(
      Parent,
      AString_ToPascalString(Name),
      AString_ToPascalString(Text),
      OnClick,
      ImageId,
      Weight);
end;

function AUiToolMenu_AddNewItem2P(Parent: AToolMenu; const Name, Text, Hint: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInt): AToolMenu;
var
  Index: AInteger;
  I: Integer;
  O: TObject;
  Page: AControl;
begin
  if (Parent = 0) then
  begin
    Result := 0;
    Exit;
  end;

  try
    Index := AUiData.FindToolMenu(Parent);
    if (Index >= 0) then
    begin
      Page := AUiPageControl_InsertPageP(
          FToolMenus[Index].PageControl,
          TPageControl(FToolMenus[Index].PageControl).Name+'_'+Name,
          Text,
          Hint,
          -1);
      I := Length(FToolMenus);
      SetLength(FToolMenus, I + 1);
      FToolMenus[I].PageControl := FToolMenus[Index].PageControl;
      FToolMenus[I].Page := Page;
      Result := Page;
      Exit;
    end;

    O := TObject(Parent);
    if (O is TToolBar) then
    begin
      Result := Parent;
      Exit;
    end;

    Result := 0;
  except
    Result := 0;
  end;
end;

function AUiToolMenu_AddNewItemP(Parent: AToolMenu; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInt): AToolMenu;
begin
  Result := AUiToolMenu_AddNewItem2P(Parent, Name, Text, '', OnClick, ImageId, Weight);
end;

function AUiToolMenu_AddNewSubMenu(Parent: AToolMenu; const Name, Text: AString_Type;
    ImageId, Weight: AInt): AToolMenu;
begin
  Result := AUiToolMenu_AddNewSubMenuP(
      Parent,
      AString_ToPascalString(Name),
      AString_ToPascalString(Text),
      ImageId,
      Weight);
end;

function AUiToolMenu_AddNewSubMenuP(Parent: AToolMenu; const Name, Text: APascalString;
    ImageId, Weight: AInt): AToolMenu;
begin
  Result := AUiToolMenu_AddNewItemP(Parent, Name, Text, nil, ImageId, Weight);
end;

function AUiToolMenu_GetSubMenu(Parent: AToolMenu; const Name, Text: AString_Type;
    ImageId, Weight: AInt): AToolMenu;
begin
  Result := AUiToolMenu_GetSubMenuP(
      Parent,
      AString_ToPascalString(Name),
      AString_ToPascalString(Text),
      ImageId,
      Weight);
end;

function AUiToolMenu_GetSubMenuP(Parent: AToolMenu; const Name, Text: APascalString;
    ImageId, Weight: AInt): AToolMenu;
var
  Index: Integer;
begin
  try
    Index := _FindToolMenuByName(Parent, Name);
    if (Index >= 0) then
    begin
      Result := FToolMenus[Index].Page;
      Exit;
    end;
    Result := AUiToolMenu_AddNewSubMenuP(Parent, Name, Text, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function AUiToolMenu_New(Parent: AControl): AToolMenu;
var
  PageControl: AControl;
  I: Integer;
begin
  try
    PageControl := AUiPageControl_New(Parent);
    if (PageControl = 0) then
    begin
      Result := 0;
      Exit;
    end;
    AUiControl_SetAlign(PageControl, uiAlignTop);
    AUiControl_SetHeight(PageControl, 60);

    I := Length(FToolMenus);
    SetLength(FToolMenus, I + 1);
    FToolMenus[I].PageControl := PageControl;

    Result := PageControl;
  except
    Result := 0;
  end;
end;

end.
 