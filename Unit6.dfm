object ObservationPoint: TObservationPoint
  Left = 345
  Top = 417
  BorderStyle = bsToolWindow
  Caption = #1057#1087#1086#1089#1090#1077#1088#1110#1075#1072#1095
  ClientHeight = 260
  ClientWidth = 419
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
  object Label5: TLabel
    Left = 16
    Top = 8
    Width = 121
    Height = 13
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1080' '#1082#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1102
  end
  object Button1: TButton
    Left = 64
    Top = 216
    Width = 65
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 192
    Top = 16
    Width = 185
    Height = 177
    Caption = #1044#1072#1085#1085#1110' '#1087#1091#1085#1082#1090#1091
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 89
      Width = 17
      Height = 13
      Caption = 'Lya'
    end
    object Label2: TLabel
      Left = 20
      Top = 60
      Width = 8
      Height = 13
      Caption = 'Fi'
    end
    object Label3: TLabel
      Left = 21
      Top = 119
      Width = 8
      Height = 13
      Caption = 'H'
    end
    object Label4: TLabel
      Left = 8
      Top = 28
      Width = 32
      Height = 13
      Caption = #1053#1072#1079#1074#1072
    end
    object Edit1: TEdit
      Left = 56
      Top = 86
      Width = 105
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 57
      Top = 56
      Width = 104
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 57
      Top = 116
      Width = 104
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object Button3: TButton
      Left = 64
      Top = 149
      Width = 65
      Height = 17
      Caption = 'Ok'
      TabOrder = 4
      Visible = False
      OnClick = Button3Click
    end
    object Edit4: TEdit
      Left = 56
      Top = 24
      Width = 105
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Button2: TButton
    Left = 184
    Top = 216
    Width = 201
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1080' '#1085#1086#1074#1080#1081' '#1087#1091#1085#1082#1090' '#1089#1087#1086#1089#1090#1077#1088#1077#1078#1077#1085#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object FileListBox1: TFileListBox
    Left = 8
    Top = 24
    Width = 145
    Height = 169
    ItemHeight = 13
    Mask = '*.conf'
    TabOrder = 3
    OnClick = FileListBox1Click
  end
end
