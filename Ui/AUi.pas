{**
@Abstract User Interface
@Author Prof1983 <prof1983@ya.ru>
@Created 25.10.2008
@LastMod 10.08.2012
}
unit AUi;

{$I A.inc}
{$I Defines.inc}

{$IFDEF FPC}
  {$mode delphi}{$h+}
{$ENDIF}

{$IFDEF OLDMAINFORM2}
  {$DEFINE OLDMAINFORM}
{$ENDIF}

{$IFNDEF NoEvents}
  {$DEFINE USE_EVENTS}
{$ENDIF}

{$IFNDEF NoSettings}
  {$DEFINE USE_SETTINGS}
{$ENDIF}

interface

uses
  ABase, ABaseTypes,
  {AEvents,} ARuntime,
  {$IFDEF USE_SETTINGS}ASettings,{$ENDIF}
  AStrings, ASystem,
  AUiBase, AUiBox, AUiButton, AUiControls, AUiControlsA, AUiData, AUiEventsObj,
  AUiMain, AUiMainWindow, AUiMainWindow2, AUiPageControl, AUiReports,
  AUiToolBar, AUiToolMenu, AUiTreeView, AUiWindows;

// --- AUi ---

function AUi_Boot(): AError;

function AUi_Init(): AError; stdcall;

function AUi_GetMainMenuItem(): AMenuItem; stdcall;

function AUi_GetMainTrayIcon(): ATrayIcon; stdcall;

function AUi_GetMainWindow(): AWindow; stdcall;

function AUi_Run(): AInteger; stdcall;

procedure AUi_SetHideOnClose(Value: ABoolean); stdcall;

function AUi_ShellExecute(const Operation, FileName, Parameters, Directory: AString_Type): AInteger; stdcall;

function AUi_Shutdown(): AError; stdcall;

// --- AUi_Control ---

{ @param FontName - (const) }
function AUi_Control_SetFont1A(Control: AControl; FontName: AStr;
    FontSize: AInt): AError; stdcall;

function AUi_Control_SetFont1P(Control: AControl; const FontName: APascalString;
    FontSize: AInteger): AError; stdcall;

procedure AUi_Control_SetFont1P_Old(Control: AControl; const FontName: APascalString;
    FontSize: AInteger); stdcall;

function AUi_Control_SetFont2P(Control: AControl; const FontName: APascalString;
    FontSize: AInteger; FontColor: AColor): AError; stdcall;

// --- AUi_Image ---

function AUi_Image_LoadFromFile(Image: AControl; const FileName: AString_Type): ABoolean; stdcall;

function AUi_Image_New(Parent: AControl): AControl; stdcall;

// --- AUi_Label ---

function AUi_Label_New(Parent: AControl): AControl; stdcall;

// --- AUi_ListBox ---

function AUi_ListBox_Add(ListBox: AControl; const Text: AString_Type): Integer; stdcall;
procedure AUi_ListBox_Clear(ListBox: AControl); stdcall;
procedure AUi_ListBox_DeleteItem(ListBox: AControl; Index: AInteger); stdcall;
function AUi_ListBox_GetCount(ListBox: AControl): AInteger; stdcall;
function AUi_ListBox_GetItem(ListBox: AControl; Index: AInteger; out Value: AString_Type): AInteger; stdcall;
function AUi_ListBox_GetItemIndex(ListBox: AControl): AInteger; stdcall;
function AUi_ListBox_New(Parent: AControl): AControl; stdcall;
{** Create net list box
    @param Typ: 0 - ListBox; 1 - RadioGroup }
function AUi_ListBox_NewA(Parent: AControl; Typ: AInteger): AControl; stdcall;
procedure AUi_ListBox_SetItem(ListBox: AControl; Index: AInteger; const Value: AString_Type); stdcall;
procedure AUi_ListBox_SetItemIndex(ListBox: AControl; Index: AInteger); stdcall;

function AUi_MainWindow_AddMenuItem(const ParentItemName, Name, Text: AString_Type; OnClick: ACallbackProc; ImageID, Weight: Integer): AMenuItem; stdcall;

function AUi_PropertyBox_Add(PropertyBox: AControl; const Caption: AString_Type): Integer; stdcall;
function AUi_PropertyBox_AddA(PropertyBox: AControl; const Caption, Text, Hint: AString_Type; EditWidth: AInteger): AInteger; stdcall;
function AUi_PropertyBox_Item_GetValue(PropertyBox: AControl; Index: Integer; out Value: AString_Type): AInteger; stdcall;
procedure AUi_PropertyBox_Item_SetValue(PropertyBox: AControl; Index: Integer; const Value: AString_Type); stdcall;
function AUi_PropertyBox_New(Parent: AControl): AControl; stdcall;

// --- AUi_Report ---

function AUi_Report_New(Parent: AControl): AReport; stdcall;

procedure AUi_Report_SetText(Report: AReport; const Value: AString_Type); stdcall;

// --- AUi_SpinButton ---

function AUi_SpinButton_New(Parent: AControl): AControl; stdcall;

// --- AUi_SpinEdit ---

function AUi_SpinEdit_New(Parent: AControl): AControl; stdcall;
function AUi_SpinEdit_NewA(Parent: AControl; Value, MinValue, MaxValue: AInteger): AControl; stdcall;

{ SplitterType
    0 - HSplitter (Align=alTop)
    1 - VSplitter (Align=alLeft)
    2 - HSplitter (Align=alBottom)
    3 - VSplitter (Align=alRight) }
function AUi_Splitter_New(Parent: AControl; SplitterType: AUISplitterType): AControl; stdcall;

// --- AUi_TextView ---

// ��������� ������ � ������� TextView
function AUi_TextView_AddLine(TextView: AControl; const Text: AString_Type): AInteger; stdcall;

{ ������� ����� ������� �������������� ������
  ViewType
    0 - TMemo
    1 - RichEdit }
function AUi_TextView_New(Parent: AControl; ViewType: AInteger): AControl; stdcall;

procedure AUi_TextView_SetFont(TextView: AControl; const FontName: AString_Type; FontSize: AInteger); stdcall;

procedure AUi_TextView_SetReadOnly(TextView: AControl; ReadOnly: ABoolean); stdcall;

{ ScrollBars
    0 - ssNone
    1 - ssHorizontal
    2 - ssVertical
    3 - ssBoth }
procedure AUi_TextView_SetScrollBars(TextView: AControl; ScrollBars: AInteger); stdcall;

procedure AUi_TextView_SetWordWrap(TextView: AControl; Value: ABoolean); stdcall;

// --- AUi_TrayIcon ---

{$IFNDEF UNIX}
function AUi_TrayIcon_GetMenuItems(TrayIcon: ATrayIcon): AMenuItem; stdcall;
{$ENDIF}

// --- AUiWindow ---

procedure AUi_Window_FreeAndNil(var Window: AWindow); stdcall;

procedure AUi_Window_SetBorderStyle(Window: AWindow; BorderStyle: AInteger); stdcall;

procedure AUi_Window_SetFormStyle(Window: AWindow; FormStyle: AInteger); stdcall;

procedure AUi_Window_Free(Window: AWindow); stdcall;

procedure AUi_Window_SetPosition(Window: AWindow; Position: AInteger); stdcall;

function AUi_Window_ShowModal(Window: AWindow): ABoolean; stdcall;

// --- Procs ---

function Init(): AError; stdcall;
function Done(): AError; stdcall;

function InitMainTrayIcon(): AError; stdcall;

function InitMenus(): AError; stdcall;

procedure InitMenus02(); stdcall;

{ Box }

{**
  ������� ����� ������.
  BoxType
    0 - Simple
    1 - HBox
    2 - VBox
}
function Box_New(Parent: AControl; BoxType: AInteger): AControl; stdcall;

function Button_New(Parent: AControl): AButton; stdcall;
function Button_SetKind(Button: AButton; Kind: TAUIButtonKind): AError; stdcall;

function Calendar_New(Parent: AControl): AControl; stdcall;
function Calendar_GetDate(Calendar: AControl): TDateTime; stdcall;
function Calendar_SetMonth(Calendar: AControl; Value: AInteger): AError; stdcall;

//** ����������� ������ ������� ���������.
function Control_Free(Control: AControl): AError; stdcall;

function Control_GetColor(Control: AControl): AColor; stdcall;
function Control_GetEnabled(Control: AControl): ABoolean; stdcall;
function Control_GetHeight(Control: AControl): AInteger; stdcall;
function Control_GetHintP(Control: AControl): APascalString; stdcall;
function Control_GetHintWS(Control: AControl): AWideString; stdcall;

function Control_GetMenu(Control: AControl): AMenu; stdcall;

function Control_GetNameP(Control: AControl): APascalString; stdcall;
function Control_GetNameWS(Control: AControl): AWideString; stdcall;
function Control_GetTextP(Control: AControl): APascalString; stdcall;
function Control_GetVisible(Control: AControl): ABoolean; stdcall;
function Control_GetWidth(Control: AControl): AInteger; stdcall;

//** ������ ������������� ��������.
function Control_SetAlign(Control: AControl; Align: TUIAlign): AError; stdcall;

//** ������ ������������� ��������.
procedure Control_SetAlign02(Control: AControl; Align: TUIAlign); stdcall;

//** ������ ���������� ������ ��������.
function Control_SetClientSize(Control: AControl; ClientWidth, ClientHeight: AInteger): AError; stdcall;

//** ������ ���� ��������.
function Control_SetColor(Control: AControl; Color: AColor): AError; stdcall;

//** ������ ���� ��������.
procedure Control_SetColor02(Control: AControl; Color: AColor); stdcall;

function Control_SetEnabled(Control: AControl; Value: ABoolean): AError; stdcall;
function Control_SetFocus(Control: AControl): ABoolean; stdcall;

//** ������ �����.
function Control_SetFont1A(Control: AControl; {const} FontName: PAnsiChar; FontSize: AInteger): AError; stdcall;

//** ������ �����.
function Control_SetFont1P(Control: AControl; const FontName: APascalString; FontSize: AInteger): AError; stdcall;

function Control_SetFont2P(Control: AControl; const FontName: APascalString; FontSize: AInteger; FontColor: AColor): AError; stdcall;
function Control_SetHeight(Control: AControl; Value: AInteger): AInteger; stdcall;
procedure Control_SetHint02(Control: AControl; const Value: APascalString); stdcall;
function Control_SetHintP(Control: AControl; const Value: APascalString): AError; stdcall;
function Control_SetHintWS(Control: AControl; const Value: AWideString): AError; stdcall;
procedure Control_SetName02(Control: AControl; const Value: APascalString); stdcall;
function Control_SetNameP(Control: AControl; const Value: APascalString): AError; stdcall;
function Control_SetNameWS(Control: AControl; const Value: AWideString): AError; stdcall;
function Control_SetOnChange(Control: AControl; OnChange: ACallbackProc): AError; stdcall;
procedure Control_SetOnChange02(Control: AControl; OnChange: ACallbackProc02); stdcall;
function Control_SetOnChangeEx(Control: AControl; OnChange: ACallbackProc03; Obj: AInteger): AError; stdcall;
function Control_SetOnClick(Control: AControl; Value: ACallbackProc): AError; stdcall;
procedure Control_SetOnClick02(Control: AControl; Value: ACallbackProc02); stdcall;

//** ������ ������������ ��������.
function Control_SetPosition(Control: AControl; Left, Top: AInteger): AError; stdcall;

procedure Control_SetPosition02(Control: AControl; Left, Top: Integer); stdcall;

//** ������ ������� ������ ��������.
function Control_SetSize(Control: AControl; Width, Height: Integer): AError; stdcall;

procedure Control_SetSize02(Control: AControl; Width, Height: Integer); stdcall;

//** ������ ����� ��������.
procedure Control_SetText02(Control: AControl; const Value: AWideString); stdcall;

//** ������ ����� ��������.
function Control_SetTextP(Control: AControl; const Value: APascalString): AError; stdcall;

//** ������ ����� ��������.
function Control_SetTextWS(Control: AControl; const Value: AWideString): AError; stdcall;

//** ������ ��������� ��������.
function Control_SetVisible(Control: AControl; Value: ABoolean): AError; stdcall;

//** ������ ��������� ��������.
procedure Control_SetVisible02(Control: AControl; Value: ABoolean); stdcall;

function Control_SetWidth(Control: AControl; Value: AInteger): AInteger; stdcall;

function DataSource_New(): PADataSource; stdcall;
procedure DataSource_SetOnDataChange02(DataSource: PADataSource; OnDataChange: ACallbackProc02); stdcall;

{ Dialog }

function Dialog_About: AError; stdcall;

function Dialog_About_New: AWindow; stdcall;

function Dialog_AddButtonP(Win: AWindow; Left, Width: AInteger; const Text: APascalString;
    OnClick: ACallbackProc): AControl; stdcall;

function Dialog_AddButtonWS(Win: AWindow; Left, Width: AInteger; const Text: AWideString;
    OnClick: ACallbackProc): AControl; stdcall;

function Dialog_Calendar(var Date: TDateTime; CenterX, CenterY: AInteger): ABoolean; stdcall;

function Dialog_Color(var Color: AColor): ABoolean; stdcall;

function Dialog_DateFilter(var Group: Integer; var DateBegin, DateEnd: TDateTime): Boolean; stdcall;

function Dialog_ErrorP(const Caption, UserMessage, ExceptMessage: APascalString): AError; stdcall;

function Dialog_ErrorWS(const Caption, UserMessage, ExceptMessage: AWideString): AError; stdcall;

function Dialog_FontP(var FontName: APascalString; var FontSize: AInteger; FontColor: AColor): ABoolean; stdcall;

//** ���������� ����.
function Dialog_GetWindow(Dialog: ADialog): AWindow; stdcall;

function Dialog_InputBox1P(const Text: APascalString; var Value: APascalString): Boolean; stdcall;

function Dialog_InputBox1WS(const Text: AWideString; var Value: AWideString): ABoolean; stdcall;

function Dialog_InputBox2P(const Caption, Text1, Text2: APascalString; var Value1, Value2: APascalString): ABoolean; stdcall;

function Dialog_InputBox2WS(const Caption, Text1, Text2: AWideString; var Value1, Value2: AWideString): ABoolean; stdcall;

function Dialog_InputBox3P(const Caption, Text: APascalString; var Value: APascalString): Boolean; stdcall;

function Dialog_InputBox3WS(const Caption, Text: AWideString; var Value: AWideString): ABoolean; stdcall;

function Dialog_LoginP(var UserName, Password: APascalString; IsSave: ABoolean): ABoolean; stdcall;

function Dialog_LoginWS(var UserName, Password: AWideString; IsSave: ABoolean): ABoolean; stdcall;

function Dialog_MessageDlgWS(const Msg: AWideString; MsgDlgType: AInteger; Flags: AMessageBoxFlags): AInteger; stdcall;

function Dialog_MessageP(const Text, Caption: APascalString; Flags: AMessageBoxFlags): ADialogBoxCommands; stdcall;

function Dialog_MessageWS(const Text, Caption: APascalString; Flags: AMessageBoxFlags): ADialogBoxCommands; stdcall;

//** ������� ����� ������.
function Dialog_New(Buttons: AUIWindowButtons): ADialog; stdcall;

function Dialog_OpenFileWS(const InitialDir, Filter, Title: AWideString; var FileName: AWideString): ABoolean; stdcall;

// ���������� ���� ������ � ��������� ������.
function Dialog_PrinterSetup(): AError; stdcall;

function Dialog_SelectDirectoryP(var Directory: APascalString): ABoolean; stdcall;

{ Edit }

function Edit_CheckDate(Edit: AControl; out Value: TDateTime): ABoolean; stdcall;

function Edit_CheckFloat(Edit: AControl; out Value: Double): ABoolean; stdcall;

function Edit_CheckFloat32(Edit: AControl; out Value: AFloat32): ABoolean;

function Edit_CheckFloat64(Edit: AControl; out Value: AFloat64): ABoolean;

// ��������� ����� � Int. ���� ������, �� ��������� �� ���� ��������� � ���������� False.
function Edit_CheckInt(Edit: AControl; out Value: AInteger): ABoolean; stdcall;

// ������� ����� ������� TEdit.
function Edit_New(Parent: AControl): AControl; stdcall;

{**
  ������� ����� ������� TEdit.
  EditType
    0 - TEdit
    1 - TEdit + Button
    3 - TSpinEdit
}
function Edit_New02(Parent: AControl; EditType: AInteger; OnClick: ACallbackProc02;
    Left, Top, Width: AInteger): AControl; stdcall;

{**
  ������� ����� ������� TEdit.
  EditType
    0 - TEdit
    1 - TEdit + Button
    3 - TSpinEdit
}
function Edit_NewA(Parent: AControl; EditType: AInteger; OnClick: ACallbackProc;
    Left, Top, Width: AInteger): AControl; stdcall;

{ Grid }

// ���������� ������� �������. ���� �������� ������ ��� TStringGrid.
function Grid_Clear(Grid: AControl): AError; stdcall;

// ���������� ������� �������. ���� �������� ������ ��� TStringGrid.
function Grid_ClearA(Grid: AControl; FixedRows: AInteger): AError; stdcall;

//** ������� ��������� ������.
function Grid_DeleteRow2(Grid: AControl; Row: AInteger): AError; stdcall;

function Grid_SetColumnWidth(Grid: AControl; ColumnIndex, Width, Persent, MinWidth: AInteger): AError; stdcall;

procedure Grid_SetColumnWidth02(Grid: AControl; ColumnIndex, Width, Persent, MinWidth: AInteger); stdcall;

function Grid_SetColumnWidth2(Grid: AControl; ColumnIndex, Width, Persent, MinWidth, MaxWidth: AInteger): AError; stdcall;

procedure Grid_SetColumnWidthA(Grid: AControl; ColumnIndex, Width, Persent, MinWidth, MaxWidth: AInteger); stdcall;

// ���������� ����� �������� � �������� �������. �������� ���� ������ ��� TStringGrid.
function Grid_FindInt(Grid: AControl; Col, Value: AInteger): AInteger; stdcall;

{ GridType
    0 - StringGrid
    1 - DBGrid }
function Grid_New(Parent: AControl; GridType: AInteger): AControl; stdcall;

// ��������������� �������� DBGrid ��� StringGrid.
function Grid_RestoreColPropsWS(Grid: AControl; Config: AConfig; const Key: AWideString; Delimer: AWideChar = '\'): AError; stdcall;

// ��������������� �������� DBGrid ��� StringGrid.
procedure Grid_RestoreColPropsWS02(Grid: AControl; Config: AConfig; const Key: AWideString; Delimer: AWideChar = '\'); stdcall;

// ������� �������. �������� ���� ������ ��� TStringGrid.
function Grid_RowDelete(Grid: AControl): AError; stdcall;

// ���������� ������� ����. �������� ���� ������ ��� TStringGrid.
function Grid_RowDown(Grid: AControl): AError; stdcall;

// ���������� ������� ����. �������� ���� ������ ��� TStringGrid.
function Grid_RowUp(Grid: AControl): AError; stdcall;

// ��������� �������� DBGrid ��� StringGrid.
function Grid_SaveColPropsWS(Grid: AControl; Config: AConfig; const Key: AWideString; Delimer: AWideChar = '\'): AError; stdcall;

// ��������� �������� DBGrid ��� StringGrid.
procedure Grid_SaveColPropsWS02(Grid: AControl; Config: AConfig; const Key: AWideString; Delimer: AWideChar = '\'); stdcall;

function Grid_SetDataSource(Grid: AControl; Value: PADataSource): AError; stdcall;

procedure Grid_SetDataSource02(Grid: AControl; Value: PADataSource); stdcall;

// ������ ���-�� ����� � �������. �������� ���� ������ ��� TStringGrid.
function Grid_SetRowCount(Grid: AControl; Count: AInteger): AError; stdcall;

{ Image }

//** ��������� ����������� �� �����.
function Image_LoadFromFileWS(Image: AControl; const FileName: AWideString): AError; stdcall;

//** ������� ����� �������-�����������.
function Image_New(Parent: AControl): AControl; stdcall;

{ Label }

//** ������� ����� ������� ��������� ������.
function Label_New(Parent: AControl): AControl; stdcall;

// --- ListBox ---

//** ��������� ������ � ������.
function ListBox_AddP(ListBox: AControl; const Text: APascalString): AInteger; stdcall;

//** ��������� ������ � ������.
function ListBox_AddWS(ListBox: AControl; const Text: AWideString): AInteger; stdcall;

//** ������� ����� ������� ListBox.
function ListBox_New(Parent: AControl): AControl; stdcall;

{ MainToolBar }

function MainToolBar(): AControl; stdcall;

procedure MainToolBar_Set(ToolBar: AControl); stdcall;

{ MainWindow }

//** ���������� ������������� �������� ���� ���������.
function MainWindow(): AWindow; stdcall;

//** ��������� ����� ���� � ������� ����.
function MainWindow_AddMenuItem(const ParentItemName, Name, Text: APascalString;
    OnClick: ACallbackProc; ImageID, Weight: Integer): AMenuItem; stdcall;

//** ��������� ����� ���� � ������� ����.
function MainWindow_AddMenuItem02(const ParentItemName, Name, Text: APascalString;
    OnClick: ACallbackProc02; ImageID, Weight: AInteger): AMenuItem; stdcall;

//** ��������� ����� ���� � ������� ����.
function MainWindow_AddMenuItem03WS(const ParentItemName, Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight: AInteger): AMenuItem; stdcall;

//** ��������� ����� ���� � ������� ����.
function MainWindow_AddMenuItem2(const ParentItemName, Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;

//** ��������� ����� ���� � ������� ����.
function MainWindow_AddMenuItem2WS(const ParentItemName, Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;

//** ��������� ����� ���� � ������� ����.
function MainWindow_AddMenuItem2WS02(const ParentItemName, Name, Text: AWideString;
    OnClick: ACallbackProc02; ImageId, Weight: AInteger): AMenuItem; stdcall;

function MainWindow_GetLeftContainer(): AControl; stdcall;

//** ���������� �������� ��������� UI.
function MainWindow_GetMainContainer(): AControl; stdcall;

function MainWindow_GetRightContainer(): AControl; stdcall;

procedure MainWindow_Set(Value: AWindow); stdcall;

procedure MainWindow_SetA(Value: AWindow; ToolBar, StatusBar: AControl; Config: AConfig); stdcall;

{ Menu }

function MenuItem_Clear(MenuItem: AMenuItem): AError; stdcall;

function MenuItem_FindByName(MenuItem: AMenuItem; const Name: APascalString): AMenuItem; stdcall;

function MenuItem_SetChecked(MenuItem: AMenuItem; Checked: ABoolean): AError; stdcall;

//** ��������� ����� ����.
function Menu_AddItem0(Parent: AMenuItem; MenuItem: AMenuItem; Weight: AInteger): AMenuItem; stdcall;

//** ��������� ����� ����.
function Menu_AddItem1(Menu: AMenu; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;

//** ��������� ����� ����.
function Menu_AddItem1P(Menu: AMenu; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;

//** ��������� ����� ����.
function Menu_AddItem2(Parent: AMenuItem; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;

//** ��������� ����� ����.
function Menu_AddItem2P(Parent: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageID, Weight: Integer): AMenuItem; stdcall;

//** ��������� ����� ����.
function Menu_AddItem2WS(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: Integer): AMenuItem; stdcall;

//** ��������� ����� ����.
function Menu_AddItem2WS02(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc02; ImageID, Weight: Integer): AMenuItem; stdcall;

//** ��������� ����� ����.
function Menu_AddItem2WS03(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageID, Weight: AInteger): AMenuItem; stdcall;

//** ��������� ����� ����.
function Menu_AddItem3(Parent: AMenuItem; MenuItem: AMenuItem; Weight: AInteger): AMenuItem; stdcall; deprecated; { Use Menu_AddItem0() }

//** ��������� ����� ����.
function Menu_AddItem3WS(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageID, Weight, Tag: Integer): AMenuItem; stdcall;

//** ��������� ����� ����.
function Menu_AddItem3WS03(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageID, Weight, Tag: Integer): AMenuItem; stdcall;

function Menu_GetItems(Menu: AMenu): AMenuItem; stdcall;

function Menu_New(MenuType: AInteger): AMenu; stdcall;

{ PageControl }

{ ������� ����� �������. ����������:
  0 - ���� ��������� ������, ����� ������������� ����� ������� (���� �������� ������ �������) }
function PageControl_AddPage(PageControl: AControl; const Name, Text: APascalString): AControl; stdcall;

{ ������� ����� �������. ����������:
  0 - ���� ��������� ������, ����� ������������� ����� ������� (���� �������� ������ �������) }
function PageControl_AddPageWS(PageControl: AControl; const Name, Text: AWideString): AControl; stdcall;

function PageControl_New(Parent: AControl): AControl; stdcall;

{ ProgressBar }

//** ������� ����� ������� ����������� ��������.
function ProgressBar_New(Parent: AControl; Max: AInteger): AControl; stdcall;

//** ����������� �������� ��������� �� ���� ���.
function ProgressBar_StepIt(ProgressBar: AControl): AInteger; stdcall;

{ Report }

function Report_New(Parent: AControl): AReport; stdcall;

{ ReportWin }

function ReportWin_New(): AWindow; stdcall;

{ ������� ����� ���� ������.
  ReportWinType - ��� ���� ������: 0-TReportForm; 1-SimpleReport }
function ReportWin_New2P(ReportWinType: AInteger; const Text: APascalString): AWindow; stdcall;

{ ������� ����� ���� ������.
  ReportWinType - ��� ���� ������: 0-TReportForm; 1-SimpleReport }
function ReportWin_New2WS(ReportWinType: AInteger; const Text: AWideString): AWindow; stdcall;

{ ������� ����� ���� ������.
  ReportWinType - ��� ���� ������: 0-TReportForm; 1-SimpleReport }
function ReportWin_NewWS(ReportWinType: AInteger; const Text: AWideString): AWindow; stdcall;

// ���������� ��������� ���� � �������.
function ReportWin_ShowReportP(const Text: APascalString; Font: AFont): AError; stdcall;

{ --- TextView --- }

//** ��������� ������ � ������� TextView.
function TextView_AddLineWS(TextView: AControl; const Text: AWideString): AInteger; stdcall;

{**
  ������� ����� ������� �������������� ������
  ViewType
    0 - TMemo
    1 - RichEdit
}
function TextView_New(Parent: AControl; ViewType: AInteger): AControl; stdcall;

//** ������������� �������� ��������� "������ ������".
function TextView_SetReadOnly(TextView: AControl; ReadOnly: ABoolean): AError; stdcall;

//** ������������� �������� ��������� "������ ������".
procedure TextView_SetReadOnly02(TextView: AControl; ReadOnly: ABoolean); stdcall;

{**
  ��������� ����� �������� ����������.
  ScrollBars
    0 - ssNone
    1 - ssHorizontal
    2 - ssVertical
    3 - ssBoth
}
function TextView_SetScrollBars(TextView: AControl; ScrollBars: AInteger): AError; stdcall;

{**
  ��������� ����� �������� ����������.
  ScrollBars
    0 - ssNone
    1 - ssHorizontal
    2 - ssVertical
    3 - ssBoth
}
procedure TextView_SetScrollBars02(TextView: AControl; ScrollBars: AInteger); stdcall;

//** ������ �������� "���������� �� ������".
function TextView_SetWordWrap(TextView: AControl; Value: ABoolean): AError; stdcall;

//** ������ �������� "���������� �� ������".
procedure TextView_SetWordWrap02(TextView: AControl; Value: ABoolean); stdcall;

{ --- ToolBar --- }

function ToolBar_AddButtonWS(ToolBar: AControl; const Name, Text, Hint: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AButton; stdcall;

function ToolBar_AddButtonWS02(ToolBar: AControl; const Name, Text, Hint: AWideString;
    OnClick: ACallbackProc02; ImageId, Weight: AInteger): AButton; stdcall;

function ToolBar_AddButtonWS03(ToolBar: AControl; const Name, Text, Hint: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight: AInteger): AButton; stdcall;

function ToolBar_New(Parent: AControl): AControl; stdcall;

// --- ToolMenu ---

function ToolMenu_AddButtonWS(ToolMenu: AToolMenu; const Name, Text, Hint: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight: AInteger): AButton; stdcall;

function ToolMenu_AddNewItemWS(Parent: AToolMenu; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AToolMenu; stdcall;

function ToolMenu_AddNewSubMenu(Parent: AToolMenu; const Name, Text: AString_Type;
    ImageId, Weight: AInteger): AToolMenu; stdcall;

function ToolMenu_AddNewSubMenuWS(Parent: AToolMenu; const Name, Text: AWideString;
    ImageId, Weight: AInteger): AToolMenu; stdcall;

function ToolMenu_GetSubMenuWS(Parent: AToolMenu; const Name, Text: AWideString;
    ImageId, Weight: AInteger): AToolMenu; stdcall;

function ToolMenu_New(Parent: AControl): AToolMenu; stdcall;

// --- TreeView ---

//** ��������� ������� � TreeView.
function TreeView_AddItemWS(TreeView: AControl; Parent: ATreeNode; Text: AWideString): ATreeNode; stdcall;

//** ������� ����� ������� TreeView.
function TreeView_New(Parent: AControl): AControl; stdcall;

// --- Splitter ---

{**
  ������� ������������ �����������.
  SplitterType
    0 - HSplitter (Align=alTop)
    1 - VSplitter (Align=alLeft)
    2 - HSplitter (Align=alBottom)
    3 - VSplitter (Align=alRight)
}
function Splitter_New(Parent: AControl; SplitterType: AUISplitterType): AControl; stdcall;

{ WaitWin }

function WaitWin_NewWS(const Caption, Text: AWideString; MaxPosition: Integer): AWindow; stdcall;
function WaitWin_SetMaxPosition(WaitWin: AWindow; MaxPosition: AInteger): AError; stdcall;
function WaitWin_SetPosition(WaitWin: AWindow; Position: AInteger): AError; stdcall;
function WaitWin_SetTextWS(Window: AWindow; const Text: AWideString): AError; stdcall;
function WaitWin_StepBy(Window: AWindow; Step: AInteger): AInteger; stdcall;

{ Window }

// ��������� ���� (������ VCL)
function Window_Add(Window: AWindow): AError; stdcall;

//** ����������� ����.
procedure Window_Free(Window: AWindow); stdcall;

// ���������� ������� ���� ���������� ����
function Window_GetMenu(Window: AWindow): AMenu; stdcall;

{$IFDEF USE_SETTINGS}
function Window_LoadConfig(Window: AWindow; Config: AConfig): ABoolean; stdcall;

function Window_LoadConfig2WS(Window: AWindow; Config: AConfig; const ConfigKey: AWideString): ABoolean; stdcall;
{$ENDIF USE_SETTINGS}

//** ������� ����� ����.
function Window_New(): AControl; stdcall;

{$IFDEF USE_SETTINGS}
function Window_SaveConfig(Window: AWindow; Config: AConfig): ABoolean; stdcall;

function Window_SaveConfig2WS(Window: AWindow; Config: AConfig; const ConfigKey: AWideString): ABoolean; stdcall;
{$ENDIF USE_SETTINGS}

//** ������ ����� ��������� ����.
function Window_SetBorderStyle(Window: AWindow; BorderStyle: AInteger): AError; stdcall;

//** ������ ����� ��������� ����.
procedure Window_SetBorderStyle02(Window: AWindow; BorderStyle: AInteger); stdcall;

//** ������ ����� ����.
function Window_SetFormStyle(Window: AWindow; FormStyle: AInteger): AError; stdcall;

//** ������ ������� ����.
function Window_SetPosition(Window: AWindow; Position: AInteger): AError; stdcall;

{ State = TWindowState
  0 - wsNormal
  1 - wsMinimized
  2 - wsMaximized }
function Window_SetState(Window: AWindow; State: AInteger): AError; stdcall;

//** ���������� ���� ��������.
function Window_ShowModal(Window: AWindow): ABoolean; stdcall;

{ UI }

// ��������. �������� ������� ��������� � .\Modules\AUI.pas.
function UI_Boot(): AError;

// --- UI_Button ---

// Use Button_New()
function UI_Button_New(Parent: AControl): AButton; stdcall; deprecated;
// Use Button_SetKind()
procedure UI_Button_SetKind(Button: AButton; Kind: TAUIButtonKind); stdcall; deprecated;

function UI_Calendar_GetDate(Calendar: AControl): TDateTime; stdcall;
function UI_Calendar_New(Parent: AControl): AControl; stdcall;
procedure UI_Calendar_SetMonth(Calendar: AControl; Value: AInteger); stdcall;

function UI_ComboBox_Add(ComboBox: AControl; const Value: APascalString): AInteger; stdcall;
function UI_ComboBox_GetItemIndex(ComboBox: AControl): AInteger; stdcall;
function UI_ComboBox_New(Parent: AControl): AControl; stdcall;
function UI_ComboBox_NewA(Parent: AControl; Left, Top, Width: AInteger): AControl; stdcall;
procedure UI_ComboBox_SetItemIndex(ComboBox: AControl; Value: AInteger); stdcall;

procedure UI_Control_Free(Control: AControl); stdcall; {deprecated;}
procedure UI_Control_FreeAndNil(var Control: AControl); stdcall; {deprecated;}
function UI_Control_GetColor(Control: AControl): AColor; stdcall; {deprecated;}
function UI_Control_GetEnabled(Control: AControl): ABoolean; stdcall; {deprecated;}
function UI_Control_GetHeight(Control: AControl): AInteger; stdcall; {deprecated;}
function UI_Control_GetHint(Control: AControl): APascalString; stdcall; {deprecated;}
function UI_Control_GetName(Control: AControl): APascalString; stdcall; {deprecated;}
function UI_Control_GetText(Control: AControl): APascalString; stdcall; {deprecated;}
function UI_Control_GetVisible(Control: AControl): ABoolean; stdcall; {deprecated;}
function UI_Control_GetWidth(Control: AControl): AInteger; stdcall; {deprecated;}
procedure UI_Control_SetClientSize(Control: AControl; ClientWidth, ClientHeight: AInteger); stdcall; {deprecated;}

//** ������ ���� ��������.
// Use Control_SetColor()
procedure UI_Control_SetColor(Control: AControl; Color: AColor); stdcall; deprecated;

procedure UI_Control_SetEnabled(Control: AControl; Value: ABoolean); stdcall; {deprecated;}
function UI_Control_SetFocus(Control: AControl): ABoolean; stdcall; {deprecated;}

procedure UI_Control_SetFont1(Control: AControl; const FontName: APascalString; FontSize: AInteger); stdcall; deprecated; // Use Control_SetFont1()

// ���� FontColor = 1, �� ���� �� ����������
procedure UI_Control_SetFont2(Control: AControl; const FontName: APascalString; FontSize: AInteger; FontColor: AColor); stdcall; {deprecated;}

// Use Control_SetHeight()
function UI_Control_SetHeight(Control: AControl; Value: AInteger): AInteger; stdcall; deprecated;

// Use Control_SetHint() or UI_Control_SetHint02()
procedure UI_Control_SetHint(Control: AControl; const Value: APascalString); stdcall; deprecated;
// Use Control_SetName() or UI_Control_SetName02()
procedure UI_Control_SetName(Control: AControl; const Value: APascalString); stdcall; deprecated;
// Use Control_SetOnChange02()
procedure UI_Control_SetOnChange(Control: AControl; OnChange: ACallbackProc02); stdcall; deprecated;
// Use Control_SetOnChangeEx()
procedure UI_Control_SetOnChange2(Control: AControl; OnChange: ACallbackProc02; Obj: AInteger = 0); stdcall; deprecated;
// Use Control_SetOnClick()
procedure UI_Control_SetOnClick(Control: AControl; Value: ACallbackProc02); stdcall; deprecated;
// Use Control_SetPosition()
procedure UI_Control_SetPosition(Control: AControl; Left, Top: AInteger); stdcall; deprecated;
// Use Control_SetSize()
procedure UI_Control_SetSize(Control: AControl; Width, Height: AInteger); stdcall; deprecated;
// Use Control_SetTextP()
procedure UI_Control_SetText(Control: AControl; const Value: AWideString); stdcall; deprecated;
// Use Control_SetVisible()
procedure UI_Control_SetVisible(Control: AControl; Value: ABoolean); stdcall; deprecated;
// Use Control_SetWidth()
function UI_Control_SetWidth(Control: AControl; Value: AInteger): AInteger; stdcall; deprecated;

function UI_DataSource_New: PADataSource; stdcall;
//procedure UI_DataSource_SetDataSet(DataSource: PADataSource; Value: PADataSet); stdcall;
procedure UI_DataSource_SetOnDataChange(DataSource: PADataSource; OnDataChange: ACallbackProc02); stdcall;

procedure UI_Dialog_About; stdcall;

function UI_Dialog_About_New: AWindow; stdcall;

function UI_Dialog_AddButton(Win: AWindow; Left, Width: AInteger; const Text: APascalString;
    OnClick: ACallbackProc): AControl; stdcall;

function UI_Dialog_AddButton02(Win: AWindow; Left, Width: AInteger; const Text: APascalString;
    OnClick: ACallbackProc02): AControl; stdcall;

function UI_Dialog_Calendar(var Date: TDateTime; CenterX, CenterY: AInteger): ABoolean; stdcall;
function UI_Dialog_DateFilter(var Group: Integer; var DateBegin, DateEnd: TDateTime): Boolean; stdcall;
procedure UI_Dialog_Error(const Caption, UserMessage, ExceptMessage: APascalString); stdcall;
function UI_Dialog_Font(var FontName: APascalString; var FontSize: AInteger; FontColor: AColor): ABoolean; stdcall;

function UI_Dialog_InputBox(const Text: APascalString; var Value: APascalString): ABoolean; stdcall;

function UI_Dialog_InputBox2(const Caption, Text1, Text2: APascalString; var Value1, Value2: APascalString): ABoolean; stdcall;

function UI_Dialog_InputBox3(const Caption, Text: APascalString; var Value: APascalString): Boolean; stdcall;

// Use UI_Dialog_InputBox3()
function UI_Dialog_InputBoxA(const Caption, Text: APascalString; var Value: APascalString): ABoolean; stdcall; deprecated;

function UI_Dialog_Login(var UserName, Password: APascalString; IsSave: ABoolean): ABoolean; stdcall;
function UI_Dialog_Message(const Text, Caption: APascalString; Flags: AMessageBoxFlags): ADialogBoxCommands; stdcall;
// Use Dialog_New()
function UI_Dialog_New(Buttons: AUIWindowButtons): ADialog; stdcall; deprecated;
function UI_Dialog_OpenFile(const InitialDir, Filter, Title: APascalString; var FileName: APascalString): ABoolean; stdcall;
function UI_Dialog_OpenFileA(const InitialDir, Filter, DefaultExt, Title: APascalString; var FileName: APascalString; var FilterIndex: AInteger): ABoolean; stdcall;
function UI_Dialog_SaveFile(const Dir, Ext, DefFileName: APascalString): APascalString; stdcall;
function UI_Dialog_SaveFileA(const InitialDir, DefExt, DefFileName, Filter: APascalString; var FilterIndex: AInteger): APascalString; stdcall;

procedure UI_Grid_AddColumn(Grid: AControl; const FieldName, Title: APascalString; Width: Integer); stdcall;

{ GridType
    0 - StringGrid
    1 - DBGrid }
// Use Grid_New()
function UI_Grid_New(Parent: AControl; GridType: AInteger): AControl; stdcall; deprecated;

// ��������������� �������� DBGrid
// Use Grid_RestoreColPropsWS02()
procedure UI_Grid_RestoreColProps(Grid: AControl; Config: AConfig; const Key: APascalString; Delimer: AChar = '\'); stdcall; deprecated;

// Use Grid_SaveColPropsWS02()
procedure UI_Grid_SaveColProps(Grid: AControl; Config: AConfig; const Key: APascalString; Delimer: AChar); stdcall;

// �������� ������ ������� � DBGrid
procedure UI_Grid_SetColumnWidth(Grid: AControl; ColumnIndex, Width, Persent, MinWidth: AInteger); stdcall;
procedure UI_Grid_SetColumnWidthA(Grid: AControl; ColumnIndex, Width, Persent, MinWidth, MaxWidth: AInteger); stdcall;
procedure UI_Grid_SetDataSource(Grid: AControl; Value: PADataSource); stdcall;

{ UI_Image }

//** ��������� ����������� �� �����.
function UI_Image_LoadFromFile(Image: AControl; const FileName: APascalString): ABoolean; stdcall;

//** ������� ����� �������-�����������.
function UI_Image_New(Parent: AControl): AControl; stdcall;

{ UI_Label }

function UI_Label_New(Parent: AControl): AControl; stdcall;
procedure UI_Label_SetFont(TextLabel: AControl; const FontName: APascalString; FontSize: AInteger); stdcall; {$IFNDEF A02}deprecated;{$ENDIF}

// --- UI_ListBox ---

//** ��������� ������ � ������.
function UI_ListBox_Add(ListBox: AControl; const Text: APascalString): Integer; stdcall;

procedure UI_ListBox_Clear(ListBox: AControl); stdcall;

//** ������� ����� ������� ListBox.
function UI_ListBox_New(Parent: AControl): AControl; stdcall;

{ Typ:
  0 - ListBox
  1 - RadioGroup }
function UI_ListBox_NewA(Parent: AControl; Typ: AInteger): AControl; stdcall;
function UI_ListBox_GetCount(ListBox: AControl): AInteger; stdcall;
function UI_ListBox_GetItem(ListBox: AControl; Index: AInteger): APascalString; stdcall;
//function A_UI_ListBox_GetItem(ListBox: AControl; Index: AInteger; out Value: APascalString): AInteger; stdcall;
function UI_ListBox_GetItemIndex(ListBox: AControl): AInteger; stdcall;
procedure UI_ListBox_SetItemIndex(ListBox: AControl; Index: AInteger); stdcall;
procedure UI_ListBox_DeleteItem(ListBox: AControl; Index: AInteger); stdcall;
procedure UI_ListBox_SetItem(ListBox: AControl; Index: AInteger; const Value: APascalString); stdcall;

function UI_MainTrayIcon: ATrayIcon; stdcall;

// Use Menu_GetItems()
function UI_Menu_GetItems(Menu: AMenu): AMenuItem; stdcall; deprecated;

// Use Menu_New()
function UI_Menu_New(MenuType: AInteger): AMenu; stdcall; deprecated;

{ ������� ����� �������. ����������:
  0 - ���� ��������� ������, ����� ������������� ����� ������� (���� �������� ������ �������) }
// Use PageControl_AddPage()
function UI_PageControl_AddPage(PageControl: AControl; const Name, Text: APascalString): AControl; stdcall; deprecated;
// Use PageControl_New()
function UI_PageControl_New(Parent: AControl): AControl; stdcall; deprecated;

function UI_ProgressBar_New(Parent: AControl; Max: AInteger): AControl;
function UI_ProgressBar_StepIt(ProgressBar: AControl): AInteger; 

function UI_PropertyBox_Add(PropertyBox: AControl; const Caption: APascalString): Integer; stdcall;
function UI_PropertyBox_AddA(PropertyBox: AControl; const Caption, Text, Hint: APascalString; EditWidth: AInteger): AInteger; stdcall;
function UI_PropertyBox_Item_GetValue(PropertyBox: AControl; Index: Integer): APascalString; stdcall;
//function UI_PropertyBox_Item_GetValue(PropertyBox: AControl; Index: Integer; out Value: APascalString): AInteger; stdcall;
procedure UI_PropertyBox_Item_SetValue(PropertyBox: AControl; Index: Integer; const Value: APascalString); stdcall;
function UI_PropertyBox_New(Parent: AControl): AControl; stdcall;

function UI_SpinButton_New(Parent: AControl): AControl; stdcall;
function UI_SpinEdit_New(Parent: AControl): AControl; stdcall;
function UI_SpinEdit_NewA(Parent: AControl; Value, MinValue, MaxValue: AInteger): AControl; stdcall;

{ SplitterType
    0 - HSplitter (Align=alTop)
    1 - VSplitter (Align=alLeft)
    2 - HSplitter (Align=alBottom)
    3 - VSplitter (Align=alRight) }
function UI_Splitter_New(Parent: AControl; SplitterType: AUISplitterType): AControl; stdcall;

// Use ToolBar_AddButtonWS02()
function UI_ToolBar_AddButton(ToolBar: AControl; const Name, Text, Hint: APascalString;
    OnClick: ACallbackProc; ImageID, Weight: AInteger): AButton; stdcall; deprecated;

// Use ToolBar_New()
function UI_ToolBar_New(Parent: AControl): AControl; stdcall; deprecated;

{$IFNDEF UNIX}
function UI_TrayIcon_GetMenuItems(TrayIcon: ATrayIcon): AMenuItem; stdcall;
{$ENDIF}

// Use TreeView_AddItem()
function UI_TreeView_AddItem(TreeView: AControl; Parent: ATreeNode; Text: APascalString): ATreeNode; stdcall; deprecated;

// Use TreeView_New()
function UI_TreeView_New(Parent: AControl): AControl; stdcall; deprecated;

{ UI_Window }

// Use Window_Free()
procedure UI_Window_Free(Window: AWindow); stdcall; deprecated;

procedure UI_Window_FreeAndNil(var Window: AWindow); stdcall;

{ ���������� ������� ���� ���������� ����
  Use Window_GetMenu() }
function UI_Window_GetMenu(Window: AWindow): AMenu; stdcall; deprecated;

function UI_Window_New: AControl; stdcall; deprecated; // Use AUi_Window_New()

//** ������ ����� ��������� ����.
procedure UI_Window_SetBorderStyle(Window: AWindow; BorderStyle: AInteger); stdcall; deprecated; // Use AUi_Window_SetBorderStyle()

//** ������ ����� ����.
procedure UI_Window_SetFormStyle(Window: AWindow; FormStyle: AInteger); stdcall; deprecated; // Use AUi_Window_SetFormStyle()

//** ������ ������� ����.
procedure UI_Window_SetPosition(Window: AWindow; Position: AInteger); stdcall; deprecated; // Use AUi_Window_SetPosition()

function UI_Window_ShowModal(Window: AWindow): ABoolean; stdcall; deprecated; // Use AUi_Window_ShowModal()

{ UI_Reports }

function UI_Report_New(Parent: AControl): AReport;

procedure UI_Report_SetText(Report: AReport; const Value: APascalString); stdcall;

{ ReportWin }

function UI_ReportWin_New(): AWindow;

{ ReportWinType - ��� ���� ������: 0-TReportForm; 1-SimpleReport
  Use ReportWin_New2P() }
function UI_ReportWin_NewA(ReportWinType: AInteger; const Text: APascalString): AWindow; deprecated;

{ WaitWin }

function UI_WaitWin_New(const Caption, Text: APascalString; MaxPosition: Integer): AWindow; stdcall;

function UI_WaitWin_StepBy(Window: AWindow; Step: AInteger): AInteger; stdcall;

{ Testing }

procedure SetOnMainFormCreate(Value: AProc); stdcall;
procedure SetOnMainFormCreate02(Value: AProc02); stdcall;
function SetProgramState(State: AInteger): AError; stdcall;

//** ���������� ���������� ����������.
function ShowHelp(): AError; stdcall;

//** ���������� ���������� ����������.
procedure ShowHelp02(); stdcall;

//** ���������� ���������� ����������.
function ShowHelp2WS(const FileName: AWideString): AError; stdcall;

function Shutdown(): AError; stdcall;

procedure Shutdown02(); stdcall;

{ UI }

function UI_InitMainMenu(): AInteger; stdcall;

function UI_InitMainTrayIcon: AInteger; stdcall;

procedure UI_InitMenus; stdcall;

function UI_MainMenuItem: AMenuItem; stdcall;

function UI_GetIsShowApp: ABoolean; stdcall;

procedure UI_SetHideOnClose(Value: ABoolean); stdcall;

procedure UI_SetIsShowApp(Value: ABoolean); stdcall;

// Use SetOnMainFormCreate()
procedure UI_OnMainFormCreate_Set(Value: AProc); stdcall; deprecated;

function UI_ProcessMessages: AInteger; stdcall;

procedure UI_ProcessMessages02(); stdcall;

function UI_Run: AInteger; stdcall;

procedure UI_Run02; stdcall;

function UI_Shutdown: AInteger; stdcall;

{ --- UI_TextView --- }

//** ��������� ������ � ������� TextView.
function UI_TextView_AddLine(TextView: AControl; const Text: APascalString): AInteger; stdcall;

{ ������� ����� ������� �������������� ������
  ViewType
    0 - TMemo
    1 - RichEdit }
function UI_TextView_New(Parent: AControl; ViewType: AInteger): AControl; stdcall;

procedure UI_TextView_SetFont(TextView: AControl; const FontName: APascalString; FontSize: AInteger); stdcall;

//** ������������� �������� ��������� "������ ������".
procedure UI_TextView_SetReadOnly(TextView: AControl; ReadOnly: ABoolean); stdcall;

{**
  ��������� ����� �������� ����������.
  ScrollBars
    0 - ssNone
    1 - ssHorizontal
    2 - ssVertical
    3 - ssBoth
}
procedure UI_TextView_SetScrollBars(TextView: AControl; ScrollBars: AInteger); stdcall;

//** ������ �������� "���������� �� ������".
procedure UI_TextView_SetWordWrap(TextView: AControl; Value: ABoolean); stdcall;

function UI_ShellExecute(const Operation, FileName, Parameters, Directory: APascalString): AInteger; stdcall;
function UI_Object_Add(Value: AInteger): AInteger; stdcall;

function UI_Dialog_Color(var Color: AColor): ABoolean; stdcall;
function UI_Dialog_SelectDirectory(var Directory: APascalString): ABoolean; stdcall;

{ Protected }

// Use Dialog_GetWindow()
function UI_Dialog_GetWindow(Dialog: ADialog): AWindow; stdcall; deprecated;

function UI_Init(): AError; stdcall; deprecated; // Use AUi_Init()
function Done04(): AError; stdcall;

{$IFDEF USE_EVENTS}
//** ������������ � ������� OnDone.
function OnDone_Connect(Proc: ACallbackProc): AInteger; stdcall;

//** ����������� �� ������� OnDone.
function OnDone_Disconnect(Proc: ACallbackProc): AInteger; stdcall;
{$ENDIF}

function ProcessMessages(): AError; stdcall;

procedure ProcessMessages02(); stdcall;

{ Private }

var
  UIAboutClick: AProc;
  UIAboutWinMemoHeightDefault: Integer = 0;
  UIAboutWinMemoWidthDefault: Integer = 0;

implementation

uses
  //LResources,
  {$IFDEF UNIX}
    {$IFDEF UseCThreads}
    cthreads,
    {$ENDIF}
  {$ENDIF}
  {$IFDEF FPC}Interfaces,{$ELSE}Mask,{$ENDIF}
  Buttons, Classes, Controls, ComCtrls, Db, DbGrids, ExtCtrls, Forms, Graphics, Grids, Menus, StdCtrls, SysUtils,
  {$IFDEF MSWINDOWS}ShellApi, Windows,{$ENDIF}
  AUiCalendar, AUiDialogs, AUiEdit, AUiGrids, {AUiForm,} AUiMenus, AUiPropertyBox, AUiSpin, AUiTrayIcon,
  {$IFDEF MSWINDOWS}
  fError, fInputDialog, fLogin, fMessage, fPasswordDialog, fWait,
  {$ENDIF}
  {$IFNDEF FPC}fCalendar, fDateFilter,{$ENDIF}
  {$IFDEF OLDMAINFORM}fMain,{$ENDIF}
  fAbout;

{ Types }

type
  TAUIColumn = {$IFDEF UNIX}TGridColumn{$ELSE}TColumn{$ENDIF};

{ Events }

procedure DoMainFormCreate; stdcall;
var
  MainForm: TForm;
begin
  Application.CreateForm({$IFDEF OLDMAINFORM}TMainForm{$ELSE}TForm{$ENDIF}, MainForm);
  MainForm.Left := 0;
  MainForm.Top := 0;
  {$IFDEF OLDMAINFORM}
    {$IFDEF OLDMAINFORM2}
    _MainWindow_Create(MainForm, 0, Runtime_GetConfig);
    {$ELSE}
    _MainWindow_Create(MainForm, MainWindowFormatCreateMenu or MainWindowFormatCreateToolBar or MainWindowFormatCreateStatusBar, ASystem.GetConfig);
    {$ENDIF}
    FMainWindow := AddObject(MainForm);
  {$ELSE}
    FMainWindow := AddObject(MainForm);
    MainForm.Name := 'MainForm';
    MainForm.Caption := ASystem.Info_GetProgramNameP;
    _MainWindow_Create(MainForm, MainWindowFormatCreateAll, ASystem.GetConfig);
    MainForm.OnCloseQuery := UI_.MainFormCloseQuery;
  {$ENDIF}
  AddObject(MainForm.Menu);
end;

procedure DoShowError(const Caption, UserMessage, ExceptMessage: AWideString); stdcall;
begin
  Dialog_ErrorP(Caption, UserMessage, ExceptMessage);
end;

function DoShowMessage(const Text, Caption: AWideString; Flags: AMessageBoxFlags): ADialogBoxCommands; stdcall;
begin
  Result := UI_Dialog_Message(Text, Caption, Flags);
end;

function miAboutClick(Obj, Data: Integer): AError; stdcall;
begin
  if Assigned(UIAboutClick) then
    UIAboutClick
  else
    UI_Dialog_About;
  Result := 0;
end;

procedure miAboutClick1(Obj, Data: Integer); stdcall;
begin
  if Assigned(UIAboutClick) then
    UIAboutClick
  else
    UI_Dialog_About;
end;

function miExitClick(Obj, Data: Integer): AError; stdcall;
begin
  {$IFDEF NoRuntimeEvents}
  AUi_Shutdown();
  {$ELSE}
  ASystem.Shutdown;
  {$ENDIF}
  Result := 0;
end;

procedure miExitClick02(Obj, Data: Integer); stdcall;
begin
  {$IFDEF NoRuntimeEvents}
  AUi_Shutdown();
  {$ELSE}
  ASystem.Shutdown;
  {$ENDIF}
end;

{ Module }

function Done: AError; stdcall;
begin
  {$IFDEF USE_EVENTS}
  AEvents.Event_Invoke(FOnDone, 0);
  {$ENDIF}

  try
    if (FMainTrayIcon <> 0) then
    begin
      {$IFNDEF FPC}
      TrayIcon_Free(FMainTrayIcon);
      {$ENDIF}
      FMainTrayIcon := 0;
    end;
    SetLength(FObjects, 0);
    SetLength(FMenuItems, 0);
  except
  end;

  _MainWindow_Shutdown;

  ASystem.SetOnProcessMessages(nil);
  ASystem.SetOnShowMessage(nil);
  ARuntime.SetOnShutdown(nil);
  ARuntime.SetOnRun(nil);

  {$IFDEF USE_EVENTS}
  AEvents.Event_Free(FOnDone);
  {$ENDIF}
  FOnDone := 0;

  Result := 0;
end;

function Done04(): AError; stdcall;
begin
  Result := Done();
end;

function Init(): AError; stdcall;
begin
  Result := AUi_Init();
end;

function InitMainTrayIcon(): AError; stdcall;
begin
  try
    if (UI_InitMainTrayIcon() <> 0) then
      Result := 0
    else
      Result := -2;
  except
    Result := -1;
  end;
end;

function InitMenus: AError; stdcall;
begin
  try
    UI_InitMenus;
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure InitMenus02(); stdcall;
begin
  try
    UI_InitMenus();
  except
  end;
end;

{$IFDEF USE_EVENTS}
function OnDone_Connect(Proc: ACallbackProc): AInteger; stdcall;
begin
  try
    Result := AUIMain.UI_OnDone_Connect(Proc);
  except
    Result := 0;
  end;
end;
{$ENDIF}

{$IFDEF USE_EVENTS}
function OnDone_Disconnect(Proc: ACallbackProc): AInteger; stdcall;
begin
  try
    Result := AUIMain.UI_OnDone_Disconnect(Proc);
  except
    Result := 0;
  end;
end;
{$ENDIF}

function ProcessMessages(): AError; stdcall;
begin
  try
    Result := UI_ProcessMessages();
  except
    Result := -1;
  end;
end;

procedure ProcessMessages02(); stdcall;
begin
  try
    UI_ProcessMessages();
  except
  end;
end;

procedure SetOnMainFormCreate(Value: AProc); stdcall;
begin
  FOnMainFormCreate := Value;
end;

procedure SetOnMainFormCreate02(Value: AProc02); stdcall;
begin
  {$IFDEF A02}
  FOnMainFormCreate := Value;
  {$ENDIF A02}
end;

function SetProgramState(State: AInteger): AError; stdcall;
begin
  try
    if (State = 1) then
      Screen.Cursor := crNone
    else if (State = 11) then
      Screen.Cursor := crHourGlass
    else
      Screen.Cursor := crDefault;
    Result := 0;
  except
    Result := -1;
  end;
end;

function ShowHelp(): AError; stdcall;
begin
  try
    UI_ShowHelp();
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure ShowHelp02(); stdcall;
begin
  try
    UI_ShowHelp();
  except
  end;
end;

function ShowHelp2WS(const FileName: AWideString): AError; stdcall;
begin
  try
    UI_ShowHelp2(FileName);
    Result := 0;
  except
    Result := -1;
  end;
end;

function Shutdown(): AError; stdcall;
begin
  try
    Result := UI_Shutdown();
  except
    Result := -1;
  end;
end;

procedure Shutdown02(); stdcall;
begin
  try
    UI_Shutdown();
  except
  end;
end;

// --- AUi ---

function AUi_Boot(): AError;
begin
  Result := 0;
end;

function AUi_GetMainMenuItem(): AMenuItem;
begin
  Result := miMain;
end;

function AUi_GetMainTrayIcon(): ATrayIcon;
begin
  Result := FMainTrayIcon;
end;

function AUi_GetMainWindow(): AWindow;
begin
  Result := FMainWindow;
end;

function AUi_Init(): AError;
var
  S: string;
begin
  if (FMainWindow <> 0) then
  begin
    Result := 0;
    Exit;
  end;

  {$IFDEF USE_EVENTS}
  if (AEvents_Init() < 0) then
  begin
    Result := -4;
    Exit;
  end;
  {$ENDIF}

  {$IFDEF USE_SETTINGS}
  ASettings_Init();
  {$ENDIF}

  if (AStrings_Init() < 0) then
  begin
    Result := -2;
    Exit;
  end;

  if (ASystem_Init() < 0) then
  begin
    Result := -3;
    Exit;
  end;

  {$IFDEF USE_EVENTS}
  FOnDone := AEvents.Event_NewW(0, nil);
  {$ENDIF}

  FHideOnClose := False;
  FIsShowApp := True;

  {$IFDEF A02}
  ASystem.SetOnProcessMessages02(UI_ProcessMessages02);
  {$ELSE}
  ASystem.SetOnProcessMessages(UI_ProcessMessages);
  {$ENDIF A02}
  ASystem.SetOnShowError(DoShowError);
  ASystem.SetOnShowMessage(DoShowMessage);

  ARuntime.SetOnShutdown(UI_Shutdown);
  {$IFDEF A01}
    ARuntime.OnRun_Set(UI_Run02);
  {$ELSE}
    {$IFDEF A02}
    ARuntime.OnRun_Set(UI_Run02);
    {$ELSE}
    ARuntime.OnRun_Set(UI_Run);
    {$ENDIF A02}
  {$ENDIF A01}

  {$IFNDEF FPC}
  Application.CreateHandle();
  {$ENDIF}

  Application.Initialize();
  Application.Title := ASystem.Info_GetTitleWS();
  S := ASystem.Info_GetDataDirectoryPathP() + ASystem.Info_GetProgramNameWS() + '.ico';

  if FileExists(S) then
  try
    Application.Icon.LoadFromFile(S);
  except
    ASystem.ShowMessageP('������ ��� �������� ����������� '+S);
  end;

  try
    if Assigned(FOnMainFormCreate) then
      FOnMainFormCreate
    else
      DoMainFormCreate;
  except
    ASystem.ShowMessageP('��������� ������ ��� �������� �������� ����');
    Result := -100;
    Exit;
  end;
  {
  if (FMainWindow <> 0) then
    miMain := AddObject(TForm(FMainWindow).Menu.Items);
  }

  Result := 0;
end;

function AUi_Run(): AInteger;
begin
  try
    Result := UI_Run;
  except
    Result := -1;
  end;
end;

procedure AUi_SetHideOnClose(Value: ABoolean);
begin
  FHideOnClose := Value;
end;

function AUi_ShellExecute(const Operation, FileName, Parameters, Directory: AString_Type): AInteger;
begin
  try
    Result := UI_ShellExecute(
        AStrings.String_ToWideString(Operation),
        AStrings.String_ToWideString(FileName),
        AStrings.String_ToWideString(Parameters),
        AStrings.String_ToWideString(Directory));
  except
    Result := -1;
  end;
end;

function AUi_Shutdown(): AError;
begin
  try
    _MainWindow_Shutdown();
    Result := 0;
  except
    Result := -1;
  end;
end;

// --- AUi_Control ---

function AUi_Control_SetFont1A(Control: AControl; FontName: AStr; FontSize: AInt): AError;
begin
  try
    AUiControls.Ui_Control_SetFont1(Control, FontName, FontSize);
    Result := 0;
  except
    Result := -1;
  end;
end;

function AUi_Control_SetFont1P(Control: AControl; const FontName: APascalString;
    FontSize: AInteger): AError;
begin
  try
    AUiControls.Ui_Control_SetFont1(Control, FontName, FontSize);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure AUi_Control_SetFont1P_Old(Control: AControl; const FontName: APascalString;
    FontSize: AInteger);
begin
  AUi_Control_SetFont1P(Control, FontName, FontSize);
end;

function AUi_Control_SetFont2P(Control: AControl; const FontName: APascalString;
    FontSize: AInteger; FontColor: AColor): AError;
begin
  if (TObject(Control) is TLabel) then
  begin
    if (FontName <> '') then
      TLabel(Control).Font.Name := FontName;
    if (FontSize <> 0) then
      TLabel(Control).Font.Size := FontSize;
    if (FontColor <> 1) then
      TLabel(Control).Font.Color := FontColor;
  end;
  Result := 0;
end;

// --- AUi_Image ---

function AUi_Image_LoadFromFile(Image: AControl; const FileName: AString_Type): ABoolean;
begin
  try
    Result := UI_Image_LoadFromFile(Image, AStrings.String_ToWideString(FileName));
  except
    Result := False;
  end;
end;

function AUi_Image_New(Parent: AControl): AControl;
begin
  try
    Result := UI_Image_New(Parent);
  except
    Result := 0;
  end;
end;

// --- AUi_Label ---

function AUi_Label_New(Parent: AControl): AControl;
begin
  try
    Result := UI_Label_New(Parent);
  except
    Result := 0;
  end;
end;

// --- AUiListBox ---

function AUi_ListBox_Add(ListBox: AControl; const Text: AString_Type): Integer;
begin
  try
    Result := UI_ListBox_Add(ListBox, AStrings.String_ToWideString(Text));
  except
    Result := -1;
  end;
end;

procedure AUi_ListBox_Clear(ListBox: AControl);
begin
  try
    UI_ListBox_Clear(ListBox);
  except
  end;
end;

procedure AUi_ListBox_DeleteItem(ListBox: AControl; Index: AInteger);
begin
  try
    UI_ListBox_DeleteItem(ListBox, Index);
  except
  end;
end;

function AUi_ListBox_GetCount(ListBox: AControl): AInteger;
begin
  try
    Result := UI_ListBox_GetCount(ListBox);
  except
    Result := 0;
  end;
end;

function AUi_ListBox_GetItem(ListBox: AControl; Index: AInteger; out Value: AString_Type): AInteger;
begin
  try
    Result := AStrings.String_AssignWS(Value, UI_ListBox_GetItem(ListBox, Index));
  except
    Result := 0;
  end;
end;

function AUi_ListBox_GetItemIndex(ListBox: AControl): AInteger;
begin
  try
    Result := UI_ListBox_GetItemIndex(ListBox);
  except
    Result := 0;
  end;
end;

function AUi_ListBox_New(Parent: AControl): AControl;
begin
  Result := AUi_ListBox_NewA(Parent, 0);
end;

function AUi_ListBox_NewA(Parent: AControl; Typ: AInteger): AControl;
begin
  try
    Result := UI_ListBox_NewA(Parent, Typ);
  except
    Result := 0;
  end;
end;

procedure AUi_ListBox_SetItem(ListBox: AControl; Index: AInteger; const Value: AString_Type);
begin
  try
    UI_ListBox_SetItem(ListBox, Index, AStrings.String_ToWideString(Value));
  except
  end;
end;

procedure AUi_ListBox_SetItemIndex(ListBox: AControl; Index: AInteger);
begin
  try
    UI_ListBox_SetItemIndex(ListBox, Index);
  except
  end;
end;

// --- AUi_MainWindow ---

function AUi_MainWindow_AddMenuItem(const ParentItemName, Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageID, Weight: Integer): AMenuItem;
begin
  Result := AUI.MainWindow_AddMenuItem2(ParentItemName, Name, Text, OnClick, ImageID, Weight);
end;

// --- AUi_PropertyBox ---

function AUi_PropertyBox_Add(PropertyBox: AControl; const Caption: AString_Type): Integer;
begin
  try
    Result := UI_PropertyBox_Add(PropertyBox, AStrings.String_ToWideString(Caption));
  except
    Result := 0;
  end;
end;

function AUi_PropertyBox_AddA(PropertyBox: AControl; const Caption, Text, Hint: AString_Type;
    EditWidth: AInteger): AInteger;
begin
  try
    Result := UI_PropertyBox_AddA(PropertyBox,
        AStrings.String_ToWideString(Caption),
        AStrings.String_ToWideString(Text),
        AStrings.String_ToWideString(Hint),
        EditWidth);
  except
    Result := 0;
  end;
end;

function AUi_PropertyBox_Item_GetValue(PropertyBox: AControl; Index: Integer; out Value: AString_Type): AInteger;
begin
  try
    Result := AStrings.String_AssignWS(Value, UI_PropertyBox_Item_GetValue(PropertyBox, Index));
  except
    Result := 0;
  end;
end;

procedure AUi_PropertyBox_Item_SetValue(PropertyBox: AControl; Index: Integer; const Value: AString_Type);
begin
  try
    UI_PropertyBox_Item_SetValue(PropertyBox, Index, AStrings.String_ToWideString(Value));
  except
  end;
end;

function AUi_PropertyBox_New(Parent: AControl): AControl;
begin
  try
    Result := UI_PropertyBox_New(Parent);
  except
    Result := 0;
  end;
end;

// --- AUi_Report ---

function AUi_Report_New(Parent: AControl): AReport;
begin
  try
    Result := UI_Report_New(Parent);
  except
    Result := 0;
  end;
end;

procedure AUi_Report_SetText(Report: AReport; const Value: AString_Type);
begin
  try
    UI_Report_SetText(Report, AStrings.String_ToWideString(Value));
  except
  end;
end;

// --- AUi_SpinButton ---

function AUi_SpinButton_New(Parent: AControl): AControl; stdcall;
begin
  try
    Result := UI_SpinButton_New(Parent);
  except
    Result := 0;
  end;
end;

// --- AUi_SpinEdit ---

function AUi_SpinEdit_New(Parent: AControl): AControl;
begin
  try
    Result := UI_SpinEdit_New(Parent);
  except
    Result := 0;
  end;
end;

function AUi_SpinEdit_NewA(Parent: AControl; Value, MinValue, MaxValue: AInteger): AControl;
begin
  try
    Result := UI_SpinEdit_NewA(Parent, Value, MinValue, MaxValue);
  except
    Result := 0;
  end;
end;

// --- AUi_Splitter ---

function AUi_Splitter_New(Parent: AControl; SplitterType: AUISplitterType): AControl;
begin
  try
    Result := UI_Splitter_New(Parent, SplitterType);
  except
    Result := 0;
  end;
end;

// --- AUi_TextView ---

function AUi_TextView_AddLine(TextView: AControl; const Text: AString_Type): AInteger;
begin
  try
    Result := UI_TextView_AddLine(TextView, AStrings.String_ToWideString(Text));
  except
    Result := -1;
  end;
end;

function AUi_TextView_New(Parent: AControl; ViewType: AInteger): AControl;
begin
  try
    Result := UI_TextView_New(Parent, ViewType);
  except
    Result := 0;
  end;
end;

procedure AUi_TextView_SetFont(TextView: AControl; const FontName: AString_Type; FontSize: AInteger);
begin
  try
    UI_TextView_SetFont(TextView, AStrings.String_ToWideString(FontName), FontSize);
  except
  end;
end;

procedure AUi_TextView_SetReadOnly(TextView: AControl; ReadOnly: ABoolean);
begin
  try
    UI_TextView_SetReadOnly(TextView, ReadOnly);
  except
  end;
end;

procedure AUi_TextView_SetScrollBars(TextView: AControl; ScrollBars: AInteger);
begin
  try
    UI_TextView_SetScrollBars(TextView, ScrollBars);
  except
  end;
end;

procedure AUi_TextView_SetWordWrap(TextView: AControl; Value: ABoolean);
begin
  try
    UI_TextView_SetWordWrap(TextView, Value);
  except
  end;
end;

// --- AUi_TrayIcon ---

function AUi_TrayIcon_GetMenuItems(TrayIcon: ATrayIcon): AMenuItem; stdcall;
begin
  try
    Result := UI_TrayIcon_GetMenuItems(TrayIcon);
  except
    Result := 0;
  end;
end;

// --- AUi_Window ---

procedure AUi_Window_Free(Window: AWindow);
begin
  AUI.Control_Free(Window);
end;

procedure AUi_Window_FreeAndNil(var Window: AWindow);
begin
  AUi_Window_Free(Window);
  Window := 0;
end;

procedure AUi_Window_SetBorderStyle(Window: AWindow; BorderStyle: AInteger);
begin
  try
    AUiWindows.Ui_Window_SetBorderStyle(Window, BorderStyle);
  except
  end;
end;

procedure AUi_Window_SetFormStyle(Window: AWindow; FormStyle: AInteger);
begin
  try
    AUiWindows.Ui_Window_SetFormStyle(Window, FormStyle);
  except
  end;
end;

procedure AUi_Window_SetPosition(Window: AWindow; Position: AInteger);
begin
  try
    AUiWindows.Ui_Window_SetPosition(Window, Position);
  except
  end;
end;

function AUi_Window_ShowModal(Window: AWindow): ABoolean;
begin
  try
    Result := AUiWindows.Ui_Window_ShowModal(Window);
  except
    Result := False;
  end;
end;

{ Box }

function Box_New(Parent: AControl; BoxType: AInteger): AControl; stdcall;
begin
  try
    Result := AUIBox.UI_Box_New(Parent, BoxType);
  except
    Result := 0;
  end;
end;

{ Button }

function Button_New(Parent: AControl): AButton; stdcall;
begin
  try
    Result := AUIButton.UI_Button_New(Parent);
  except
    Result := 0;
  end;
end;

function Button_SetKind(Button: AButton; Kind: TAUIButtonKind): AError; stdcall;
begin
  try
    AUIButton.UI_Button_SetKind(Button, Kind);
    Result := 0;
  except
    Result := -1;
  end;
end;

{ Calendar }

function Calendar_GetDate(Calendar: AControl): TDateTime; stdcall;
begin
  try
    Result := UI_Calendar_GetDate(Calendar);
  except
    Result := -1;
  end;
end;

function Calendar_New(Parent: AControl): AControl; stdcall;
begin
  try
    Result := UI_Calendar_New(Parent);
  except
    Result := 0;
  end;
end;

function Calendar_SetMonth(Calendar: AControl; Value: AInteger): AError; stdcall;
begin
  try
    UI_Calendar_SetMonth(Calendar, Value);
    Result := 0;
  except
    Result := -1;
  end;
end;

{ ComboBox }

function ComboBox_Add(ComboBox: AControl; const Value: AString_Type): AInteger; stdcall;
begin
  try
    Result := UI_ComboBox_Add(ComboBox, AStrings.String_ToWideString(Value));
  except
    Result := -1;
  end;
end;

function ComboBox_GetItemIndex(ComboBox: AControl): AInteger; stdcall;
begin
  try
    Result := UI_ComboBox_GetItemIndex(ComboBox);
  except
    Result := -1;
  end;
end;

function ComboBox_New(Parent: AControl): AControl; stdcall;
begin
  try
    Result := UI_ComboBox_New(Parent);
  except
    Result := 0;
  end;
end;

function ComboBox_NewA(Parent: AControl; Left, Top, Width: AInteger): AControl; stdcall;
begin
  try
    Result := UI_ComboBox_NewA(Parent, Left, Top, Width);
  except
    Result := 0;
  end;
end;

procedure ComboBox_SetItemIndex(ComboBox: AControl; Value: AInteger); stdcall;
begin
  try
    UI_ComboBox_SetItemIndex(ComboBox, Value);
  except
  end;
end;

{ Control }

function Control_Free(Control: AControl): AError; stdcall;
begin
  if (Control <> 0) then
    TObject(Control).Free;
  Result := 0;
end;

function Control_GetColor(Control: AControl): AColor; stdcall;
begin
  if (TObject(Control) is TLabel) then
    Result := TLabel(Control).Color
  else if (TObject(Control) is TPanel) then
    Result := TPanel(Control).Color
  else if (TObject(Control) is TForm) then
    Result := TForm(Control).Color
  else
    Result := $000000;
end;

function Control_GetEnabled(Control: AControl): ABoolean; stdcall;
begin
  if (TObject(Control) is TControl) then
    Result := TControl(Control).Enabled
  else if (TObject(Control) is TMenuItem) then
    Result := TMenuItem(Control).Enabled
  else
    Result := False;
end;

function Control_GetHeight(Control: AControl): AInteger; stdcall;
begin
  Result := TControl(Control).Height;
end;

function Control_GetHintP(Control: AControl): APascalString; stdcall;
begin
  if (TObject(Control) is TControl) then
    Result := TControl(Control).Hint
  else if (TObject(Control) is TMenuItem) then
    Result := TMenuItem(Control).Hint
  else
    Result := '';
end;

function Control_GetHintWS(Control: AControl): AWideString; stdcall;
begin
  Result := Control_GetHintP(Control);
end;

function Control_GetMenu(Control: AControl): AMenu; stdcall;
begin
  Result := UI_Control_GetMenu(Control);
end;

function Control_GetNameP(Control: AControl): APascalString; stdcall;
begin
  if (TObject(Control) is TComponent) then
    Result := TComponent(Control).Name
  else
    Result := '';
end;

function Control_GetNameWS(Control: AControl): AWideString; stdcall;
begin
  Result := Control_GetNameP(Control);
end;

function Control_GetTextP(Control: AControl): APascalString; stdcall;
begin
  if (TObject(Control) is TForm) then
    Result := TForm(Control).Caption
  else if (TObject(Control) is TMenuItem) then
    Result := TMenuItem(Control).Caption
  else if (TObject(Control) is TEdit) then
    Result := TEdit(Control).Text
  else
    Result := '';
end;

function Control_GetVisible(Control: AControl): ABoolean; stdcall;
begin
  if (TObject(Control) is TControl) then
    Result := TControl(Control).Visible
  else if (TObject(Control) is TMenuItem) then
    Result := TMenuItem(Control).Visible
  else
    Result := False;
end;

function Control_GetWidth(Control: AControl): AInteger; stdcall;
begin
  Result := TControl(Control).Width;
end;

function Control_SetAlign(Control: AControl; Align: TUIAlign): AError; stdcall;
begin
  try
    AUIControls.UI_Control_SetAlign(Control, Align);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure Control_SetAlign02(Control: AControl; Align: TUIAlign); stdcall;
begin
  AUIControls.UI_Control_SetAlign(Control, Align);
end;

function Control_SetClientSize(Control: AControl; ClientWidth, ClientHeight: AInteger): AError; stdcall;
begin
  TWinControl(Control).ClientWidth := ClientWidth;
  TWinControl(Control).ClientHeight := ClientHeight;
  Result := 0;
end;

function Control_SetColor(Control: AControl; Color: AColor): AError; stdcall;
begin
  try
    AUIControls.UI_Control_SetColor(Control, Color);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure Control_SetColor02(Control: AControl; Color: AColor); stdcall;
begin
  try
    AUIControls.UI_Control_SetColor(Control, Color);
  except
  end;
end;

function Control_SetEnabled(Control: AControl; Value: ABoolean): AError; stdcall;
begin
  if (TObject(Control) is TControl) then
    TControl(Control).Enabled := Value
  else if (TObject(Control) is TMenuItem) then
    TMenuItem(Control).Enabled := Value;
  Result := 0;
end;

function Control_SetFocus(Control: AControl): ABoolean; stdcall;
begin
  Result := False;
  try
    if (TObject(Control) is TWinControl) then
    begin
      TWinControl(Control).SetFocus;
      Result := True;
    end;
  except
  end;
end;

function Control_SetFont1A(Control: AControl; {const} FontName: PAnsiChar; FontSize: AInteger): AError; stdcall;
begin
  Result := AUi_Control_SetFont1A(Control, FontName, FontSize);
end;

function Control_SetFont1P(Control: AControl; const FontName: APascalString; FontSize: AInteger): AError; stdcall;
begin
  Result := AUi_Control_SetFont1P(Control, FontName, FontSize);
end;

function Control_SetFont2P(Control: AControl; const FontName: APascalString; FontSize: AInteger; FontColor: AColor): AError; stdcall;
begin
  Result := AUi_Control_SetFont2P(Control, FontName, FontSize, FontColor);
end;

function Control_SetHeight(Control: AControl; Value: AInteger): AInteger; stdcall;
begin
  try
    AUIControls.UI_Control_SetHeight(Control, Value);
    Result := Value;
  except
    Result := -1;
  end;
end;

procedure Control_SetHint02(Control: AControl; const Value: APascalString); stdcall;
begin
  AUIControls.UI_Control_SetHint(Control, Value);
end;

function Control_SetHintP(Control: AControl; const Value: APascalString): AError; stdcall;
begin
  try
    AUIControls.UI_Control_SetHint(Control, Value);
    Result := 0;
  except
    Result := -1;
  end;
end;

function Control_SetHintWS(Control: AControl; const Value: AWideString): AError; stdcall;
begin
  Result := Control_SetHintP(Control, Value);
end;

procedure Control_SetName02(Control: AControl; const Value: APascalString); stdcall;
begin
  AUIControls.UI_Control_SetName(Control, Value);
end;

function Control_SetNameP(Control: AControl; const Value: APascalString): AError; stdcall;
begin
  try
    AUIControls.UI_Control_SetName(Control, Value);
    Result := 0;
  except
    Result := -1;
  end;
end;

function Control_SetNameWS(Control: AControl; const Value: AWideString): AError; stdcall;
begin
  Result := Control_SetNameP(Control, Value);
end;

function Control_SetOnChange(Control: AControl; OnChange: ACallbackProc): AError; stdcall;
begin
  try
    Result := AUIControlsA.UI_Control_SetOnChange(Control, OnChange);
  except
    Result := -1;
  end;
end;

procedure Control_SetOnChange02(Control: AControl; OnChange: ACallbackProc02); stdcall;
begin
  try
    AUIControlsA.UI_Control_SetOnChange02(Control, OnChange);
  except
  end;
end;

function Control_SetOnChangeEx(Control: AControl; OnChange: ACallbackProc03; Obj: AInteger): AError; stdcall;
begin
  try
    Result := AUIControlsA.UI_Control_SetOnChangeEx03(Control, OnChange, Obj);
  except
    Result := -1;
  end;
end;

function Control_SetOnClick(Control: AControl; Value: ACallbackProc): AError; stdcall;
begin
  try
    Result := AUIControls.UI_Control_SetOnClick(Control, Value);
  except
    Result := -1;
  end;
end;

procedure Control_SetOnClick02(Control: AControl; Value: ACallbackProc02); stdcall;
begin
  AUIControls.UI_Control_SetOnClick02(Control, Value);
end;

function Control_SetPosition(Control: AControl; Left, Top: AInteger): AError; stdcall;
begin
  try
    Result := AUIControls.UI_Control_SetPosition(Control, Left, Top);
  except
    Result := -1;
  end;
end;

procedure Control_SetPosition02(Control: AControl; Left, Top: Integer); stdcall;
begin
  try
    AUIControls.UI_Control_SetPosition(Control, Left, Top);
  except
  end;
end;

function Control_SetSize(Control: AControl; Width, Height: Integer): AError; stdcall;
begin
  try
    Result := AUIControls.UI_Control_SetSize(Control, Width, Height);
  except
    Result := -1;
  end;
end;

procedure Control_SetSize02(Control: AControl; Width, Height: Integer); stdcall;
begin
  try
    AUIControls.UI_Control_SetSize(Control, Width, Height);
  except
  end;
end;

procedure Control_SetText02(Control: AControl; const Value: AWideString); stdcall;
begin
  try
    AUIControls.UI_Control_SetTextP(Control, Value);
  except
  end;
end;

function Control_SetTextP(Control: AControl; const Value: APascalString): AError; stdcall;
begin
  try
    Result := AUIControls.UI_Control_SetTextP(Control, Value);
  except
    Result := -1;
  end;
end;

function Control_SetTextWS(Control: AControl; const Value: AWideString): AError; stdcall;
begin
  try
    Result := AUIControls.UI_Control_SetTextP(Control, Value);
  except
    Result := -1;
  end;
end;

function Control_SetVisible(Control: AControl; Value: ABoolean): AError; stdcall;
begin
  try
    AUIControls.UI_Control_SetVisible(Control, Value);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure Control_SetVisible02(Control: AControl; Value: ABoolean); stdcall;
begin
  try
    AUIControls.UI_Control_SetVisible(Control, Value);
  except
  end;
end;

function Control_SetWidth(Control: AControl; Value: AInteger): AInteger; stdcall;
begin
  try
    Result := AUIControls.UI_Control_SetWidth(Control, Value);
  except
    Result := -1;
  end;
end;

{ DataSource }

function DataSource_New(): PADataSource; stdcall;
begin
  try
    Result := UI_DataSource_New;
  except
    Result := 0;
  end;
end;

procedure DataSource_SetOnDataChange02(DataSource: PADataSource; OnDataChange: ACallbackProc02); stdcall;
var
  I: Integer;
begin
  try
    I := FindDataSource(DataSource);
    if (I >= 0) then
    begin
      FDataSources[I].OnDataChange02 := OnDataChange;
    end;
  except
  end;
end;

{ Dialog }

function Dialog_About: AError; stdcall;
begin
  ShowAboutWinA(UIAboutWinMemoWidthDefault, UIAboutWinMemoHeightDefault);
  Result := 0;
end;

function Dialog_About_New: AWindow; stdcall;
var
  Form: TAboutForm;
begin
  Form := TAboutForm.Create(nil);
  try
    Form.InitA(UIAboutWinMemoWidthDefault, UIAboutWinMemoHeightDefault);
  except
    Form.Free;
    Form := nil;
  end;
  Result := AWindow(Form);
end;

function Dialog_AddButtonP(Win: AWindow; Left, Width: AInteger; const Text: APascalString;
    OnClick: ACallbackProc): AControl; stdcall;
begin
  try
    Result := UI_Dialog_AddButton(Win, Left, Width, Text, OnClick);
  except
    Result := 0;
  end;
end;

function Dialog_AddButtonWS(Win: AWindow; Left, Width: AInteger; const Text: AWideString;
    OnClick: ACallbackProc): AControl; stdcall;
begin
  try
    Result := UI_Dialog_AddButton(Win, Left, Width, Text, OnClick);
  except
    Result := 0;
  end;
end;

function Dialog_Calendar(var Date: TDateTime; CenterX, CenterY: AInteger): ABoolean; stdcall;
begin
  {$IFNDEF FPC}
  Result := ShowCalendarWin(Date, CenterX, CenterY);
  {$ENDIF}
end;

function Dialog_Color(var Color: AColor): ABoolean; stdcall;
begin
  Result := AUIDialogs.ExecuteColorDialog(Color);
end;

function Dialog_DateFilter(var Group: Integer; var DateBegin, DateEnd: TDateTime): Boolean; stdcall;
{$IFNDEF FPC}
var
  FilterForm: TFilterForm;
{$ENDIF}
begin
  {$IFNDEF FPC}
  FilterForm := TFilterForm.Create(nil);
  try
    FilterForm.RadioGroup1.ItemIndex := Group;
    FilterForm.DateTimePicker1.DateTime := DateBegin;
    FilterForm.DateTimePicker2.DateTime := DateEnd;
    Result := (FilterForm.ShowModal = mrOk);
    if Result then
    begin
      Group := FilterForm.RadioGroup1.ItemIndex;
      DateBegin := FilterForm.DateTimePicker1.DateTime;
      DateEnd := FilterForm.DateTimePicker2.DateTime;
    end;
  finally
    FilterForm.Free;
  end;
  {$ENDIF}
end;

function Dialog_ErrorP(const Caption, UserMessage, ExceptMessage: APascalString): AError; stdcall;
begin
  try
    {$IFNDEF FPC}
    fError.ShowErrorA(Caption, UserMessage, ExceptMessage);
    {$ENDIF}
    Result := 0;
  except
    Result := -1;
  end;
end;

function Dialog_ErrorWS(const Caption, UserMessage, ExceptMessage: AWideString): AError; stdcall;
begin
  try
    {$IFNDEF FPC}
    fError.ShowErrorA(Caption, UserMessage, ExceptMessage);
    {$ENDIF}
    Result := 0;
  except
    Result := -1;
  end;
end;

function Dialog_FontP(var FontName: APascalString; var FontSize: AInteger; FontColor: AColor): ABoolean; stdcall;
begin
  Result := ExecuteFontDialog(FontName, FontSize, FontColor);
end;

function Dialog_GetWindow(Dialog: ADialog): AWindow; stdcall;
begin
  try
    Result := AUIDialogs.UI_Dialog_GetWindow(Dialog);
  except
    Result := 0;
  end;
end;

function Dialog_InputBox1P(const Text: APascalString; var Value: APascalString): ABoolean; stdcall;
begin
  try
    Result := UI_Dialog_InputBox(Text, Value);
  except
    Result := False;
  end;
end;

function Dialog_InputBox1WS(const Text: AWideString; var Value: AWideString): ABoolean; stdcall;
var
  S: APascalString;
begin
  try
    S := Value;
    Result := UI_Dialog_InputBox(Text, S);
    Value := S;
  except
    Result := False;
  end;
end;

function Dialog_InputBox2P(const Caption, Text1, Text2: APascalString; var Value1, Value2: APascalString): ABoolean; stdcall;
begin
  try
    Result := UI_Dialog_InputBox2(Caption, Text1, Text2, Value1, Value2);
  except
    Result := False;
  end;
end;

function Dialog_InputBox2WS(const Caption, Text1, Text2: AWideString; var Value1, Value2: AWideString): ABoolean; stdcall;
var
  S1: APascalString;
  S2: APascalString;
begin
  try
    S1 := Value1;
    S2 := Value2;
    Result := UI_Dialog_InputBox2(Caption, Text1, Text2, S1, S2);
    Value1 := S1;
    Value2 := S2;
  except
    Result := False;
  end;
end;

function Dialog_InputBox3P(const Caption, Text: APascalString; var Value: APascalString): ABoolean; stdcall;
begin
  try
    Result := UI_Dialog_InputBox3(Caption, Text, Value);
  except
    Result := False;
  end;
end;

function Dialog_InputBox3WS(const Caption, Text: AWideString; var Value: AWideString): ABoolean; stdcall;
var
  S: APascalString;
begin
  try
    S := Value;
    Result := UI_Dialog_InputBox3(Caption, Text, S);
    Value := S;
  except
    Result := False;
  end;
end;

function Dialog_LoginP(var UserName, Password: APascalString; IsSave: ABoolean): ABoolean; stdcall;
begin
  try
    Result := UI_Dialog_Login(UserName, Password, IsSave);
  except
    Result := False;
  end;
end;

function Dialog_LoginWS(var UserName, Password: AWideString; IsSave: ABoolean): ABoolean; stdcall;
var
  UserNameStr: APascalString;
  PasswordStr: APascalString;
begin
  try
    UserNameStr := UserName;
    PasswordStr := Password;
    Result := UI_Dialog_Login(UserNameStr, PasswordStr, IsSave);
    UserName := UserNameStr;
    Password := PasswordStr;
  except
    Result := False;
  end;
end;

function Dialog_MessageDlgWS(const Msg: AWideString; MsgDlgType: AInteger; Flags: AMessageBoxFlags): AInteger; stdcall;
begin
  try
    Result := UI_Dialog_MessageDlg(Msg, MsgDlgType, Flags);
  except
    Result := -1;
  end;
end;

function Dialog_MessageP(const Text, Caption: APascalString; Flags: AMessageBoxFlags): ADialogBoxCommands; stdcall;
begin
  try
    Result := UI_Dialog_Message(Text, Caption, Flags);
  except
    Result := 0;
  end;
end;

function Dialog_MessageWS(const Text, Caption: APascalString; Flags: AMessageBoxFlags): ADialogBoxCommands; stdcall;
begin
  try
    Result := UI_Dialog_Message(Text, Caption, Flags);
  except
    Result := 0;
  end;
end;

function Dialog_New(Buttons: AUIWindowButtons): ADialog; stdcall;
begin
  try
    Result := AUIDialogs.UI_Dialog_New(Buttons);
  except
    Result := 0;
  end;
end;

function Dialog_OpenFileWS(const InitialDir, Filter, Title: AWideString; var FileName: AWideString): ABoolean; stdcall;
var
  S: APascalString;
begin
  try
    S := FileName;
    Result := UI_Dialog_OpenFile(InitialDir, Filter, Title, S);
    FileName := S;
  except
    Result := False;
  end;
end;

function Dialog_PrinterSetup(): AError; stdcall;
begin
  try
    // ���������� ���� ������ � ��������� ������
    UI_Dialog_PrinterSetup();
    Result := 0;
  except
    Result := -1;
  end;
end;

function Dialog_SelectDirectoryP(var Directory: APascalString): ABoolean; stdcall;
begin
  {$IFNDEF FPC}
  Result := ExecuteSelectDirectoryDialog(Directory);
  {$ENDIF}
end;

{ Edit }

function Edit_CheckDate(Edit: AControl{TMaskEdit}; out Value: TDateTime): ABoolean; stdcall;
begin
  try
    Result := AUIEdit.Edit_CheckDate(TCustomEdit(Edit), Value);
  except
    Result := False;
  end;
end;

function Edit_CheckFloat(Edit: AControl; out Value: Double): ABoolean; stdcall;
begin
  try
    Result := AUIEdit.Edit_CheckFloat(TCustomEdit(Edit), Value);
  except
    Result := False;
  end;
end;

function Edit_CheckFloat32(Edit: AControl; out Value: AFloat32): ABoolean;
begin
  try
    Result := UI_Edit_CheckFloat32(Edit, Value);
  except
    Result := False;
  end;
end;

function Edit_CheckFloat64(Edit: AControl; out Value: AFloat64): ABoolean;
begin
  try
    Result := UI_Edit_CheckFloat64(Edit, Value);
  except
    Result := False;
  end;
end;

function Edit_CheckInt(Edit: AControl; out Value: AInteger): ABoolean; stdcall;
begin
  try
    Result := AUIEdit.Edit_CheckInt(TCustomEdit(Edit), Value);
  except
    Result := False;
  end;
end;

function Edit_New(Parent: AControl): AControl; stdcall;
begin
  try
    Result := UI_Edit_New(Parent);
  except
    Result := 0;
  end;
end;

function Edit_New02(Parent: AControl; EditType: AInteger; OnClick: ACallbackProc02;
    Left, Top, Width: AInteger): AControl; stdcall;
begin
  try
    if (EditType = 3) then
    begin
      Result := UI_SpinEdit_New(Parent);
      if (Result = 0) then Exit;
      AUIControls.UI_Control_SetPosition(Result, Left, Top);
      AUIControls.UI_Control_SetWidth(Result, Width);
    end
    else
      Result := UI_Edit_New02(Parent, EditType, OnClick, Left, Top, Width);
  except
    Result := 0;
  end;
end;

function Edit_NewA(Parent: AControl; EditType: AInteger; OnClick: ACallbackProc;
    Left, Top, Width: AInteger): AControl; stdcall;
begin
  try
    if (EditType = 3) then
    begin
      Result := UI_SpinEdit_New(Parent);
      if (Result = 0) then Exit;
      AUIControls.UI_Control_SetPosition(Result, Left, Top);
      AUIControls.UI_Control_SetWidth(Result, Width);
    end
    else
      Result := UI_Edit_NewA(Parent, EditType, OnClick, Left, Top, Width);
  except
    Result := 0;
  end;
end;

{ Grid }

function Grid_Clear(Grid: AControl): AError; stdcall;
begin
  try
    Result := UI_Grid_Clear(Grid);
  except
    Result := -1;
  end;
end;

function Grid_ClearA(Grid: AControl; FixedRows: AInteger): AError; stdcall;
begin
  try
    StringGrid_ClearA(TStringGrid(Grid), FixedRows);
    Result := 0;
  except
    Result := -1;
  end;
end;

function Grid_DeleteRow2(Grid: AControl; Row: AInteger): AError; stdcall;
begin
  try
    StringGrid_RowDeleteA(TStringGrid(Grid), Row);
    Result := 0;
  except
    Result := -1;
  end;
end;

function Grid_FindInt(Grid: AControl; Col, Value: AInteger): AInteger; stdcall;
begin
  if (Grid = 0) then
  begin
    Result := -2;
    Exit;
  end;

  try
    Result := UI_Grid_FindInt(TObject(Grid), Col, Value);
  except
    Result := -1;
  end;
end;

function Grid_New(Parent: AControl; GridType: AInteger): AControl; stdcall;
begin
  try
    Result := AUIGrids.UI_Grid_New(Parent, GridType);
  except
    Result := 0;
  end;
end;

function Grid_RestoreColPropsWS(Grid: AControl; Config: AConfig; const Key: AWideString; Delimer: AWideChar): AError; stdcall;
var
  S: AnsiString;
  C: AChar;
begin
  try
    S := Delimer;
    C := AnsiString_GetChar(S, 1);
    AUIGrids.UI_Grid_RestoreColProps(TObject(Grid), Config, Key, C);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure Grid_RestoreColPropsWS02(Grid: AControl; Config: AConfig; const Key: AWideString; Delimer: AWideChar); stdcall;
var
  S: AnsiString;
  C: AChar;
begin
  try
    S := Delimer;
    C := AnsiString_GetChar(S, 1);
    AUIGrids.UI_Grid_RestoreColProps(TObject(Grid), Config, Key, C);
  except
  end;
end;

function Grid_RowDelete(Grid: AControl): AError; stdcall;
begin
  try
    Result := UI_Grid_RowDelete(Grid);
  except
    Result := -1;
  end;
end;

function Grid_RowDown(Grid: AControl): AError; stdcall;
begin
  try
    UI_Grid_RowDown(Grid);
    Result := 0;
  except
    Result := -1;
  end;
end;

function Grid_RowUp(Grid: AControl): AError; stdcall;
begin
  try
    UI_Grid_RowUp(Grid);
    Result := 0;
  except
    Result := -1;
  end;
end;

function Grid_SaveColPropsWS(Grid: AControl; Config: AConfig; const Key: AWideString; Delimer: AWideChar): AError; stdcall;
var
  S: AnsiString;
  C: AChar;
begin
  if (Grid = 0) then
  begin
    Result := -2;
    Exit;
  end;

  try
    S := Delimer;
    C := AnsiString_GetChar(S, 1);
    AUIGrids.UI_Grid_SaveColProps(TObject(Grid), Config, Key, C);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure Grid_SaveColPropsWS02(Grid: AControl; Config: AConfig; const Key: AWideString; Delimer: AWideChar); stdcall;
var
  S: AnsiString;
  C: AChar;
begin
  if (Grid = 0) then Exit;

  try
    S := Delimer;
    C := AnsiString_GetChar(S, 1);
    AUIGrids.UI_Grid_SaveColProps(TObject(Grid), Config, Key, C);
  except
  end;
end;

function Grid_SetColumnWidth(Grid: AControl; ColumnIndex, Width, Persent, MinWidth: AInteger): AError; stdcall;
begin
  try
    UI_Grid_SetColumnWidth(Grid, ColumnIndex, Width, Persent, MinWidth);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure Grid_SetColumnWidth02(Grid: AControl; ColumnIndex, Width, Persent, MinWidth: AInteger); stdcall;
begin
  try
    UI_Grid_SetColumnWidth(Grid, ColumnIndex, Width, Persent, MinWidth);
  except
  end;
end;

function Grid_SetColumnWidth2(Grid: AControl; ColumnIndex, Width, Persent, MinWidth, MaxWidth: AInteger): AError; stdcall;
begin
  try
    UI_Grid_SetColumnWidthA(Grid, ColumnIndex, Width, Persent, MinWidth, MaxWidth);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure Grid_SetColumnWidthA(Grid: AControl; ColumnIndex, Width, Persent, MinWidth, MaxWidth: AInteger); stdcall;
begin
  try
    UI_Grid_SetColumnWidthA(Grid, ColumnIndex, Width, Persent, MinWidth, MaxWidth);
  except
  end;
end;

function Grid_SetDataSource(Grid: AControl; Value: PADataSource): AError; stdcall;
begin
  try
    UI_Grid_SetDataSource(Grid, Value);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure Grid_SetDataSource02(Grid: AControl; Value: PADataSource); stdcall;
begin
  try
    UI_Grid_SetDataSource(Grid, Value);
  except
  end;
end;

function Grid_SetRowCount(Grid: AControl; Count: AInteger): AError; stdcall;
begin
  try
    UI_Grid_SetRowCount(Grid, Count);
    Result := 0;
  except
    Result := -1;
  end;
end;

{ Image }

function Image_LoadFromFileWS(Image: AControl; const FileName: AWideString): AError; stdcall;
begin
  try
    if UI_Image_LoadFromFile(Image, FileName) then
      Result := 0
    else
      Result := -2;
  except
    Result := -1;
  end;
end;

function Image_New(Parent: AControl): AControl; stdcall;
begin
  try
    Result := UI_Image_New(Parent);
  except
    Result := 0;
  end;
end;

{ Label }

function Label_New(Parent: AControl): AControl; stdcall;
var
  L: TLabel;
begin
  L := TLabel.Create(TWinControl(Parent));
  L.Parent := TWinControl(Parent);
  Result := AddObject(L);
end;

// --- ListBox ---

function ListBox_AddP(ListBox: AControl; const Text: APascalString): AInteger; stdcall;
begin
  try
    Result := UI_ListBox_Add(ListBox, Text);
  except
    Result := -1;
  end;
end;

function ListBox_AddWS(ListBox: AControl; const Text: AWideString): AInteger; stdcall;
begin
  try
    Result := UI_ListBox_Add(ListBox, Text);
  except
    Result := -1;
  end;
end;

function ListBox_New(Parent: AControl): AControl; stdcall;
begin
  try
    Result := UI_ListBox_New(Parent);
  except
    Result := 0;
  end;
end;

{ MainToolBar }

function MainToolBar: AControl; stdcall;
begin
  Result := _MainWindow_ToolBar;
end;

procedure MainToolBar_Set(ToolBar: AControl); stdcall;
begin
  _MainWindow_ToolBar_Set(ToolBar);
end;

{ MainWindow }

function MainWindow: AWindow; stdcall;
begin
  Result := FMainWindow;
end;

function MainWindow_AddMenuItem(const ParentItemName, Name, Text: APascalString;
    OnClick: ACallbackProc; ImageID, Weight: Integer): AMenuItem; stdcall;
begin
  try
    Result := UI_MainWindow_AddMenuItem(ParentItemName, Name, Text, OnClick, ImageID, Weight);
  except
    Result := 0;
  end;
end;

function MainWindow_AddMenuItem02(const ParentItemName, Name, Text: APascalString;
    OnClick: ACallbackProc02; ImageID, Weight: AInteger): AMenuItem; stdcall;
begin
  try
    Result := UI_MainWindow_AddMenuItem02(ParentItemName, Name, Text, OnClick, ImageID, Weight);
  except
    Result := 0;
  end;
end;

function MainWindow_AddMenuItem03WS(const ParentItemName, Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight: AInteger): AMenuItem; stdcall;
begin
  try
    Result := UI_MainWindow_AddMenuItem03(ParentItemName, Name, Text, OnClick, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function MainWindow_AddMenuItem2(const ParentItemName, Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;
begin
  try
    Result := MainWindow_AddMenuItem2WS(
        AStrings.String_ToWideString(ParentItemName),
        AStrings.String_ToWideString(Name),
        AStrings.String_ToWideString(Text),
        OnClick, ImageID, Weight);
  except
    Result := 0;
  end;
end;

function MainWindow_AddMenuItem2WS(const ParentItemName, Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;
begin
  try
    {$IFDEF A01}
      Result := UI_MainWindow_AddMenuItem02(ParentItemName, Name, Text, OnClick, ImageID, Weight);
    {$ELSE}
      {$IFDEF A02}
      Result := UI_MainWindow_AddMenuItem02(ParentItemName, Name, Text, OnClick, ImageID, Weight);
      {$ELSE}
      Result := UI_MainWindow_AddMenuItem03(ParentItemName, Name, Text, OnClick, ImageID, Weight);
      {$ENDIF A02}
    {$ENDIF A01}
  except
    Result := 0;
  end;
end;

function MainWindow_AddMenuItem2WS02(const ParentItemName, Name, Text: AWideString;
    OnClick: ACallbackProc02; ImageId, Weight: AInteger): AMenuItem; stdcall;
begin
  try
    Result := UI_MainWindow_AddMenuItem02(ParentItemName, Name, Text, OnClick, ImageID, Weight);
  except
    Result := 0;
  end;
end;

function MainWindow_GetLeftContainer(): AControl; stdcall;
begin
  try
    Result := _MainWindow_GetLeftContainer();
  except
    Result := 0;
  end;
end;

function MainWindow_GetMainContainer(): AControl; stdcall;
begin
  try
    Result := _MainWindow_GetMainContainer();
  except
    Result := 0;
  end;
end;

function MainWindow_GetRightContainer(): AControl; stdcall;
begin
  try
    Result := _MainWindow_GetRightContainer();
  except
    Result := 0;
  end;
end;

procedure MainWindow_Set(Value: AWindow); stdcall;
begin
  _MainWindow_Set(Value);
end;

procedure MainWindow_SetA(Value: AWindow; ToolBar, StatusBar: AControl; Config: AConfig); stdcall;
begin
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
end;

// --- MenuItem ---

function MenuItem_Clear(MenuItem: AMenuItem): AError; stdcall;
begin
  try
    TMenuItem(MenuItem).Clear();
    Result := 0;
  except
    Result := -1;
  end;
end;

function MenuItem_FindByName(MenuItem: AMenuItem; const Name: APascalString): AMenuItem; stdcall;
begin
  try
    Result := UI_MenuItem_FindByName(MenuItem, Name);
  except
    Result := 0;
  end;
end;

function MenuItem_SetChecked(MenuItem: AMenuItem; Checked: ABoolean): AError; stdcall;
begin
  try
    TMenuItem(MenuItem).Checked := Checked;
    Result := -1;
  except
    Result := 0;
  end;
end;

// --- Menu ---

function Menu_AddItem0(Parent: AMenuItem; MenuItem: AMenuItem; Weight: AInteger): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_MenuItem_Add2(Parent, MenuItem, Weight);
  except
    Result := 0;
  end;
end;

function Menu_AddItem1(Menu: AMenu; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;
var
  MenuItems: AMenuItem;
begin
  try
    MenuItems := AUIMenus.UI_Menu_GetItems(Menu);

    if (MenuItems = 0) then
    begin
      Result := 0;
      Exit;
    end;

    Result := AUIMenus.UI_MenuItem_Add(MenuItems,
        String_ToWideString(Name), String_ToWideString(Text), OnClick, ImageId, Weight, 0);
  except
    Result := 0;
  end;
end;

function Menu_AddItem1P(Menu: AMenu; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;
begin
  try
    Result := UI_Menu_AddItem(Menu, Name, Text, OnClick, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function Menu_AddItem2(Parent: AMenuItem; const Name, Text: AString_Type;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_MenuItem_Add(Parent, String_ToWideString(Name),
        String_ToWideString(Text), OnClick, ImageId, Weight, 0);
  except
    Result := 0;
  end;
end;

function Menu_AddItem2P(Parent: AMenuItem; const Name, Text: APascalString;
    OnClick: ACallbackProc; ImageID, Weight: Integer): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_MenuItem_Add(Parent, Name, Text, OnClick, ImageID, Weight, 0);
  except
    Result := 0;
  end;
end;

function Menu_AddItem2WS(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: Integer): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_MenuItem_Add(Parent, Name, Text, OnClick, ImageID, Weight, 0);
  except
    Result := 0;
  end;
end;

function Menu_AddItem2WS02(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc02; ImageID, Weight: Integer): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_MenuItem_Add02(Parent, Name, Text, OnClick, ImageID, Weight);
  except
    Result := 0;
  end;
end;

function Menu_AddItem2WS03(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageID, Weight: AInteger): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_MenuItem_Add03(Parent, Name, Text, OnClick, ImageId, Weight, 0);
  except
    Result := 0;
  end;
end;

function Menu_AddItem3(Parent: AMenuItem; MenuItem: AMenuItem; Weight: AInteger): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_MenuItem_Add2(Parent, MenuItem, Weight);
  except
    Result := 0;
  end;
end;

function Menu_AddItem3WS(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageID, Weight, Tag: Integer): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_MenuItem_Add(Parent, Name, Text, OnClick, ImageID, Weight, Tag);
  except
    Result := 0;
  end;
end;

function Menu_AddItem3WS03(Parent: AMenuItem; const Name, Text: AWideString;
    OnClick: ACallbackProc03; ImageID, Weight, Tag: Integer): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_MenuItem_Add03(Parent, Name, Text, OnClick, ImageID, Weight, Tag);
  except
    Result := 0;
  end;
end;

function Menu_GetItems(Menu: AMenu): AMenuItem; stdcall;
begin
  try
    Result := AUIMenus.UI_Menu_GetItems(Menu);
  except
    Result := 0;
  end;
end;

function Menu_New(MenuType: AInteger): AMenu; stdcall;
begin
  try
    Result := AUIMenus.UI_Menu_New(MenuType);
  except
    Result := 0;
  end;
end;

{ PageControl }

function PageControl_AddPage(PageControl: AControl; const Name, Text: APascalString): AControl; stdcall;
begin
  try
    Result := AUIPageControl.UI_PageControl_AddPage(PageControl, Name, Text);
  except
    Result := 0;
  end;
end;

function PageControl_AddPageWS(PageControl: AControl; const Name, Text: AWideString): AControl; stdcall;
begin
  try
    Result := AUIPageControl.UI_PageControl_AddPage(PageControl, Name, Text);
  except
    Result := 0;
  end;
end;

function PageControl_New(Parent: AControl): AControl; stdcall;
begin
  try
    Result := AUIPageControl.UI_PageControl_New(Parent);
  except
    Result := 0
  end;
end;

{ ProgressBar }

function ProgressBar_New(Parent: AControl; Max: AInteger): AControl; stdcall;
begin
  try
    Result := UI_ProgressBar_New(Parent, Max);
  except
    Result := 0;
  end;
end;

function ProgressBar_StepIt(ProgressBar: AControl): AInteger; stdcall;
begin
  try
    Result := UI_ProgressBar_StepIt(ProgressBar);
  except
    Result := 0;
  end;
end;

{ Report }

function Report_New(Parent: AControl): AReport; stdcall;
begin
  try
    Result := UI_Report_New(Parent);
  except
    Result := 0;
  end;
end;

{ ReportWin }

function ReportWin_New(): AWindow; stdcall;
begin
  try
    Result := UI_ReportWin_New();
  except
    Result := 0;
  end;
end;

function ReportWin_New2P(ReportWinType: AInteger; const Text: APascalString): AWindow; stdcall;
begin
  try
    Result := AUIReports.UI_ReportWin_NewA(ReportWinType, Text);
  except
    Result := 0;
  end;
end;

function ReportWin_New2WS(ReportWinType: AInteger; const Text: AWideString): AWindow; stdcall;
begin
  try
    Result := AUIReports.UI_ReportWin_NewA(ReportWinType, Text);
  except
    Result := 0;
  end;
end;

function ReportWin_NewWS(ReportWinType: AInteger; const Text: AWideString): AWindow; stdcall;
begin
  try
    Result := AUIReports.UI_ReportWin_NewA(ReportWinType, Text);
  except
    Result := 0;
  end;
end;

function ReportWin_ShowReportP(const Text: APascalString; Font: AFont): AError; stdcall;
begin
  try
    UI_ReportWin_ShowReport(Text, TFont(Font));
    Result := 0;
  except
    Result := -1;
  end;
end;

{ TextView }

function TextView_AddLineWS(TextView: AControl; const Text: AWideString): AInteger; stdcall;
begin
  try
    Result := UI_TextView_AddLine(TextView, Text);
  except
    Result := -1;
  end;
end;

function TextView_New(Parent: AControl; ViewType: AInteger): AControl; stdcall;
begin
  try
    Result := UI_TextView_New(Parent, ViewType);
  except
    Result := 0;
  end;
end;

function TextView_SetReadOnly(TextView: AControl; ReadOnly: ABoolean): AError; stdcall;
begin
  try
    UI_TextView_SetReadOnly(TextView, ReadOnly);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure TextView_SetReadOnly02(TextView: AControl; ReadOnly: ABoolean); stdcall;
begin
  try
    UI_TextView_SetReadOnly(TextView, ReadOnly);
  except
  end;
end;

function TextView_SetScrollBars(TextView: AControl; ScrollBars: AInteger): AError; stdcall;
begin
  try
    UI_TextView_SetScrollBars(TextView, ScrollBars);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure TextView_SetScrollBars02(TextView: AControl; ScrollBars: AInteger); stdcall;
begin
  try
    UI_TextView_SetScrollBars(TextView, ScrollBars);
  except
  end;
end;

function TextView_SetWordWrap(TextView: AControl; Value: ABoolean): AError; stdcall;
begin
  try
    UI_TextView_SetWordWrap(TextView, Value);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure TextView_SetWordWrap02(TextView: AControl; Value: ABoolean); stdcall;
begin
  try
    UI_TextView_SetWordWrap(TextView, Value);
  except
  end;
end;

{ ToolBar }

function ToolBar_AddButtonWS(ToolBar: AControl; const Name, Text, Hint: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AButton; stdcall;
begin
  try
    Result := AUIToolBar.UI_ToolBar_AddButton(ToolBar, Name, Text, Hint, OnClick, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function ToolBar_AddButtonWS02(ToolBar: AControl; const Name, Text, Hint: AWideString;
    OnClick: ACallbackProc02; ImageId, Weight: AInteger): AButton; stdcall;
begin
  try
    Result := AUIToolBar.UI_ToolBar_AddButton02(ToolBar, Name, Text, Hint, OnClick, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function ToolBar_AddButtonWS03(ToolBar: AControl; const Name, Text, Hint: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight: AInteger): AButton; stdcall;
begin
  try
    Result := AUIToolBar.UI_ToolBar_AddButton03(ToolBar, Name, Text, Hint, OnClick, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function ToolBar_New(Parent: AControl): AControl; stdcall;
begin
  try
    Result := AUIToolBar.UI_ToolBar_New(Parent);
  except
    Result := 0;
  end;
end;

// --- ToolMenu ---

function ToolMenu_AddButtonWS(ToolMenu: AToolMenu; const Name, Text, Hint: AWideString;
    OnClick: ACallbackProc03; ImageId, Weight: AInteger): AButton; stdcall;
begin
  try
    Result := AUIToolBar.UI_ToolBar_AddButton03(ToolMenu, Name, Text, Hint, OnClick, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function ToolMenu_AddNewItemWS(Parent: AToolMenu; const Name, Text: AWideString;
    OnClick: ACallbackProc; ImageId, Weight: AInteger): AToolMenu; stdcall;
begin
  try
    Result := UI_ToolMenu_AddNewItem(Parent, Name, Text, OnClick, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function ToolMenu_AddNewSubMenu(Parent: AToolMenu; const Name, Text: AString_Type;
    ImageId, Weight: AInteger): AToolMenu; stdcall;
begin
  try
    Result := UI_ToolMenu_AddNewSubMenu(Parent,
        AStrings.String_ToPascalString(Name),
        AStrings.String_ToPascalString(Text),
        ImageId, Weight);
  except
    Result := 0;
  end;
end;

function ToolMenu_AddNewSubMenuWS(Parent: AToolMenu; const Name, Text: AWideString;
    ImageId, Weight: AInteger): AToolMenu; stdcall;
begin
  try
    Result := UI_ToolMenu_AddNewSubMenu(Parent, Name, Text, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function ToolMenu_GetSubMenuWS(Parent: AToolMenu; const Name, Text: AWideString;
    ImageId, Weight: AInteger): AToolMenu; stdcall;
begin
  try
    Result := UI_ToolMenu_GetSubMenu(Parent, Name, Text, ImageId, Weight);
  except
    Result := 0;
  end;
end;

function ToolMenu_New(Parent: AControl): AToolMenu; stdcall;
var
  PageControl: AControl;
  I: Integer;
begin
  try
    PageControl := AUIPageControl.UI_PageControl_New(Parent);
    UI_Control_SetAlign(PageControl, uiAlignTop);
    AUIControls.UI_Control_SetHeight(PageControl, 60);

    I := Length(FToolMenus);
    SetLength(FToolMenus, I + 1);
    FToolMenus[I].PageControl := PageControl;

    Result := PageControl;
  except
    Result := 0;
  end;
end;

{function ToolMenu_New2A(Parent: AControl; const MainPageText: PAnsiChar): AToolMenu; stdcall;
var
  PageControl: AControl;
  I: Integer;
begin
  try
    PageControl := AUIPageControl.UI_PageControl_New(Parent);
    UI_Control_SetAlign(PageControl, uiAlignTop);
    AUIControls.UI_Control_SetHeight(PageControl, 50);

    I := Length(FToolMenus);
    SetLength(FToolMenus, I + 1);
    FToolMenus[I].PageControl := PageControl;

    Result := AUIPageControl.UI_PageControl_AddPage(PageControl, '', AnsiString(MainPageText));
  except
    Result := 0;
  end;
end;}

{ TreeView }

function TreeView_AddItemWS(TreeView: AControl; Parent: ATreeNode; Text: AWideString): ATreeNode; stdcall;
begin
  try
    Result := AUITreeView.UI_TreeView_AddItem(TreeView, Parent, Text);
  except
    Result := 0;
  end;
end;

function TreeView_New(Parent: AControl): AControl; stdcall;
begin
  try
    Result := AUITreeView.UI_TreeView_New(Parent);
  except
    Result := 0;
  end;
end;

{ Splitter }

function Splitter_New(Parent: AControl; SplitterType: AUISplitterType): AControl; stdcall;
begin
  try
    Result := UI_Splitter_New(Parent, SplitterType);
  except
    Result := 0;
  end;
end;

{ UI Public }

function UI_Boot(): AError;
begin
  Result := 0;
end;

function UI_GetIsShowApp: ABoolean; stdcall;
begin
  Result := FIsShowApp;
end;

function UI_Init(): AError; stdcall;
begin
  Result := AUi_Init();
end;

function UI_InitMainMenu(): AInteger; stdcall;
begin
  Result := 0;
end;

function UI_InitMainTrayIcon: AInteger; stdcall;
begin
  {IFNDEF UNIX}
  if (FMainTrayIcon = 0) then
  begin
    {$IFDEF FPC}
    FMainTrayIcon := AddObject(TAUITrayIcon.Create(nil));
    {$ELSE}
    FMainTrayIcon := AddObject(TAUITrayIcon.Create);
    {$ENDIF}
  end;
  {ENDIF}
  Result := FMainTrayIcon;
end;

procedure UI_InitMenus; stdcall;
begin
  miFile := AUIMenus.UI_MenuItem_Add(miMain, 'File', miFileText, nil, 0, 100, 0);

  {$IFDEF A01}
    AUIMenus.UI_MenuItem_Add(miFile, 'Exit', miExitText, miExitClick02, 0, 10000, 0);
  {$ELSE}
    {$IFDEF A02}
    AUIMenus.UI_MenuItem_Add(miFile, 'Exit', miExitText, miExitClick02, 0, 10000, 0);
    {$ELSE}
    AUIMenus.UI_MenuItem_Add(miFile, 'Exit', miExitText, miExitClick, 0, 10000, 0);
    {$ENDIF A02}
  {$ENDIF A01}

  miHelp := AUIMenus.UI_MenuItem_Add(miMain, 'Help', miHelpText, nil, 0, 1000, 0);

  {$IFDEF A01}
    AUIMenus.UI_MenuItem_Add(miHelp, 'About', miAboutText, miAboutClick1, 0, 1000, 0);
  {$ELSE}
    {$IFDEF A02}
    AUIMenus.UI_MenuItem_Add(miHelp, 'About', miAboutText, miAboutClick1, 0, 1000, 0);
    {$ELSE}
    AUIMenus.UI_MenuItem_Add(miHelp, 'About', miAboutText, miAboutClick, 0, 1000, 0);
    {$ENDIF A02}
  {$ENDIF A01}
end;

procedure UI_OnMainFormCreate_Set(Value: AProc); stdcall;
begin
  SetOnMainFormCreate(Value);
end;

function UI_ProcessMessages: AInteger; stdcall;
begin
  try
    Application.ProcessMessages;
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure UI_ProcessMessages02(); stdcall;
begin
  try
    Application.ProcessMessages();
  except
  end;
end;

function UI_Run: AInteger; stdcall;
begin
  _MainWindow_Init;
  Application.Run;
  Result := 0;
end;

procedure UI_Run02; stdcall;
begin
  _MainWindow_Init;
  Application.Run;
end;

procedure UI_SetHideOnClose(Value: Boolean); stdcall;
begin
  FHideOnClose := Value;
end;

procedure UI_SetIsShowApp(Value: ABoolean); stdcall;
begin
  if (Value <> FIsShowApp) then
    FIsShowApp := Value;

  if Value then
  begin
    {$IFNDEF FPC}
    ShowWindow(Application.Handle, SW_SHOW);
    {$ENDIF}
    Application.Restore;
    Application.ShowMainForm := True;
    if Assigned(Application.MainForm) then
      Application.MainForm.Show;
    Application.BringToFront;
  end
  else
  begin
    if Assigned(Application.MainForm) then
      Application.MainForm.Hide;
    Application.ShowMainForm := False;
    Application.Minimize;
    {$IFNDEF FPC}
    ShowWindow(Application.Handle, SW_HIDE);
    {$ENDIF}
  end;
end;

function UI_ShellExecute(const Operation, FileName, Parameters, Directory: APascalString): AInteger; stdcall;
begin
  {$IFNDEF UNIX}
  Result := ShellExecute(0{Handle}, PChar(string(Operation)), PChar(string(FileName)), PChar(string(Parameters)), PChar(string(Directory)), SW_SHOW);
  {$ENDIF}
end;

function UI_Shutdown: AInteger; stdcall;
begin
  Result := AUi_Shutdown();
end;

{ UI_Calendar }

function UI_Calendar_GetDate(Calendar: AControl): TDateTime; stdcall;
begin
  {$IFDEF FPC}
  Result := TCalendar(Calendar).DateTime;
  {$ELSE}
  Result := TCalendar(Calendar).CalendarDate;
  {$ENDIF}
end;

function UI_Calendar_New(Parent: AControl): AControl; stdcall;
var
  Calendar: TCalendar;
begin
  Calendar := TCalendar.Create(TWinControl(Parent));
  Calendar.Parent := TWinControl(Parent);
  {$IFNDEF FPC}
  Calendar.StartOfWeek := 0;
  {$ENDIF}
  Result := AControl(Calendar);
end;

procedure UI_Calendar_SetMonth(Calendar: AControl; Value: AInteger); stdcall;
begin
  {$IFNDEF FPC}
  TCalendar(Calendar).Month := Value;
  {$ENDIF}
end;

{ UI_Button }

function UI_Button_New(Parent: AControl): AButton; stdcall;
begin
  Result := AUIButton.UI_Button_New(Parent);
end;

procedure UI_Button_SetKind(Button: AButton; Kind: TAUIButtonKind); stdcall;
begin
  AUIButton.UI_Button_SetKind(Button, Kind);
end;

{ UI_ComboBox }

function UI_ComboBox_Add(ComboBox: AControl; const Value: APascalString): AInteger; stdcall;
begin
  Result := TComboBox(ComboBox).Items.Add(Value);
end;

function UI_ComboBox_GetItemIndex(ComboBox: AControl): AInteger; stdcall;
begin
  Result := TComboBox(ComboBox).ItemIndex;
end;

function UI_ComboBox_New(Parent: AControl): AControl; stdcall;
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox.Create(TWinControl(Parent));
  ComboBox.Parent := TWinControl(Parent);
  Result := AddObject(ComboBox);
end;

function UI_ComboBox_NewA(Parent: AControl; Left, Top, Width: AInteger): AControl; stdcall;
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox.Create(TWinControl(Parent));
  ComboBox.Parent := TWinControl(Parent);
  ComboBox.Left := Left;
  ComboBox.Top := Top;
  ComboBox.Width := Width;
  Result := AddObject(ComboBox);
end;

procedure UI_ComboBox_SetItemIndex(ComboBox: AControl; Value: AInteger); stdcall;
begin
  TComboBox(ComboBox).ItemIndex := Value;
end;

{ UI_Control }

procedure UI_Control_Free(Control: AControl); stdcall;
begin
  Control_Free(Control);
end;

procedure UI_Control_FreeAndNil(var Control: AControl); stdcall;
begin
  Control_Free(Control);
  Control := 0;
end;

function UI_Control_GetColor(Control: AControl): AColor; stdcall;
begin
  Result := Control_GetColor(Control);
end;

function UI_Control_GetEnabled(Control: AControl): ABoolean; stdcall;
begin
  Result := Control_GetEnabled(Control);
end;

function UI_Control_GetHeight(Control: AControl): AInteger; stdcall;
begin
  Result := Control_GetHeight(Control);
end;

function UI_Control_GetHint(Control: AControl): APascalString; stdcall;
begin
  Result := Control_GetHintP(Control);
end;

function UI_Control_GetName(Control: AControl): APascalString; stdcall;
begin
  Result := Control_GetNameP(Control);
end;

function UI_Control_GetText(Control: AControl): APascalString; stdcall;
begin
  Result := Control_GetTextP(Control);
end;

function UI_Control_GetVisible(Control: AControl): ABoolean; stdcall;
begin
  Result := Control_GetVisible(Control);
end;

function UI_Control_GetWidth(Control: AControl): AInteger; stdcall;
begin
  Result := Control_GetWidth(Control);
end;

procedure UI_Control_SetClientSize(Control: AControl; ClientWidth, ClientHeight: AInteger); stdcall;
begin
  Control_SetClientSize(Control, ClientWidth, ClientHeight);
end;

procedure UI_Control_SetColor(Control: AControl; Color: AColor);
begin
  AUIControls.UI_Control_SetColor(Control, Color);
end;

procedure UI_Control_SetEnabled(Control: AControl; Value: ABoolean); stdcall;
begin
  Control_SetEnabled(Control, Value);
end;

function UI_Control_SetFocus(Control: AControl): ABoolean; stdcall;
begin
  Result := Control_SetFocus(Control);
end;

procedure UI_Control_SetFont1(Control: AControl; const FontName: APascalString; FontSize: AInteger); stdcall;
begin
  AUi_Control_SetFont1P(Control, FontName, FontSize);
end;

procedure UI_Control_SetFont2(Control: AControl; const FontName: APascalString; FontSize: AInteger; FontColor: AColor); stdcall;
begin
  Control_SetFont2P(Control, FontName, FontSize, FontColor);
end;

function UI_Control_SetHeight(Control: AControl; Value: AInteger): AInteger; stdcall;
begin
  AUIControls.UI_Control_SetHeight(Control, Value);
  Result := 0;
end;

procedure UI_Control_SetHint(Control: AControl; const Value: APascalString); stdcall;
begin
  AUIControls.UI_Control_SetHint(Control, Value);
end;

procedure UI_Control_SetName(Control: AControl; const Value: APascalString); stdcall;
begin
  AUIControls.UI_Control_SetName(Control, Value);
end;

procedure UI_Control_SetOnChange(Control: AControl; OnChange: ACallbackProc02); stdcall;
begin
  AUIControlsA.UI_Control_SetOnChange02(Control, OnChange);
end;

procedure UI_Control_SetOnChange2(Control: AControl; OnChange: ACallbackProc02; Obj: AInteger); stdcall;
begin
  AUIControlsA.UI_Control_SetOnChangeEx02(Control, OnChange, Obj);
end;

procedure UI_Control_SetOnClick(Control: AControl; Value: ACallbackProc02); stdcall;
begin
  AUIControls.UI_Control_SetOnClick02(Control, Value);
end;

procedure UI_Control_SetPosition(Control: AControl; Left, Top: Integer); stdcall;
begin
  AUIControls.UI_Control_SetPosition(Control, Left, Top);
end;

procedure UI_Control_SetSize(Control: AControl; Width, Height: Integer); stdcall;
begin
  AUIControls.UI_Control_SetSize(Control, Width, Height);
end;

procedure UI_Control_SetText(Control: AControl; const Value: AWideString); stdcall;
begin
  AUIControls.UI_Control_SetTextP(Control, Value);
end;

procedure UI_Control_SetVisible(Control: AControl; Value: ABoolean); stdcall;
begin
  AUIControls.UI_Control_SetVisible(Control, Value);
end;

function UI_Control_SetWidth(Control: AControl; Value: AInteger): AInteger; stdcall;
begin
  Result := AUIControls.UI_Control_SetWidth(Control, Value);
end;

{ DataSource }

function UI_DataSource_New: PADataSource; stdcall;
var
  DataSource: TDataSource;
  i: Integer;
begin
  DataSource := TDataSource.Create(nil);
  DataSource.OnDataChange := UI_.DataSourceDataChange;
  Result := PADataSource(DataSource);
  i := Length(FDataSources);
  SetLength(FDataSources, i + 1);
  FDataSources[i].DataSource := Result;
end;

{procedure UI_DataSource_SetDataSet(DataSource: PADataSource; Value: PADataSet);
begin
  TDataSource(DataSource).DataSet := TDataSet(DataSet);
end;}

procedure UI_DataSource_SetOnDataChange(DataSource: PADataSource; OnDataChange: ACallbackProc02); stdcall;
var
  i: Integer;
begin
  i := FindDataSource(DataSource);
  if (i >= 0) then
  begin
    FDataSources[i].OnDataChange02 := OnDataChange;
  end;
end;

{ UI_Dialog }

procedure UI_Dialog_About; stdcall;
begin
  Dialog_About;
end;

function UI_Dialog_About_New: AWindow; stdcall;
begin
  Result := Dialog_About_New;
end;

function UI_Dialog_AddButton(Win: AWindow; Left, Width: AInteger; const Text: APascalString;
    OnClick: ACallbackProc): AControl; stdcall;
begin
  if (Win <> 0) and (TObject(Win) is TAboutForm) then
    Result := TAboutForm(Win).AddButton(Left, Width, Text, OnClick)
  else
    Result := 0;
end;

function UI_Dialog_AddButton02(Win: AWindow; Left, Width: AInteger; const Text: APascalString;
    OnClick: ACallbackProc02): AControl; stdcall;
begin
  if (Win <> 0) and (TObject(Win) is TAboutForm) then
    Result := TAboutForm(Win).AddButton02(Left, Width, Text, OnClick)
  else
    Result := 0;
end;

function UI_Dialog_Calendar(var Date: TDateTime; CenterX, CenterY: AInteger): ABoolean; stdcall;
begin
  Result := Dialog_Calendar(Date, CenterX, CenterY);
end;

function UI_Dialog_Color(var Color: AColor): ABoolean; stdcall;
begin
  Result := Dialog_Color(Color);
end;

function UI_Dialog_DateFilter(var Group: Integer; var DateBegin, DateEnd: TDateTime): Boolean; stdcall;
begin
  Result := Dialog_DateFilter(Group, DateBegin, DateEnd);
end;

procedure UI_Dialog_Error(const Caption, UserMessage, ExceptMessage: APascalString); stdcall;
begin
  Dialog_ErrorP(Caption, UserMessage, ExceptMessage);
end;

function UI_Dialog_Font(var FontName: APascalString; var FontSize: AInteger; FontColor: AColor): ABoolean; stdcall;
begin
  Result := Dialog_FontP(FontName, FontSize, FontColor);
end;

function UI_Dialog_GetWindow(Dialog: ADialog): AWindow; stdcall;
begin
  Result := AUIDialogs.UI_Dialog_GetWindow(Dialog);
end;

function UI_Dialog_InputBox(const Text: APascalString; var Value: APascalString): Boolean; stdcall;
begin
  Result := UI_Dialog_InputBox3(ASystem.Info_GetTitleWS(), Text, Value);
end;

function UI_Dialog_InputBox2(const Caption, Text1, Text2: APascalString; var Value1, Value2: APascalString): ABoolean; stdcall;
begin
  {$IFNDEF FPC}
  Result := fPasswordDialog.InputBox2(Caption, Text1, Text2, Value1, Value2);
  {$ENDIF}
end;

function UI_Dialog_InputBox3(const Caption, Text: APascalString; var Value: APascalString): Boolean; stdcall;
begin
  {$IFNDEF FPC}
  Result := fInputDialog.InputBox(Caption, Text, Value);
  {$ENDIF}
end;

function UI_Dialog_InputBoxA(const Caption, Text: APascalString; var Value: APascalString): Boolean; stdcall;
begin
  Result := UI_Dialog_InputBox3(Caption, Text, Value);
end;

function UI_Dialog_Login(var UserName, Password: APascalString; IsSave: ABoolean): ABoolean; stdcall;
{$IFNDEF FPC}
var
  fmLogin: TLoginForm;
{$ENDIF}
begin
  {$IFNDEF FPC}
  fmLogin := TLoginForm.Create(nil);
  try
    fmLogin.UserName := UserName;
    Result := (fmLogin.ShowModal = mrOk);
    if Result then
    begin
      UserName := fmLogin.UserName;
      Password := fmLogin.UserPassword;
    end;
  finally
    fmLogin.Free();
  end;
  {$ENDIF}
end;

function UI_Dialog_Message(const Text, Caption: APascalString; Flags: AMessageBoxFlags): ADialogBoxCommands; stdcall;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  Screen.Cursor := crDefault;
  Result := Application.MessageBox(PChar(string(Text)), PChar(string(Caption)), Flags);
  {$IFNDEF UNIX}
  //Result := Windows.MessageBox(Application.Handle{0}, PChar(string(Text)), PChar(string(Caption)), Flags);
  {$ENDIF}
  Screen.Cursor := PrevCursor;
end;

function UI_Dialog_New(Buttons: AUIWindowButtons): ADialog; stdcall;
begin
  Result := AUIDialogs.UI_Dialog_New(Buttons);
end;

function UI_Dialog_SelectDirectory(var Directory: APascalString): ABoolean; stdcall;
begin
  Result := Dialog_SelectDirectoryP(Directory);
end;

function UI_Dialog_OpenFile(const InitialDir, Filter, Title: APascalString; var FileName: APascalString): Boolean; stdcall;
var
  FilterIndex: Integer;
begin
  FilterIndex := 0;
  Result := AUIDialogs.ExecuteOpenDialogA(InitialDir, Filter, '', Title, FileName, FilterIndex);
end;

function UI_Dialog_OpenFileA(const InitialDir, Filter, DefaultExt, Title: APascalString; var FileName: APascalString; var FilterIndex: AInteger): ABoolean; stdcall;
begin
  Result := AUIDialogs.ExecuteOpenDialogA(InitialDir, Filter, DefaultExt, Title, FileName, FilterIndex);
end;

function UI_Dialog_SaveFile(const Dir, Ext, DefFileName: APascalString): APascalString; stdcall;
begin
  Result := AUIDialogs.ExecuteSaveFileDialog(Dir, Ext, DefFileName);
end;

function UI_Dialog_SaveFileA(const InitialDir, DefExt, DefFileName, Filter: APascalString; var FilterIndex: AInteger): APascalString; stdcall;
begin
  Result := ExecuteSaveFileDialogA(InitialDir, DefExt, DefFileName, Filter, FilterIndex);
end;

{ Grid }

procedure UI_Grid_AddColumn(Grid: AControl; const FieldName, Title: APascalString; Width: Integer);
var
  Column: TAUIColumn;
begin
  {$IFNDEF FPC}
  Column := TDBGrid(Grid).Columns.Add;
  Column.FieldName := FieldName;
  Column.Title.Caption := Title;
  Column.Width := Width;
  {$ENDIF}
end;

function UI_Grid_New(Parent: AControl; GridType: AInteger): AControl; stdcall;
begin
  Result := AUIGrids.UI_Grid_New(Parent, GridType);
end;

procedure UI_Grid_RestoreColProps(Grid: AControl; Config: AConfig; const Key: APascalString; Delimer: AChar); stdcall;
begin
  AUIGrids.UI_Grid_RestoreColProps(TObject(Grid), Config, Key, Delimer);
end;

procedure UI_Grid_SaveColProps(Grid: AControl; Config: AConfig; const Key: APascalString; Delimer: AChar); stdcall;
begin
  AUIGrids.DBGrid_SaveColProps(TDBGrid(Grid), Config, Key, Delimer);
end;

procedure UI_Grid_SetColumnWidth(Grid: AControl; ColumnIndex, Width, Persent, MinWidth: AInteger); stdcall;
{var
  tmpWidth: Integer;
  Column: TColumn;}
begin
  DBGrid_SetColumnWidth(TDBGrid(Grid), ColumnIndex, Width, Persent, MinWidth);

  {$IFNDEF FPC}
  {Column := TDBGrid(Grid).Columns.Items[ColumnIndex];
  tmpWidth := (Width * Persent) div 100;
  if (tmpWidth >= MinWidth) then
    Column.Width := tmpWidth
  else
    Column.Width := MinWidth;}
  {$ENDIF}
end;

procedure UI_Grid_SetColumnWidthA(Grid: AControl; ColumnIndex, Width, Persent, MinWidth, MaxWidth: AInteger); stdcall;
{var
  tmpWidth: Integer;
  Column: TColumn;}
begin
  DBGrid_SetColumnWidthA(TDBGrid(Grid), ColumnIndex, Width, Persent, MinWidth, MaxWidth);

  {$IFNDEF FPC}
  {Column := TDBGrid(Grid).Columns.Items[ColumnIndex];
  tmpWidth := Round((Width - 30) * Persent / 100) - 4;
  if (tmpWidth < MinWidth) then
    tmpWidth := MinWidth
  else if (tmpWidth > MaxWidth) then
    tmpWidth := MaxWidth;
  Column.Width := tmpWidth;}
  {$ENDIF}
end;

procedure UI_Grid_SetDataSource(Grid: AControl; Value: PADataSource); stdcall;
begin
  TDBGrid(Grid).DataSource := TDataSource(Value);
end;

{ Image }

function UI_Image_New(Parent: AControl): AControl; stdcall;
var
  Image: TImage;
begin
  Image := TImage.Create(TWinControl(Parent));
  Image.Parent := TWinControl(Parent);
  Result := AddObject(Image);
end;

function UI_Image_LoadFromFile(Image: AControl; const FileName: APascalString): ABoolean; stdcall;
begin
  try
    TImage(Image).Picture.LoadFromFile(FileName);
    Result := True;
  except
    Result := False;
  end;
end;

{ UI_Label }

function UI_Label_New(Parent: AControl): AControl; stdcall;
begin
  Result := Label_New(Parent);
end;

procedure UI_Label_SetFont(TextLabel: AControl; const FontName: APascalString; FontSize: AInteger); stdcall;
begin
  TLabel(TextLabel).Font.Name := FontName;
  TLabel(TextLabel).Font.Size := FontSize;
end;

{ ListBox }

function UI_ListBox_Add(ListBox: AControl; const Text: APascalString): Integer; stdcall;
var
  O: TObject;
begin
  O := AUIData.GetObject(ListBox);
  if Assigned(O) and (O is TListBox) then
    Result := TListBox(O).Items.Add(Text)
  else if Assigned(O) and (O is TRadioGroup) then
    Result := TRadioGroup(O).Items.Add(Text)
  else
    Result := -1;
end;

procedure UI_ListBox_Clear(ListBox: AControl); stdcall;
var
  O: TObject;
begin
  O := AUIData.GetObject(ListBox);
  if Assigned(O) and (O is TListBox) then
    TListBox(O).Clear
  else if Assigned(O) and (O is TRadioGroup) then
    TRadioGroup(O).Items.Clear;
  {if (ListBox <> 0) then
    TListBox(ListBox).Clear;}
end;

procedure UI_ListBox_DeleteItem(ListBox: AControl; Index: AInteger); stdcall;
begin
  TListBox(ListBox).Items.Delete(Index);
  if (TListBox(ListBox).Items.Count > Index) then
    TListBox(ListBox).ItemIndex := Index
  else
    TListBox(ListBox).ItemIndex := Index-1;
end;

function UI_ListBox_GetCount(ListBox: AControl): AInteger; stdcall;
var
  Obj: TObject;
begin
  Obj := AUIData.GetObject(ListBox);
  if Assigned(Obj) and (Obj is TListBox) then
    Result := TListBox(Obj).Items.Count
  else if Assigned(Obj) and (Obj is TRadioGroup) then
    Result := TRadioGroup(Obj).Items.Count
  else
    Result := 0;
end;

function UI_ListBox_GetItem(ListBox: AControl; Index: AInteger): APascalString; stdcall;
var
  O: TObject;
begin
  O := AUIData.GetObject(ListBox);
  if Assigned(O) and (O is TListBox) then
    Result := TListBox(O).Items[Index]
  else if Assigned(O) and (O is TRadioGroup) then
    Result := TRadioGroup(O).Items[Index]
  else
    Result := '';
end;

function UI_ListBox_GetItemIndex(ListBox: AControl): AInteger; stdcall;
var
  O: TObject;
begin
  O := AUIData.GetObject(ListBox);
  if Assigned(O) and (O is TListBox) then
    Result := TListBox(O).ItemIndex
  else if Assigned(O) and (O is TRadioGroup) then
    Result := TRadioGroup(O).ItemIndex
  else
    Result := 0;
end;

function UI_ListBox_New(Parent: AControl): AControl; stdcall;
begin
  Result := UI_ListBox_NewA(Parent, 0);
end;

function UI_ListBox_NewA(Parent: AControl; Typ: AInteger): AControl; stdcall;
var
  O: TObject;
  ListBox: TListBox;
  RadioGroup: TRadioGroup;
  I: Integer;
begin
  O := AUIData.GetObject(Parent);
  if Assigned(O) and (O is TWinControl) then
  begin
    if (Typ = 1) then
    begin
      RadioGroup := TRadioGroup.Create(TWinControl(O));
      RadioGroup.Parent := TWinControl(O);
      Result := AddObject(RadioGroup);
    end
    else
    begin
      ListBox := TListBox.Create(TWinControl(O));
      ListBox.Parent := TWinControl(O);
      ListBox.Align := alClient;
      Result := AddObject(ListBox);

      I := Length(FListBoxs);
      SetLength(FListBoxs, I+1);
      FListBoxs[I].ListBox := Result;
      ListBox.OnClick := UI_.ListBoxClick;
      FListBoxs[I].OnClick02 := nil;
      FListBoxs[I].OnClick03 := nil;
    end;
  end
  else
    Result := 0;
end;

procedure UI_ListBox_SetItem(ListBox: AControl; Index: AInteger; const Value: APascalString); stdcall;
begin
  TListBox(ListBox).Items[Index] := Value;
end;

procedure UI_ListBox_SetItemIndex(ListBox: AControl; Index: AInteger); stdcall;
var
  Obj: TObject;
begin
  Obj := AUIData.GetObject(ListBox);
  if Assigned(Obj) and (Obj is TListBox) then
    TListBox(Obj).ItemIndex := Index
  else if Assigned(Obj) and (Obj is TRadioGroup) then
    TRadioGroup(Obj).ItemIndex := Index;
end;

{ UI_MainMenuItem }

function UI_MainMenuItem: AMenuItem; stdcall;
begin
  Result := miMain;
end;

{ UI_MainTrayIcon }

function UI_MainTrayIcon: ATrayIcon;
begin
  Result := FMainTrayIcon;
end;

{ Menu }

function UI_Menu_GetItems(Menu: AMenu): AMenuItem; stdcall;
begin
  Result := AUIMenus.UI_Menu_GetItems(Menu);
end;

function UI_Menu_New(MenuType: AInteger): AMenu; stdcall;
begin
  Result := AUIMenus.UI_Menu_New(MenuType);
end;

{ Objects }

function UI_Object_Add(Value: AInteger): AInteger; stdcall;
begin
  Result := AddObject(TObject(Value));
end;

{ PageControl }

function UI_PageControl_AddPage(PageControl: AControl; const Name, Text: APascalString): AControl; stdcall;
begin
  Result := AUIPageControl.UI_PageControl_AddPage(PageControl, Name, Text);
end;

function UI_PageControl_New(Parent: AControl): AControl; stdcall;
begin
  Result := AUIPageControl.UI_PageControl_New(Parent);
end;

{ ProgressBar }

function UI_ProgressBar_New(Parent: AControl; Max: AInteger): AControl;
var
  ProgressBar: TProgressBar;
begin
  ProgressBar := TProgressBar.Create(TWinControl(Parent));
  ProgressBar.Parent := TWinControl(Parent);
  ProgressBar.Max := Max;
  Result := AddObject(ProgressBar);
end;

function UI_ProgressBar_StepIt(ProgressBar: AControl): AInteger;
begin
  TProgressBar(ProgressBar).StepIt;
  Result := TProgressBar(ProgressBar).Position;
end;

{ PropertyBox }

function UI_PropertyBox_Add(PropertyBox: AControl; const Caption: APascalString): Integer; stdcall;
begin
  Result := TPropertyBox1(PropertyBox).AddNew(Caption);
end;

function UI_PropertyBox_AddA(PropertyBox: AControl; const Caption, Text, Hint: APascalString; EditWidth: AInteger): AInteger; stdcall;
begin
  Result := TPropertyBox1(PropertyBox).AddNew2(Caption, Text, Hint, EditWidth);
end;

function UI_PropertyBox_Item_GetValue(PropertyBox: AControl; Index: Integer): APascalString; stdcall;
begin
  Result := TPropertyBox1(PropertyBox).GetText(Index);
end;

procedure UI_PropertyBox_Item_SetValue(PropertyBox: AControl; Index: Integer; const Value: APascalString); stdcall;
begin
  TPropertyBox1(PropertyBox).SetText(Index, Value);
end;

function UI_PropertyBox_New(Parent: AControl): AControl; stdcall;
begin
  Result := AControl(TPropertyBox1.Create(TWinControl(Parent)));
end;

{ Report }

function UI_Report_New(Parent: AControl): AReport;
var
  I: Integer;
begin
  I := Length(FReports);
  SetLength(FReports, I + 1);
  Result := I+1;
  FReports[I].Parent := Parent;
  FReports[I].ToolsPanel := AUIBox.UI_Box_New(Parent, 0);
  AUIControls.UI_Control_SetSize(FReports[I].ToolsPanel, 100, 25);
  AUIControls.UI_Control_SetAlign(FReports[I].ToolsPanel, uiAlignTop);
  FReports[I].TextView := UI_TextView_New(Parent, 1);
  AUIControls.UI_Control_SetAlign(FReports[I].TextView, uiAlignClient);
  UI_TextView_SetScrollBars(FReports[I].TextView, AInteger(ssBoth));
  UI_TextView_SetFont(FReports[I].TextView, 'Courier New', 10);
  UI_TextView_SetReadOnly(FReports[I].TextView, True);
end;

procedure UI_Report_SetText(Report: AReport; const Value: APascalString); stdcall;
begin
  AUIControls.UI_Control_SetTextP(FReports[Report-1].TextView, Value);
end;

{ ReportWin }

function UI_ReportWin_New: AWindow;
begin
  Result := AUIReports.UI_ReportWin_NewA(0, '');
end;

function UI_ReportWin_NewA(ReportWinType: AInteger; const Text: APascalString): AWindow;
begin
  Result := AUIReports.UI_ReportWin_NewA(ReportWinType, Text);
end;

{ SpinButton }

function UI_SpinButton_New(Parent: AControl): AControl; stdcall;
{$IFNDEF FPC}
var
  Spin: TSpinButton;
{$ENDIF}
begin
  {$IFNDEF FPC}
  Spin := TSpinButton.Create(TWinControl(Parent));
  Spin.Parent := TWinControl(Parent);
  Result := AControl(Spin);
  {$ENDIF}
end;

{ SpinEdit }

function UI_SpinEdit_New(Parent: AControl): AControl; stdcall;
var
  SpinEdit: TSpinEdit;
begin
  SpinEdit := TSpinEdit.Create(TWinControl(Parent));
  SpinEdit.Parent := TWinControl(Parent);
  Result := AControl(SpinEdit);
end;

function UI_SpinEdit_NewA(Parent: AControl; Value, MinValue, MaxValue: AInteger): AControl; stdcall;
var
  SpinEdit: TSpinEdit;
begin
  SpinEdit := TSpinEdit.Create(TWinControl(Parent));
  SpinEdit.Parent := TWinControl(Parent);
  SpinEdit.Value := Value;
  SpinEdit.MinValue := MinValue;
  SpinEdit.MaxValue := MaxValue;
  Result := AControl(SpinEdit);
end;

{ Splitter }

function UI_Splitter_New(Parent: AControl; SplitterType: AUISplitterType): AControl; stdcall;
var
  O: TObject;
  Splitter: TSplitter;
begin
  O := AUIData.GetObject(Parent);
  if Assigned(O) and (O is TWinControl) then
  begin
    Splitter := TSplitter.Create(TWinControl(O));
    Splitter.Parent := TWinControl(O);
    Splitter.Left := 200;
    case SplitterType of
      AUISplitter_HSplitter: Splitter.Align := alTop;
      AUISplitter_VSplitter: Splitter.Align := alLeft;
      AUISplitter_HSplitterBottom: Splitter.Align := alBottom;
      AUISplitter_VSplitterRight: Splitter.Align := alRight;
    end;
    Result := AddObject(Splitter);
  end
  else
    Result := 0;
end;

{ TextView }

function UI_TextView_AddLine(TextView: AControl; const Text: APascalString): AInteger; stdcall;
begin
  if (TObject(TextView) is TMemo) then
    Result := TMemo(TextView).Lines.Add(Text)
  {$IFNDEF FPC}
  else if (TObject(TextView) is TRichEdit) then
    Result := TRichEdit(TextView).Lines.Add(Text)
  {$ENDIF}
  else
    Result := -1;
end;

function UI_TextView_New(Parent: AControl; ViewType: AInteger): AControl; stdcall;
var
  Memo: TMemo;
  {$IFNDEF FPC}
  Rich: TRichEdit;
  {$ENDIF}
begin
  if (ViewType = 0) then
  begin
    Memo := TMemo.Create(TWinControl(Parent));
    Memo.Parent := TWinControl(Parent);
    Result := AddObject(Memo);
  end
  else
  begin
    {$IFNDEF FPC}
    Rich := TRichEdit.Create(TWinControl(Parent));
    Rich.Parent := TWinControl(Parent);
    Result := AddObject(Rich);
    {$ENDIF}
  end;
end;

procedure UI_TextView_SetFont(TextView: AControl; const FontName: APascalString; FontSize: AInteger); stdcall;

  procedure SetFont(Font: TFont);
  begin
    if (FontName <> '') then
      Font.Name := FontName;
    if (FontSize <> 0) then
      Font.Size := FontSize;
  end;

begin
  {$IFNDEF FPC}
  if (TObject(TextView) is TRichEdit) then
    SetFont(TRichEdit(TextView).Font)
  {$ENDIF}
end;

procedure UI_TextView_SetReadOnly(TextView: AControl; ReadOnly: ABoolean); stdcall;
begin
  if (TObject(TextView) is TMemo) then
    TMemo(TextView).ReadOnly := ReadOnly
  {$IFNDEF FPC}
  else if (TObject(TextView) is TRichEdit) then
    TRichEdit(TextView).ReadOnly := ReadOnly;
  {$ENDIF}
end;

procedure UI_TextView_SetScrollBars(TextView: AControl; ScrollBars: AInteger); stdcall;
begin
  if (TObject(TextView) is TMemo) then
    TMemo(TextView).ScrollBars := TScrollStyle(ScrollBars)
  {$IFNDEF FPC}
  else if (TObject(TextView) is TRichEdit) then
    TRichEdit(TextView).ScrollBars := TScrollStyle(ScrollBars);
  {$ENDIF}
end;

procedure UI_TextView_SetWordWrap(TextView: AControl; Value: ABoolean); stdcall;
begin
  if (TObject(TextView) is TMemo) then
    TMemo(TextView).WordWrap := Value
  {$IFNDEF FPC}
  else if (TObject(TextView) is TRichEdit) then
    TRichEdit(TextView).WordWrap := Value;
  {$ENDIF}
end;

{ ToolBar }

function UI_ToolBar_AddButton(ToolBar: AControl; const Name, Text, Hint: APascalString;
    OnClick: ACallbackProc; ImageID, Weight: AInteger): AButton; stdcall;
begin
  {$IFDEF A02}
  Result := AUIToolBar.UI_ToolBar_AddButton02(ToolBar, Name, Text, Hint, OnClick, ImageID, Weight);
  {$ELSE}
  Result := AUIToolBar.UI_ToolBar_AddButton03(ToolBar, Name, Text, Hint, OnClick, ImageID, Weight);
  {$ENDIF A02}
end;

function UI_ToolBar_New(Parent: AControl): AControl; stdcall;
begin
  Result := AUIToolBar.UI_ToolBar_New(Parent);
end;

{ TrayIcon }

{$IFNDEF UNIX}
function UI_TrayIcon_GetMenuItems(TrayIcon: ATrayIcon): AMenuItem; stdcall;
var
  Tray: TAUITrayIcon;
begin
  Tray := TAUITrayIcon(TrayIcon);
  if Assigned(Tray) then
  begin
    if not(Assigned(Tray.PopupMenu)) then
      Tray.PopupMenu := TPopupMenu.Create(nil);
    Result := AMenuItem(Tray.PopupMenu.Items);
  end
  else
    Result := 0;
end;
{$ENDIF}

{ UI_TreeView }

function UI_TreeView_AddItem(TreeView: AControl; Parent: ATreeNode; Text: APascalString): ATreeNode; stdcall;
begin
  Result := AUITreeView.UI_TreeView_AddItem(TreeView, Parent, Text);
end;

function UI_TreeView_New(Parent: AControl): AControl; stdcall;
begin
  Result := AUITreeView.UI_TreeView_New(Parent);
end;

{ UI_WaitWin }

function UI_WaitWin_New(const Caption, Text: APascalString; MaxPosition: Integer): AWindow; stdcall;
{IFNDEF FPC}
var
  WaitForm: TWaitForm;
{ENDIF}
begin
  {IFNDEF FPC}
  WaitForm := TWaitForm.Create(nil);
  WaitForm.Init(Caption, Text, MaxPosition);
  AUIData.AddObject(WaitForm);
  Result := AWindow(WaitForm);
  {ENDIF}
end;

procedure UI_WaitWin_SetText(Window: AWindow; const Text: AWideString); stdcall;
begin
  TWaitForm(Window).lblText.Caption := Text;
end;

function UI_WaitWin_StepBy(Window: AWindow; Step: AInteger): AInteger; stdcall;
begin
  {IFNDEF FPC}
  TWaitForm(Window).Step;
  Result := 0;
  {ENDIF}
end;

{ Window }

procedure UI_Window_Free(Window: AWindow); stdcall;
begin
  UI_Control_Free(Window);
end;

procedure UI_Window_FreeAndNil(var Window: AWindow); stdcall;
begin
  UI_Control_Free(Window); //UI_Window_Free(Window);
  Window := 0;
end;

function UI_Window_GetMenu(Window: AWindow): AMenu; stdcall;
begin
  Result := AUIWindows.UI_Window_GetMenu(Window);
end;

function UI_Window_New: AControl; stdcall;
begin
  Result := AUIWindows.UI_Window_New();
end;

procedure UI_Window_SetBorderStyle(Window: AWindow; BorderStyle: AInteger); stdcall;
begin
  AUIWindows.UI_Window_SetBorderStyle(Window, BorderStyle);
end;

procedure UI_Window_SetFormStyle(Window: AWindow; FormStyle: AInteger); stdcall;
begin
  AUIWindows.UI_Window_SetFormStyle(Window, FormStyle);
end;

procedure UI_Window_SetPosition(Window: AWindow; Position: AInteger); stdcall;
begin
  AUIWindows.UI_Window_SetPosition(Window, Position);
end;

function UI_Window_ShowModal(Window: AWindow): ABoolean; stdcall;
begin
  Result := AUi_Window_ShowModal(Window); 
end;

{ WaitWin }

function WaitWin_NewWS(const Caption, Text: AWideString; MaxPosition: Integer): AWindow; stdcall;
begin
  try
    Result := UI_WaitWin_New(Caption, Text, MaxPosition);
  except
    Result := 0;
  end;
end;

function WaitWin_SetMaxPosition(WaitWin: AWindow; MaxPosition: AInteger): AError; stdcall;
begin
  try
    TWaitForm(WaitWin).ProgressBar.Max := MaxPosition;
    UI_ProcessMessages();
    Result := 0;
  except
    Result := -1;
  end;
end;

function WaitWin_SetPosition(WaitWin: AWindow; Position: AInteger): AError; stdcall;
begin
  try
    TWaitForm(WaitWin).ProgressBar.Position := Position;
    Result := 0;
  except
    Result := -1;
  end;
end;

function WaitWin_SetTextWS(Window: AWindow; const Text: AWideString): AError; stdcall;
begin
  try
    UI_WaitWin_SetText(Window, Text);
    UI_ProcessMessages();
    Result := 0;
  except
    Result := -1;
  end;
end;

function WaitWin_StepBy(Window: AWindow; Step: AInteger): AInteger; stdcall;
begin
  try
    Result := UI_WaitWin_StepBy(Window, Step);
  except
    Result := -1;
  end;
end;

{ Window }

function Window_Add(Window: AWindow): AError; stdcall;
begin
  try
    if (Window = 0) then
    begin
      Result := -1;
      Exit;
    end;

    if not(TObject(Window) is TForm) then
    begin
      Result := -2;
      Exit;
    end;

    if (FindObject(TObject(Window)) >= 0) then
    begin
      Result := -3;
      Exit;
    end;

    Result := AddObject(TObject(Window));

    if Assigned(TForm(Window).Menu) then
    begin
      AddObject(TForm(Window).Menu);
    end;
  except
    Result := -99;
  end;
end;

procedure Window_Free(Window: AWindow); stdcall;
begin
  UI_Control_Free(Window);
end;

function Window_GetMenu(Window: AWindow): AMenu; stdcall;
begin
  try
    Result := AUIWindows.UI_Window_GetMenu(Window);
  except
    Result := 0;
  end;
end;

{$IFDEF USE_SETTINGS}
function Window_LoadConfig(Window: AWindow; Config: AConfig): ABoolean; stdcall;
begin
  try
    Result := AUIForm.Form_LoadConfig(TForm(Window), Config);
  except
    Result := False;
  end;
end;
{$ENDIF}

{$IFDEF USE_SETTINGS}
function Window_LoadConfig2WS(Window: AWindow; Config: AConfig; const ConfigKey: AWideString): ABoolean; stdcall;
begin
  try
    Result := Form_LoadConfig2(TForm(Window), Config, ConfigKey);
  except
    Result := False;
  end;
end;
{$ENDIF}

function Window_New(): AControl; stdcall;
begin
  try
    Result := AUIWindows.UI_Window_New(); //Result := AddObject(TForm.Create(nil));
  except
    Result := 0;
  end;
end;

{$IFDEF USE_SETTINGS}
function Window_SaveConfig(Window: AWindow; Config: AConfig): ABoolean; stdcall;
begin
  try
    Result := AUIForm.Form_SaveConfig(TForm(Window), Config);
  except
    Result := False;
  end;
end;
{$ENDIF}

{$IFDEF USE_SETTINGS}
function Window_SaveConfig2WS(Window: AWindow; Config: AConfig; const ConfigKey: AWideString): ABoolean; stdcall;
begin
  try
    Result := AUIForm.Form_SaveConfig2(TForm(Window), Config, ConfigKey);
  except
    Result := False;
  end;
end;
{$ENDIF}

function Window_SetBorderStyle(Window: AWindow; BorderStyle: AInteger): AError; stdcall;
begin
  try
    AUIWindows.UI_Window_SetBorderStyle(Window, BorderStyle);
    Result := 0;
  except
    Result := -1;
  end;
end;

procedure Window_SetBorderStyle02(Window: AWindow; BorderStyle: AInteger); stdcall;
begin
  try
    AUIWindows.UI_Window_SetBorderStyle(Window, BorderStyle);
  except
  end;
end;

function Window_SetFormStyle(Window: AWindow; FormStyle: AInteger): AError; stdcall;
begin
  try
    AUIWindows.UI_Window_SetFormStyle(Window, FormStyle);
    Result := 0;
  except
    Result := -1;
  end;
end;

//** ������ ������� ����.
function Window_SetPosition(Window: AWindow; Position: AInteger): AError; stdcall;
begin
  try
    AUIWindows.UI_Window_SetPosition(Window, Position);
    Result := 0;
  except
    Result := -1;
  end;
end;

function Window_SetState(Window: AWindow; State: AInteger): AError; stdcall;
begin
  try
    UI_Window_SetState(Window, State);
    Result := 0;
  except
    Result := -1;
  end;
end;

function Window_ShowModal(Window: AWindow): ABoolean; stdcall;
begin
  try
    Result := AUIWindows.UI_Window_ShowModal(Window);
  except
    Result := False;
  end;
end;

end.
