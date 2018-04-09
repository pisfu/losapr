object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' G-'#1082#1086#1076#1086#1074
  ClientHeight = 336
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 543
    Top = 8
    Width = 185
    Height = 322
    TabOrder = 0
  end
  object Generate: TButton
    Left = 415
    Top = 241
    Width = 122
    Height = 25
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1082#1086#1076
    TabOrder = 1
    OnClick = GenerateClick
  end
  object Clean: TButton
    Left = 471
    Top = 303
    Width = 66
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 2
    OnClick = CleanClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 122
    Width = 280
    Height = 72
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 0
      Width = 78
      Height = 13
      Caption = #1055#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082
    end
    object A_4: TLabeledEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = #1057#1090#1086#1088#1086#1085#1072' A'
      TabOrder = 0
      Text = '10'
      OnKeyPress = FirstdotX_4KeyPress
    end
    object B_4: TLabeledEdit
      Left = 143
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #1057#1090#1086#1088#1086#1085#1072' B'
      TabOrder = 1
      Text = '5'
      OnKeyPress = FirstdotX_4KeyPress
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 202
    Width = 280
    Height = 128
    TabOrder = 4
    object Label3: TLabel
      Left = 16
      Top = 0
      Width = 65
      Height = 13
      Caption = #1058#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082
    end
    object T2X: TLabeledEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = #1042#1090#1086#1088#1072#1103' '#1090#1086#1095#1082#1072' X'
      TabOrder = 0
      Text = '5'
      OnKeyPress = FirstdotX_4KeyPress
    end
    object T2Y: TLabeledEdit
      Left = 16
      Top = 83
      Width = 121
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = #1042#1090#1086#1088#1072#1103' '#1090#1086#1095#1082#1072' Y'
      TabOrder = 1
      Text = '5'
      OnKeyPress = FirstdotX_4KeyPress
    end
    object T3X: TLabeledEdit
      Left = 143
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = #1058#1088#1077#1090#1100#1103' '#1090#1086#1095#1082#1072' X'
      TabOrder = 2
      Text = '10'
      OnKeyPress = FirstdotX_4KeyPress
    end
    object T3Y: TLabeledEdit
      Left = 143
      Top = 83
      Width = 121
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = #1058#1088#1077#1090#1100#1103' '#1090#1086#1095#1082#1072' Y'
      TabOrder = 3
      Text = '0'
      OnKeyPress = FirstdotX_4KeyPress
    end
  end
  object Panel3: TPanel
    Left = 294
    Top = 122
    Width = 243
    Height = 113
    UseDockManager = False
    TabOrder = 5
    object Label4: TLabel
      Left = 16
      Top = 0
      Width = 24
      Height = 13
      Caption = #1050#1088#1091#1075
    end
    object D_1: TLabeledEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = #1044#1080#1072#1084#1077#1090#1088' '#1082#1088#1091#1075#1072
      TabOrder = 0
      Text = '15'
      OnKeyPress = FirstdotX_4KeyPress
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 75
      Width = 201
      Height = 15
      Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1103' '#1087#1086' '#1095#1072#1089#1086#1074#1086#1081' '#1089#1090#1088#1077#1083#1082#1077
      TabOrder = 1
    end
  end
  object SavetoFile: TButton
    Left = 415
    Top = 272
    Width = 122
    Height = 25
    Hint = 'Save As|Saves the active file with a new name'
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
    ImageIndex = 30
    TabOrder = 6
    OnClick = SavetoFileClick
  end
  object Panel4: TPanel
    Left = 127
    Top = 8
    Width = 410
    Height = 105
    TabOrder = 7
    object Sedit: TLabeledEdit
      Left = 16
      Top = 27
      Width = 153
      Height = 21
      EditLabel.Width = 150
      EditLabel.Height = 13
      EditLabel.Caption = #1063#1072#1089#1090#1086#1090#1072' '#1074#1088#1072#1097#1077#1085#1080#1103' '#1096#1087#1080#1085#1076#1077#1083#1103
      NumbersOnly = True
      TabOrder = 0
      Text = '3000'
    end
    object Fedit: TLabeledEdit
      Left = 175
      Top = 27
      Width = 121
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1076#1072#1095#1072
      NumbersOnly = True
      TabOrder = 1
      Text = '1500'
    end
    object FirstdotX_4: TLabeledEdit
      Left = 16
      Top = 67
      Width = 121
      Height = 21
      EditLabel.Width = 97
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1090#1086#1095#1082#1072' X'
      TabOrder = 2
      Text = '0'
      OnKeyPress = FirstdotX_4KeyPress
    end
    object FirstdotY_4: TLabeledEdit
      Left = 143
      Top = 67
      Width = 121
      Height = 21
      EditLabel.Width = 97
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1090#1086#1095#1082#1072' Y'
      TabOrder = 3
      Text = '0'
      OnKeyPress = FirstdotX_4KeyPress
    end
    object SaveZEdit: TLabeledEdit
      Left = 270
      Top = 67
      Width = 121
      Height = 21
      EditLabel.Width = 98
      EditLabel.Height = 13
      EditLabel.Caption = #1041#1077#1079#1086#1087#1072#1089#1085#1072#1103' '#1074#1099#1089#1086#1090#1072
      TabOrder = 4
      Text = '10'
      OnKeyPress = FirstdotX_4KeyPress
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 113
    Height = 65
    Caption = #1058#1080#1087' '#1087#1088#1080#1084#1080#1090#1080#1074#1072
    ItemIndex = 0
    Items.Strings = (
      #1055#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082
      #1058#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082
      #1050#1088#1091#1075)
    TabOrder = 8
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'nc'
    Filter = 'NC-'#1092#1072#1081#1083'|.nc'
    Left = 496
    Top = 16
  end
end
