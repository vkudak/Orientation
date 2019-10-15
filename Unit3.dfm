object Time: TTime
  Left = 773
  Top = 321
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = #1063#1072#1089
  ClientHeight = 155
  ClientWidth = 212
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
  object Label1: TLabel
    Left = 16
    Top = 18
    Width = 36
    Height = 13
    Caption = #1043#1086#1076#1080#1085#1080
  end
  object Label2: TLabel
    Left = 16
    Top = 51
    Width = 43
    Height = 13
    Caption = #1061#1074#1080#1083#1080#1085#1080
  end
  object Label3: TLabel
    Left = 16
    Top = 82
    Width = 42
    Height = 13
    Caption = #1057#1077#1082#1091#1085#1076#1080
  end
  object hours: TEdit
    Left = 72
    Top = 16
    Width = 97
    Height = 21
    TabOrder = 0
  end
  object minuts: TEdit
    Left = 72
    Top = 48
    Width = 97
    Height = 21
    TabOrder = 1
  end
  object seconds: TEdit
    Left = 72
    Top = 80
    Width = 97
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 80
    Top = 120
    Width = 65
    Height = 17
    Caption = 'Ok'
    TabOrder = 3
    OnClick = Button1Click
  end
end
