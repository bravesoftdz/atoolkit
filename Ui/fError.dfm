object ErrorForm: TErrorForm
  Left = 204
  Top = 101
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1053#1048#1052#1040#1053#1048#1045'!'
  ClientHeight = 97
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 176
    Top = 63
    Width = 97
    Height = 30
    GroupIndex = 1
    Caption = '&'#1050#1088#1072#1090#1082#1086
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333C3333333333333337F3333333333333C0C3333
      333333333777F33333333333C0F0C3333333333377377F333333333C0FFF0C33
      3333333777F377F3333333CCC0FFF0C333333373377F377F33333CCCCC0FFF0C
      333337333377F377F3334CCCCCC0FFF0C3337F3333377F377F33C4CCCCCC0FFF
      0C3377F333F377F377F33C4CC0CCC0FFF0C3377F3733F77F377333C4CCC0CC0F
      0C333377F337F3777733333C4C00CCC0333333377F773337F3333333C4CCCCCC
      3333333377F333F7333333333C4CCCC333333333377F37733333333333C4C333
      3333333333777333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 272
    Top = 63
    Width = 97
    Height = 30
    GroupIndex = 1
    Caption = '&'#1055#1086#1076#1088#1086#1073#1085#1086
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333333FFFFF3333333333CCCCC33
      33333FFFF77777FFFFFFCCCCCC808CCCCCC377777737F777777F008888070888
      8003773FFF7773FFF77F0F0770F7F0770F037F777737F777737F70FFFFF7FFFF
      F07373F3FFF7F3FFF37F70F000F7F000F07337F77737F777373330FFFFF7FFFF
      F03337FF3FF7F3FF37F3370F00F7F00F0733373F7737F77337F3370FFFF7FFFF
      0733337F33373F337333330FFF030FFF03333373FF7373FF7333333000333000
      3333333777333777333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentFont = False
    OnClick = BitBtn2Click
  end
  object BitBtn1: TBitBtn
    Left = 1
    Top = 63
    Width = 90
    Height = 30
    Caption = '&'#1054#1050
    TabOrder = 0
    Kind = bkOK
    Style = bsNew
  end
  object Panel1: TPanel
    Left = 0
    Top = 6
    Width = 369
    Height = 50
    BevelOuter = bvLowered
    TabOrder = 1
    object Memo: TMemo
      Left = 1
      Top = 1
      Width = 367
      Height = 48
      TabStop = False
      Align = alClient
      Alignment = taCenter
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
end
