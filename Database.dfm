object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\helpl\OneDrive\'#1044#1086#1082#1091#1084#1077#1085#1090#1099'\Embarcadero\Studio\Pr' +
        'ojects\testDb\test.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    Left = 32
    Top = 16
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    Left = 32
    Top = 80
  end
  object FDQueryDocs: TFDQuery
    Active = True
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    SQL.Strings = (
      'SELECT id as "ID", docs.state as "State"'
      'FROM docs'
      'ORDER BY id')
    Left = 120
    Top = 80
  end
  object FDQueryUsers: TFDQuery
    Active = True
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    SQL.Strings = (
      'SELECT id as "ID"'
      'FROM users'
      'ORDER BY id')
    Left = 120
    Top = 16
  end
  object FDQueryLogs: TFDQuery
    Active = True
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    SQL.Strings = (
      'SELECT '
      'id as "ID",'
      'DATETIME(changeTime, '#39'unixepoch'#39') as "Time",'
      'oldState as "Old State",'
      'newState as "New State",'
      'docId as "Doc",'
      'userId as "User"'
      'FROM stateLog'
      'ORDER BY userId')
    Left = 120
    Top = 144
  end
end
