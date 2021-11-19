object frmEditUser: TfrmEditUser
  Left = 0
  Top = 0
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  ClientHeight = 323
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object paTop: TPanel
    Left = 0
    Top = 0
    Width = 251
    Height = 282
    Align = alClient
    TabOrder = 0
    object edUsrName: TDBEditEh
      Left = 112
      Top = 24
      Width = 121
      Height = 21
      Color = cl3DLight
      ControlLabel.Width = 53
      ControlLabel.Height = 13
      ControlLabel.Caption = 'UserName:'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 6
      ControlLabelLocation.Position = lpLeftCenterEh
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
    object edUsr: TDBEditEh
      Left = 112
      Top = 51
      Width = 121
      Height = 21
      ControlLabel.Width = 97
      ControlLabel.Height = 13
      ControlLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 6
      ControlLabelLocation.Position = lpLeftCenterEh
      DynProps = <>
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object edPassword: TDBEditEh
      Left = 112
      Top = 78
      Width = 121
      Height = 21
      ControlLabel.Width = 41
      ControlLabel.Height = 13
      ControlLabel.Caption = #1055#1072#1088#1086#1083#1100':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 6
      ControlLabelLocation.Position = lpLeftCenterEh
      DynProps = <>
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object paAll: TPanel
      Left = 1
      Top = 129
      Width = 249
      Height = 152
      Align = alBottom
      TabOrder = 4
      object cbPlatform: TDBComboBoxEh
        Left = 111
        Top = 11
        Width = 121
        Height = 21
        ControlLabel.Width = 57
        ControlLabel.Height = 13
        ControlLabel.Caption = #1055#1083#1086#1097#1072#1076#1082#1072':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 6
        ControlLabelLocation.Position = lpLeftCenterEh
        DynProps = <>
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object edMName: TDBEditEh
        Left = 111
        Top = 119
        Width = 121
        Height = 21
        ControlLabel.Width = 53
        ControlLabel.Height = 13
        ControlLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 6
        ControlLabelLocation.Position = lpLeftCenterEh
        DynProps = <>
        EditButtons = <>
        TabOrder = 4
        Visible = True
      end
      object edFName: TDBEditEh
        Left = 111
        Top = 92
        Width = 121
        Height = 21
        ControlLabel.Width = 23
        ControlLabel.Height = 13
        ControlLabel.Caption = #1048#1084#1103':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 6
        ControlLabelLocation.Position = lpLeftCenterEh
        DynProps = <>
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object edLName: TDBEditEh
        Left = 111
        Top = 65
        Width = 121
        Height = 21
        ControlLabel.Width = 48
        ControlLabel.Height = 13
        ControlLabel.Caption = #1060#1072#1084#1080#1083#1080#1103':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 6
        ControlLabelLocation.Position = lpLeftCenterEh
        DynProps = <>
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object cbRMesto: TDBComboBoxEh
        Left = 113
        Top = 38
        Width = 121
        Height = 21
        ControlLabel.Width = 78
        ControlLabel.Height = 13
        ControlLabel.Caption = #1056#1072#1073#1086#1095#1077#1077' '#1084#1077#1089#1090#1086':'
        ControlLabel.Visible = True
        ControlLabelLocation.Spacing = 6
        ControlLabelLocation.Position = lpLeftCenterEh
        DynProps = <>
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
    end
    object chAll: TDBCheckBoxEh
      Left = 112
      Top = 105
      Width = 97
      Height = 17
      Caption = #1042#1089#1077#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Checked = True
      DynProps = <>
      State = cbChecked
      TabOrder = 3
      OnClick = chAllClick
    end
  end
  object paBot: TPanel
    Left = 0
    Top = 282
    Width = 251
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      251
      41)
    object btCancel: TButton
      Left = 160
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
    end
    object btOk: TButton
      Left = 79
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
  end
end
