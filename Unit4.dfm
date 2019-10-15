object Form4: TForm4
  Left = 620
  Top = 400
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = #1040#1083#1100#1092#1072', '#1044#1077#1083#1100#1090#1072
  ClientHeight = 184
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 145
    Height = 121
    Caption = #1040#1083#1100#1092#1072
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 22
      Width = 36
      Height = 13
      Caption = #1043#1086#1076#1080#1085#1080
    end
    object Label2: TLabel
      Left = 16
      Top = 49
      Width = 33
      Height = 13
      Caption = #1052#1110#1085#1091#1090#1080
    end
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 42
      Height = 13
      Caption = #1057#1077#1082#1091#1085#1076#1080
    end
    object AlH: TEdit
      Left = 72
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object Alm: TEdit
      Left = 72
      Top = 48
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object Als: TEdit
      Left = 72
      Top = 80
      Width = 57
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 176
    Top = 16
    Width = 153
    Height = 121
    Caption = #1044#1077#1083#1100#1090#1072
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 22
      Width = 41
      Height = 13
      Caption = #1043#1088#1072#1076#1091#1089#1080
    end
    object Label5: TLabel
      Left = 16
      Top = 49
      Width = 33
      Height = 13
      Caption = #1052#1110#1085#1091#1090#1080
    end
    object Label6: TLabel
      Left = 16
      Top = 80
      Width = 42
      Height = 13
      Caption = #1057#1077#1082#1091#1085#1076#1080
    end
    object DelG: TEdit
      Left = 72
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object Delm: TEdit
      Left = 72
      Top = 48
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object Dels: TEdit
      Left = 72
      Top = 80
      Width = 57
      Height = 21
      TabOrder = 2
    end
  end
  object Button1: TButton
    Left = 139
    Top = 152
    Width = 62
    Height = 17
    Caption = 'Ok'
    TabOrder = 2
    OnClick = Button1Click
  end
end
