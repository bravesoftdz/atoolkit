{**
@Abstract AUi button functions
@Author Prof1983 <prof1983@ya.ru>
@Created 28.06.2011
@LastMod 13.11.2011
}
unit AUiButtons;

{$define AStdCall}

interface

uses
  Buttons, Controls,
  ABase, AUiBase, AUiData, AUiEventsObj;

// --- AUiButton ---

function AUiButton_New(Parent: AControl): AButton; {$ifdef AStdCall}stdcall;{$endif}

function AUiButton_SetKind(Button: AButton; Kind: TAUiButtonKind): AError; {$ifdef AStdCall}stdcall;{$endif}

implementation

// --- AUiButton ---

function AUiButton_New(Parent: AControl): AButton;
var
  Button: TBitBtn;
  I: Integer;
begin
  try
    Button := TBitBtn.Create(TWinControl(Parent));
    Button.Parent := TWinControl(Parent);
    Button.OnClick := UI_.ButtonClick;
    Result := AddObject(Button);

    I := Length(FButtons);
    SetLength(FButtons, I + 1);
    FButtons[I].Button := Result;
  except
    Result := 0;
  end;
end;

function AUiButton_SetKind(Button: AButton; Kind: TAUiButtonKind): AError;
begin
  try
    TBitBtn(Button).Kind := TBitBtnKind(Kind);
    Result := 0;
  except
    Result := -1;
  end;
end;

end.
 