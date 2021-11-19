object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 567
  ClientWidth = 1069
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object paTop: TPanel
    Left = 0
    Top = 0
    Width = 1069
    Height = 41
    Align = alTop
    TabOrder = 0
    object btStart: TButton
      Left = 231
      Top = 10
      Width = 75
      Height = 25
      Caption = #1057#1090#1072#1088#1090
      TabOrder = 0
      OnClick = btStartClick
    end
    object btSave: TButton
      Left = 616
      Top = 10
      Width = 105
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' Excel'
      TabOrder = 1
      OnClick = btSaveClick
    end
    object cbBase: TDBComboBoxEh
      Left = 79
      Top = 11
      Width = 138
      Height = 21
      ControlLabel.Width = 57
      ControlLabel.Height = 13
      ControlLabel.Caption = #1055#1083#1086#1097#1072#1076#1082#1072':'
      ControlLabel.Visible = True
      ControlLabelLocation.Spacing = 5
      ControlLabelLocation.Position = lpLeftTextBaselineEh
      AutoSelect = False
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        'MIN: '#1052#1080#1085#1077#1088#1072#1083#1100#1085#1072#1103
        'SMR: '#1057#1072#1084#1072#1088#1072
        'YAR: '#1071#1088#1086#1089#1083#1072#1074#1083#1100
        'KNI: '#1050#1085#1080#1087#1086#1074#1080#1095)
      KeyItems.Strings = (
        '0'
        '1'
        '2'
        '3')
      TabOrder = 2
      Visible = True
    end
    object btEditUser: TButton
      Left = 336
      Top = 10
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 3
      OnClick = btEditUserClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1069
    Height = 526
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object dgUsr: TDBGridEh
      Left = 1
      Top = 1
      Width = 1067
      Height = 524
      Align = alClient
      ColumnDefValues.Title.TitleButton = True
      DataSource = dsUsr
      DynProps = <>
      HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh]
      HorzScrollBar.ExtraPanel.Visible = True
      IndicatorParams.FillStyle = cfstSolidEh
      EmptyDataInfo.Active = True
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghExtendVertLines]
      PopupMenu = pmMenu
      SearchPanel.Enabled = True
      SearchPanel.Location = splHorzScrollBarExtraPanelEh
      SearchPanel.SearchScope = gssCurrentColumnEh
      TabOrder = 0
      OnTitleBtnClick = dgUsrTitleBtnClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'IP'
          Footers = <>
          Width = 103
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Location'
          Footers = <>
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'UsrName'
          Footers = <>
          Width = 90
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Usr'
          Footers = <>
          Width = 86
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'LName'
          Footers = <>
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FName'
          Footers = <>
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MName'
          Footers = <>
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Platform'
          Footers = <>
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Prava'
          Footers = <>
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RMesto'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object sSec: TpFIBSecurityService
    LibraryName = 'C:\Windows\gds32.dll'
    LoginPrompt = False
    SecurityAction = ActionDeleteUser
    UserID = 0
    GroupID = 0
    SecAdmin = True
    Left = 16
    Top = 88
  end
  object mtUsr: TMemTableEh
    Active = True
    AutoIncrement.InitValue = 1
    AutoIncrement.Step = 1
    Params = <>
    Left = 56
    Top = 88
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object ID: TMTNumericDataFieldEh
          FieldName = 'ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = True
          DisplayLabel = 'Id'
          DisplayWidth = 5
          currency = False
          MinValue = 1.000000000000000000
          Precision = 15
        end
        object IP: TMTStringDataFieldEh
          FieldName = 'IP'
          StringDataType = fdtStringEh
          DisplayLabel = 'IP'
          DisplayWidth = 20
        end
        object Location: TMTStringDataFieldEh
          FieldName = 'Location'
          StringDataType = fdtStringEh
          DisplayLabel = #1051#1086#1082#1072#1094#1080#1103
          DisplayWidth = 6
        end
        object UsrName: TMTStringDataFieldEh
          FieldName = 'UsrName'
          StringDataType = fdtStringEh
          DisplayLabel = 'UserName'
          DisplayWidth = 20
        end
        object FName: TMTStringDataFieldEh
          FieldName = 'FName'
          StringDataType = fdtStringEh
          DisplayLabel = #1048#1084#1103
          DisplayWidth = 20
        end
        object MName: TMTStringDataFieldEh
          FieldName = 'MName'
          StringDataType = fdtStringEh
          DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
          DisplayWidth = 20
        end
        object LName: TMTStringDataFieldEh
          FieldName = 'LName'
          StringDataType = fdtStringEh
          DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
          DisplayWidth = 20
        end
        object Platform: TMTStringDataFieldEh
          FieldName = 'Platform'
          StringDataType = fdtStringEh
          DisplayLabel = #1055#1083#1086#1097#1072#1076#1082#1072
          DisplayWidth = 20
        end
        object Prava: TMTStringDataFieldEh
          FieldName = 'Prava'
          StringDataType = fdtStringEh
          DisplayLabel = #1050#1086#1076' '#1056#1052
          DisplayWidth = 6
        end
        object RMesto: TMTStringDataFieldEh
          FieldName = 'RMesto'
          StringDataType = fdtStringEh
          DisplayLabel = #1056#1072#1073#1086#1095#1077#1077' '#1084#1077#1089#1090#1086
          DisplayWidth = 30
          Size = 30
        end
        object Usr: TMTStringDataFieldEh
          FieldName = 'Usr'
          StringDataType = fdtStringEh
          DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsUsr: TDataSource
    DataSet = mtUsr
    Left = 96
    Top = 88
  end
  object sd1: TSaveDialog
    Title = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Left = 24
    Top = 176
  end
  object pmMenu: TPopupMenu
    Left = 104
    Top = 176
    object mpDelUser: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = mpDelUserClick
    end
  end
end
