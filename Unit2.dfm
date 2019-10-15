object Date: TDate
  Left = 741
  Top = 180
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = #1044#1072#1090#1072
  ClientHeight = 193
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 26
    Width = 88
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1091#1087#1091#1090#1085#1080#1082#1072
  end
  object Label2: TLabel
    Left = 30
    Top = 60
    Width = 32
    Height = 13
    Caption = #1063#1080#1089#1083#1086
  end
  object Label3: TLabel
    Left = 32
    Top = 93
    Width = 35
    Height = 13
    Caption = #1052#1110#1089#1103#1094#1100
  end
  object Label4: TLabel
    Left = 40
    Top = 126
    Width = 15
    Height = 13
    Caption = #1056#1110#1082
  end
  object Nomer: TEdit
    Left = 104
    Top = 24
    Width = 105
    Height = 21
    TabOrder = 0
  end
  object day: TEdit
    Left = 104
    Top = 56
    Width = 105
    Height = 21
    TabOrder = 1
  end
  object month: TEdit
    Left = 104
    Top = 88
    Width = 105
    Height = 21
    TabOrder = 2
  end
  object Year: TEdit
    Left = 104
    Top = 120
    Width = 105
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 96
    Top = 160
    Width = 65
    Height = 17
    Caption = 'Ok'
    TabOrder = 4
    OnClick = Button1Click
  end
end
