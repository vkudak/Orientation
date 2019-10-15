object Form1: TForm1
  Left = 217
  Top = 108
  Width = 696
  Height = 510
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1054#1088#1110#1108#1085#1090#1072#1094#1110#1103' '#1089#1091#1087#1091#1090#1085#1080#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 160
    Top = 1
    Width = 152
    Height = 16
    Caption = #1057#1080#1089#1090#1077#1084#1072' '#1050#1086#1086#1088#1076#1080#1085#1072#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 432
    Top = 4
    Width = 91
    Height = 13
    Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 328
    Top = 3
    Width = 88
    Height = 13
    Caption = #1045#1082#1074#1072#1090#1086#1088#1110#1072#1083#1100#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 312
    Top = 426
    Width = 51
    Height = 19
    Caption = #1055#1091#1085#1082#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 24
    Width = 129
    Height = 193
    Caption = #1055#1086#1095#1072#1090#1082#1086#1074#1110' '#1076#1072#1085#1085#1110
    TabOrder = 0
    object Button1: TButton
      Left = 27
      Top = 24
      Width = 75
      Height = 17
      Caption = #1044#1072#1090#1072
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 27
      Top = 56
      Width = 75
      Height = 17
      Caption = #1063#1072#1089
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 16
      Top = 88
      Width = 97
      Height = 17
      Caption = #1040#1083#1100#1092#1072', '#1044#1077#1083#1100#1090#1072
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 15
      Top = 120
      Width = 99
      Height = 17
      Caption = #1042#1110#1076#1089#1090#1072#1085#1100' '#1076#1086' '#1064#1057#1047
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 26
      Top = 160
      Width = 75
      Height = 17
      Caption = #1054#1073#1088#1072#1093#1091#1085#1086#1082
      TabOrder = 4
      OnClick = Button5Click
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 256
    Width = 161
    Height = 161
    ReadOnly = True
    TabOrder = 1
  end
  object SG1: TStringGrid
    Left = 192
    Top = 24
    Width = 409
    Height = 393
    DefaultColWidth = 60
    DefaultRowHeight = 14
    RowCount = 26
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 2
    RowHeights = (
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14
      14)
  end
  object Button6: TButton
    Left = 615
    Top = 144
    Width = 57
    Height = 23
    Caption = #1054#1095#1080#1089#1090#1080#1090#1080
    TabOrder = 3
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 616
    Top = 288
    Width = 57
    Height = 25
    Caption = #1050#1072#1088#1090#1080#1085#1082#1072
    TabOrder = 4
    OnClick = Button7Click
  end
  object XPManifest1: TXPManifest
    Left = 664
    Top = 32
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 664
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N8: TMenuItem
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1076#1072#1085#1085#1110
        ShortCut = 16467
        OnClick = N8Click
      end
      object N13: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1080' '#1076#1072#1085#1085#1110
        ShortCut = 16460
        OnClick = N13Click
      end
      object N9: TMenuItem
        Caption = #1054#1073#1088#1072#1093#1091#1074#1072#1090#1080' '#1076#1072#1085#1085#1110' '#1079' '#1092#1072#1081#1083#1091
        ShortCut = 16454
        OnClick = N9Click
      end
    end
    object N7: TMenuItem
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080
      object N2: TMenuItem
        Caption = #1057#1087#1086#1089#1090#1077#1088#1110#1075#1072#1095
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1057#1080#1089#1090'. '#1050#1086#1086#1088#1076#1080#1085#1072#1090
        object N5: TMenuItem
          Caption = #1045#1082#1074#1072#1090#1086#1088#1110#1072#1083#1100#1085#1072
          OnClick = N5Click
        end
        object N6: TMenuItem
          Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1072
          OnClick = N6Click
        end
      end
    end
    object N4: TMenuItem
      Caption = #1042#1080#1093#1110#1076
      OnClick = N4Click
    end
    object N10: TMenuItem
      Caption = '?'
      object N11: TMenuItem
        Caption = #1055#1088#1086' '#1087#1088#1086#1075#1088#1072#1084#1091
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1044#1086#1087#1086#1084#1086#1075#1072
        OnClick = N12Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #1044#1072#1085#1085#1110' UT,A,H,R (*.s3)|*.s3|'#1047#1072#1075#1088#1091#1079#1080#1090#1080' '#1076#1072#1085#1085#1110'  (*.dat)|*.dat'
    InitialDir = '\data'
    Left = 664
    Top = 64
  end
end
