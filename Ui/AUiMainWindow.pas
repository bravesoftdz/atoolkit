{**
@Abstract AUiMainWindow
@Author Prof1983 <prof1983@ya.ru>
@Created 13.10.2008
@LastMod 26.03.2013
}
unit AUiMainWindow;

{$I Defines.inc}

{define AStdCall}

interface

uses
  ABase,
  AUiBase,
  AUiBox,
  AUiControls,
  AUiData,
  AUiMainWindowData,
  AUiMenus,
  AUiSplitter,
  AUiToolBar,
  AUiWindowMenu;

type
  TMainWindowFormat = type Integer;
const
  MainWindowFormatCreateMenu = $00000001;
  MainWindowFormatCreateToolBar = $00000002;
  MainWindowFormatCreateStatusBar = $00000004;
  MainWindowFormatCreatePanels = $00000008;
  MainWindowFormatCreateAll = $000000FF;

// --- AUi ---

function AUi_SetMainWindow(Value: AWindow): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUi_SetMainWindow2(Value: AWindow; ToolBar, StatusBar: AControl;
    Config: AConfig): AError; {$ifdef AStdCall}stdcall;{$endif}

// --- AUiMainWindow ---

function AUiMainWindow_Create(Win: AWindow; Format: TMainWindowFormat; Config: AConfig): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUiMainWindow_GetLeftContainer(): AControl; {$ifdef AStdCall}stdcall;{$endif}

{** Returns the main container UI }
function AUiMainWindow_GetMainContainer(): AControl; {$ifdef AStdCall}stdcall;{$endif}

function AUiMainWindow_GetRightContainer(): AControl; {$ifdef AStdCall}stdcall;{$endif}

function AUiMainWindow_GetToolBar(): AControl; {$ifdef AStdCall}stdcall;{$endif}

function AUiMainWindow_LoadConfig(Config: AConfig): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUiMainWindow_SetToolBar(ToolBar: AControl): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUiMainWindow_ShowContainers(): AError; {$ifdef AStdCall}stdcall;{$endif}

function AUiMainWindow_Shutdown(): AError; {$ifdef AStdCall}stdcall;{$endif}


{$IFDEF UNIX}
const
  miAboutCaption = 'About...';
  miHelpCaption = 'Help';
{$ELSE}
  {$IFDEF DELPHI_XE_UP}
    {$I AUi.ru.utf8.inc}
  {$ELSE}
    {$I AUi.ru.win1251.inc}
  {$ENDIF}
{$ENDIF}

var
  DefWindowState: AInt{TWindowState};

implementation

uses
  ComCtrls,
  Controls,
  Forms;

var
  _BaseBox: AControl;
  _BottomBox: AControl;
  _BottomSplitter: AControl;
  _LeftBox: AControl;
  _LeftSplitter: AControl;
  _MainBox: AControl;
  _RightBox: AControl;
  _RightSplitter: AControl;

(*
const
  STR_DockOrientation: array[TDockOrientation] of AString = (
    'NoOrient',
    'Horizontal',
    'Vertical'
    {$IFDEF FPC},'Pages'{$ENDIF}
    );
*)

// --- Forward ---

procedure _MainWindow_SetA(Window: AWindow; ToolBar, StatusBar: AControl; Config: AConfig); forward;

// --- Private ---

{
function StrToDockOrientation(S: WideString): TDockOrientation;
var
  I: TDockOrientation;
begin
  for I := Low(TDockOrientation) to High(TDockOrientation) do
    if (STR_DockOrientation[I] = S) then
    begin
      Result := I;
      Exit;
    end;
  Result := doNoOrient;
end;
}

procedure _MainWindow_Create(Form: AControl; Format: TMainWindowFormat; Config: AConfig);
var
  MainStatusBar: TStatusBar;
  MainToolBar: AControl;
begin
  if (Format and MainWindowFormatCreateToolBar = MainWindowFormatCreateToolBar) then
  begin
    MainToolBar := AUiToolBar_New(AWindow(Form));
    AUiControl_SetVisible(MainToolBar, False);
  end
  else
    MainToolBar := 0;

  if (Format and MainWindowFormatCreateStatusBar = MainWindowFormatCreateStatusBar) then
  begin
    MainStatusBar := TStatusBar.Create(TWinControl(Form));
    MainStatusBar.Parent := TWinControl(Form);
  end
  else
    MainStatusBar := nil;

  if (Format and MainWindowFormatCreatePanels = MainWindowFormatCreatePanels) then
  begin
    _LeftBox := AUiBox_New(Form,0);
    AUiBox_SetDockSite(_LeftBox, True);
    AUiBox_SetDragMode(_LeftBox, AUiDragMode_Automatic);
    AUiControl_SetAlign(_LeftBox, AUiAlign_Left);
    AUiControl_SetWidth(_LeftBox, 50);
    AUiControl_SetBevel(_LeftBox, AUiBevel_InnerNone + AUiBevel_OuterNone, 0);
    AUiControl_SetColor(_BottomBox, $C0F0C0);

    _LeftSplitter := AUiSplitter_New(Form,0);
    AUiControl_SetAlign(_LeftSplitter, AUiAlign_Left);
    AUiControl_SetPosition(_LeftSplitter, 60, 0);
    AUiControl_SetWidth(_LeftSplitter, 3);

    // --- Base ---

    _BaseBox := AUiBox_New(Form,0);
    AUiControl_SetPosition(_BaseBox, 100, 100);
    AUiControl_SetAlign(_BaseBox, AUiAlign_Client);
    AUiControl_SetBevel(_BaseBox, AUiBevel_InnerNone + AUiBevel_OuterNone, 0);

    // --- Right ---

    _RightBox := AUiBox_New(_BaseBox,0);
    AUiBox_SetDockSite(_RightBox, True);
    AUiBox_SetDragMode(_RightBox, AUiDragMode_Automatic);
    AUiControl_SetAlign(_RightBox, AUiAlign_Right);
    AUiControl_SetWidth(_RightBox, 50);
    AUiControl_SetBevel(_RightBox, AUiBevel_InnerNone + AUiBevel_OuterNone, 0);
    AUiControl_SetColor(_RightBox, $C0F0C0);

    _RightSplitter := AUiSplitter_New(_BaseBox,0);
    AUiControl_SetPosition(_RightSplitter, 0, 0);
    AUiControl_SetAlign(_RightSplitter, AUiAlign_Right);
    AUiControl_SetWidth(_RightSplitter, 3);

    // --- Main ---

    _MainBox := AUiBox_New(_BaseBox,0);
    AUiControl_SetAlign(_MainBox, AUiAlign_Client);
    AUiControl_SetBevel(_MainBox, AUiBevel_InnerNone + AUiBevel_OuterNone, 0);

    // --- Bottom ---

    _BottomBox := AUiBox_New(_MainBox,0);
    AUiBox_SetDockSite(_BottomBox, True);
    AUiBox_SetDragMode(_BottomBox, AUiDragMode_Automatic);
    AUiControl_SetAlign(_BottomBox, AUiAlign_Bottom);
    AUiControl_SetHeight(_BottomBox, 50);
    AUiControl_SetBevel(_BottomBox, AUiBevel_InnerNone + AUiBevel_OuterNone, 0);
    AUiControl_SetColor(_BottomBox, $C0C0F0);

    _BottomSplitter := AUiSplitter_New(_MainBox,0);
    AUiControl_SetPosition(_BottomSplitter, 0, 0);
    AUiControl_SetAlign(_BottomSplitter, AUiAlign_Bottom);
    AUiControl_SetHeight(_BottomSplitter, 3);

    AUiControl_SetVisible(_BaseBox, False);
    AUiControl_SetVisible(_LeftSplitter, False);
    AUiControl_SetVisible(_LeftBox, False);
  end;

  if (Format and MainWindowFormatCreateMenu = MainWindowFormatCreateMenu) then
  begin
    AUiWindow_SetMenu(Form, AUiMenu_New(0));
  end;
  AUi_SetMainWindow2(Form, MainToolBar, AControl(MainStatusBar), Config);
end;

function _MainWindow_GetLeftContainer(): AControl;
begin
  Result := _LeftBox;
end;

function _MainWindow_GetMainContainer(): AControl;
begin
  Result := _MainBox;
end;

function _MainWindow_GetRightContainer(): AControl;
begin
  Result := _RightBox;
end;

procedure _MainWindow_LoadConfig(Config: AConfig);

  (*
  function FindControlByTag(C: TWinControl; ControlTag: Integer): TWinControl;
  var
    I: Integer;
  begin
    for I := 0 to C.ControlCount - 1 do
    begin
      if (C.Controls[I] is TWinControl) and (C.Controls[I].Tag = ControlTag) then
      begin
        Result := TWinControl(C.Controls[I]);
        Exit;
      end;
    end;
    Result := nil;
  end;

  procedure ReadDockClient(C: TWinControl; Name: WideString; DockSite: TWinControl);
  var
    Client: TWinControl;
    TempTag: Integer;
    Rect: TRect;
    S: WideString;
  begin
    TempTag := Settings.ReadInteger(C.Name, Name, 0);
    if (TempTag = 0) then Exit;
    Client := FindControlByTag(C, TempTag);
    if not(Assigned(Client)) then
      Client := NewPanel(TempTag);

    TPanel(Client).Caption := IntToStr(TempTag);

    Rect.Left := Settings.ReadInteger(C.Name, Name+'_ClientRect_Left', 0);
    Rect.Top := Settings.ReadInteger(C.Name, Name+'_ClientRect_Top', 0) + 15;
    Rect.Right := Settings.ReadInteger(C.Name, Name+'_ClientRect_Right', 0);
    Rect.Bottom := Settings.ReadInteger(C.Name, Name+'_ClientRect_Bottom', 0) + 15;

    S := Settings.ReadString(C.Name, Name+'_ClientOrientation', '');
    if (S <> '') then
      Client.DockOrientation := StrToDockOrientation(S);

    Client.Dock(DockSite, Rect);
    if TPanel(DockSite).UseDockManager and Assigned(TPanel(DockSite).DockManager) then
    begin
      if (Client.DockOrientation = doHorizontal) then
        TPanel(DockSite).DockManager.InsertControl(Client, alRight, nil)
      else if (Client.DockOrientation = doVertical) then
        TPanel(DockSite).DockManager.InsertControl(Client, alBottom, nil)
      else
        TPanel(DockSite).DockManager.InsertControl(Client, alClient, nil)
    end;
  end;

  procedure ReadDockClients(Co: TWinControl; Name: WideString; DockSite: TWinControl);
  var
    C: Integer;
    I: Integer;
  begin
    C := Settings.ReadInteger(Co.Name, Name+'_DockClientCount', 0);
    for I := 0 to C - 1 do
      ReadDockClient(Co, Name+'_DockClient_'+IntToStr(I), DockSite);
  end;

  procedure ReadPanel(C: TWinControl; Name: WideString);
  var
    Client: TWinControl;
    TempTag: Integer;
    Rect: TRect;
    S: WideString;
  begin
    TempTag := Settings.ReadInteger(C.Name, Name, 0);
    if (TempTag = 0) then Exit;
    Client := FindControlByTag(C, TempTag);
    if Assigned(Client) then Exit;

    Client := NewPanel(TempTag);
    TPanel(Client).Caption := IntToStr(TempTag);

    Rect.Left := Settings.ReadInteger(C.Name, Name+'_ClientRect_Left', 0);
    Rect.Top := Settings.ReadInteger(C.Name, Name+'_ClientRect_Top', 0) + 15;
    Rect.Right := Settings.ReadInteger(C.Name, Name+'_ClientRect_Right', 0);
    Rect.Bottom := Settings.ReadInteger(C.Name, Name+'_ClientRect_Bottom', 0) + 15;

    {Client.Dock(DockSite, Rect);
    if TPanel(DockSite).UseDockManager and Assigned(TPanel(DockSite).DockManager) then
      TPanel(DockSite).DockManager.InsertControl(Client, alClient, nil);}

    S := Settings.ReadString(C.Name, Name+'_ClientOrientation', '');
    if (S <> '') then
      Client.DockOrientation := StrToDockOrientation(S);
  end;

  procedure ReadPanels(Co: TWinControl);
  var
    C: Integer;
    I: Integer;
  begin
    C := Settings.ReadInteger(Co.Name, 'PanelCount', 0);
    for I := 0 to C - 1 do
      ReadPanel(Co, 'Panel'+IntToStr(I));
  end;
  *)

begin
  {$IFDEF USE_EVENTS}
  AUiWindow_LoadConfig3P(FMainWindow, Config, TForm(FMainWindow).Name, DefWindowState);
  {$ENDIF}

  (*
  if Settings.ReadBool(FControl.Name, 'NoStandartBorderStyle', False) then
  begin
    FControl.BorderStyle := bsNone;
    ToolBar.Visible := False;
    StatusBar.Visible := False;
  end
  else
  begin
    if Assigned(BottomPanel) then
      BottomPanel.Visible := False;
    //TopPanel.Visible := False;
    //pnlHead.Height := 130;
    {
    if Assigned(ToolBar) then
      ToolBar.Color := DefaultWinColor;
    if Assigned(StatusBar) then
      StatusBar.Color := DefaultWinColor;
    }
  end;
  *)
end;

procedure _MainWindow_SaveConfig(Config: AConfig);

  (*
  procedure WriteDockClient(C: TWinControl; Name: WideString; Client: TControl);
  begin
    Settings.WriteInteger(C.Name, Name, Client.Tag);
    Settings.WriteInteger(C.Name, Name+'_ClientRect_Left', Client.ClientRect.Left);
    Settings.WriteInteger(C.Name, Name+'_ClientRect_Top', Client.ClientRect.Top);
    Settings.WriteInteger(C.Name, Name+'_ClientRect_Right', Client.ClientRect.Right);
    Settings.WriteInteger(C.Name, Name+'_ClientRect_Bottom', Client.ClientRect.Bottom);
    Settings.WriteInteger(C.Name, Name+'_UndockHeight', Client.UndockHeight);
    Settings.WriteInteger(C.Name, Name+'_UndockWidth', Client.UndockWidth);
    Settings.WriteString(C.Name, Name+'_ClientOrientation', STR_DockOrientation[Client.DockOrientation]);
  end;

  procedure WriteDockClients(Co: TWinControl; Name: WideString; DockSite: TWinControl);
  var
    C: Integer;
    I: Integer;
  begin
    if (DockSite.Align = alLeft) or (DockSite.Align = alRight) then
      Settings.WriteInteger(Co.Name, Name+'_Width', DockSite.Width)
    else if (DockSite.Align = alBottom) or (DockSite.Align = alTop) then
      Settings.WriteInteger(Co.Name, Name+'_Height', DockSite.Height);

    C := DockSite.DockClientCount;
    Settings.WriteInteger(Co.Name, Name+'_DockClientCount', C);
    for I := 0 to C - 1 do
      //WriteDockClient(Name+'_DockClient_'+IntToStr(I), DockSite.DockClients[I]);
      Settings.WriteInteger(Co.Name, Name+'_DockClient_'+IntToStr(I), DockSite.DockClients[I].Tag);
  end;

  procedure WritePanels(Co: TWinControl);
  var
    C: Integer;
    I: Integer;
    Component: TComponent;
  begin
    C := 0;
    for I := 0 to Co.ComponentCount - 1 do
    begin
      Component := Co.Components[I];
      if (Component is TPanel) and (Component.Tag > 0) then
      begin
        WriteDockClient(Co, 'Panel'+IntToStr(C), TControl(Component));
        Inc(C);
      end;
    end;
    Settings.WriteInteger(Co.Name, 'PanelCount', C);
  end;
  *)

begin
  //Settings.WriteInteger(FControl.Name, 'NextTag', FNextTag);
  {$IFDEF USE_EVENTS}
  AUiWindow_SaveConfig(FMainWindow, Config);
  {$ENDIF}
end;

procedure _MainWindow_Set(Value: AWindow); stdcall;
begin
  _MainWindow_SetA(Value, 0, 0, 0);
end;

procedure _MainWindow_SetA(Window: AWindow; ToolBar, StatusBar: AControl; Config: AConfig);
begin
  FMainWindow := Window;
  FConfig := Config;
  FStatusBar := StatusBar;
  FMainToolBar := ToolBar;
end;

(*procedure TAMainWindow.ShowAll;
begin
  if Assigned(FContain) then               // 2                 // 54
  begin
    FContain.SetAllocateSize(FControl.Width - 15, FControl.Height - 64);
    {$IFDEF MSWINDOWS}
    IAUIclPanel(FContain).Align := Integer(alClient);
    {$ENDIF}
  end;
end;*)

procedure _MainWindow_Shutdown;
var
  MainForm: TForm;
begin
  MainForm := TForm(FMainWindow);
  if not(Assigned(MainForm)) then
  begin
    FMainWindow := 0;
    Exit;
  end;

  MainForm.OnCloseQuery := nil;

  if (FConfig <> 0) then
  begin
    _MainWindow_SaveConfig(FConfig);
    FConfig := 0;
  end;

  MainForm := nil; // Do not remove
  _MainWindow_Set(0);

  Application.Terminate;

  if (FMainWindow <> 0) then
  begin
    TForm(FMainWindow).Close;
    FMainWindow := 0;
  end;
end;

// --- AUi ---

function AUi_SetMainWindow(Value: AWindow): AError;
begin
  _MainWindow_SetA(Value, 0, 0, 0);
  Result := 0;
end;

function AUi_SetMainWindow2(Value: AWindow; ToolBar, StatusBar: AControl; Config: AConfig): AError;
begin
  try
    if (Value = 0) then
      FMainWindow := 0
    else
    begin
      FMainWindow := AddObject(TForm(Value));
      if Assigned(TForm(Value).Menu) then
      begin
        {FMainMenu :=} AddObject(TForm(Value).Menu);
        miMain := AMenuItem(TForm(Value).Menu.Items);
      end;
      //FMainWindow := Value;

      _MainWindow_SetA(Value, ToolBar, StatusBar, Config);
    end;
    Result := 0;
  except
    Result := -1;
  end;
end;

// --- AUiMainWindow ---

function AUiMainWindow_Create(Win: AWindow; Format: TMainWindowFormat; Config: AConfig): AError;
begin
  try
    _MainWindow_Create(Win, Format, Config);
    Result := 0;
  except
    Result := -1;
  end;
end;

function AUiMainWindow_GetLeftContainer(): AControl;
begin
  try
    Result := _MainWindow_GetLeftContainer();
  except
    Result := 0;
  end;
end;

function AUiMainWindow_GetMainContainer(): AControl;
begin
  try
    Result := _MainWindow_GetMainContainer();
  except
    Result := 0;
  end;
end;

function AUiMainWindow_GetToolBar(): AControl;
begin
  Result := FMainToolBar;
end;

function AUiMainWindow_GetRightContainer(): AControl;
begin
  try
    Result := _MainWindow_GetRightContainer();
  except
    Result := 0;
  end;
end;

function AUiMainWindow_LoadConfig(Config: AConfig): AError;
begin
  try
    _MainWindow_LoadConfig(Config);
    Result := 0;
  except
    Result := -1;
  end;
end;

function AUiMainWindow_SetToolBar(ToolBar: AControl): AError;
begin
  try
    FMainToolBar := ToolBar;
    Result := 0;
  except
    Result := -1;
  end;
end;

function AUiMainWindow_ShowContainers(): AError;
begin
  try
    AUiControl_SetVisible(_LeftBox, True);
    AUiControl_SetVisible(_LeftSplitter, True);
    AUiControl_SetVisible(_BaseBox, True);
    Result := 0;
  except
    Result := -1;
  end;
end;

function AUiMainWindow_Shutdown(): AError;
begin
  try
    _MainWindow_Shutdown();
    Result := 0;
  except
    Result := -1;
  end;
end;

end.
