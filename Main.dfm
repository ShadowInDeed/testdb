object Form1: TForm1
  Left = 0
  Top = 0
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 113
    Top = 0
    Height = 600
    ExplicitLeft = 170
    ExplicitTop = 17
  end
  object Splitter2: TSplitter
    Left = 297
    Top = 0
    Height = 600
    ExplicitLeft = 193
  end
  object GroupBoxDocuments: TGroupBox
    Left = 116
    Top = 0
    Width = 181
    Height = 600
    Align = alLeft
    Caption = 'Documents'
    TabOrder = 0
    ExplicitHeight = 599
    object SpeedButtonChangeStates: TSpeedButton
      Left = 2
      Top = 576
      Width = 177
      Height = 22
      Align = alBottom
      Caption = 'Change states'
      OnClick = SpeedButtonChangeStatesClick
      ExplicitLeft = 4
      ExplicitTop = 578
    end
    object SpeedButtonAddDoc: TSpeedButton
      Left = 2
      Top = 554
      Width = 177
      Height = 22
      Align = alBottom
      Caption = 'Add'
      OnClick = SpeedButtonAddDocClick
      ExplicitLeft = 32
      ExplicitTop = 304
      ExplicitWidth = 23
    end
    object DBGridDocuments: TDBGrid
      Left = 2
      Top = 42
      Width = 177
      Height = 512
      Align = alClient
      DataSource = DataSourceDocs
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'State'
          Visible = True
        end>
    end
    object DBNavigatorDocs: TDBNavigator
      Left = 2
      Top = 17
      Width = 177
      Height = 25
      DataSource = DataSourceDocs
      VisibleButtons = [nbDelete, nbRefresh]
      Align = alTop
      TabOrder = 1
    end
  end
  object GroupBoxUsers: TGroupBox
    Left = 0
    Top = 0
    Width = 113
    Height = 600
    Align = alLeft
    Caption = 'Users'
    TabOrder = 1
    ExplicitHeight = 599
    object SpeedButtonAddUser: TSpeedButton
      Left = 2
      Top = 576
      Width = 109
      Height = 22
      Align = alBottom
      Caption = 'Add'
      OnClick = SpeedButtonAddUserClick
      ExplicitLeft = 32
      ExplicitTop = 304
      ExplicitWidth = 23
    end
    object DBGridUsers: TDBGrid
      Left = 2
      Top = 42
      Width = 109
      Height = 534
      Align = alClient
      DataSource = DataSourceUsers
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 70
          Visible = True
        end>
    end
    object DBNavigatorUsers: TDBNavigator
      Left = 2
      Top = 17
      Width = 109
      Height = 25
      DataSource = DataSourceUsers
      VisibleButtons = [nbDelete, nbRefresh]
      Align = alTop
      TabOrder = 1
    end
  end
  object GroupBoxLogs: TGroupBox
    Left = 300
    Top = 0
    Width = 500
    Height = 600
    Align = alClient
    Caption = 'Logs'
    TabOrder = 2
    ExplicitWidth = 496
    ExplicitHeight = 599
    object DBGridLogs: TDBGrid
      Left = 2
      Top = 42
      Width = 496
      Height = 556
      Align = alClient
      DataSource = DataSourceLogs
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Doc'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Old State'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'New State'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'User'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Time'
          Width = 112
          Visible = True
        end>
    end
    object DBNavigatorLogs: TDBNavigator
      Left = 2
      Top = 17
      Width = 496
      Height = 25
      DataSource = DataSourceLogs
      VisibleButtons = [nbRefresh]
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 492
    end
  end
  object DataSourceUsers: TDataSource
    DataSet = DataModule1.FDQueryUsers
    Left = 32
    Top = 344
  end
  object DataSourceDocs: TDataSource
    DataSet = DataModule1.FDQueryDocs
    Left = 32
    Top = 400
  end
  object DataSourceLogs: TDataSource
    DataSet = DataModule1.FDQueryLogs
    Left = 32
    Top = 456
  end
end
