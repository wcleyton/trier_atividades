object FDMDB: TFDMDB
  OldCreateOrder = False
  Height = 207
  Width = 215
  object DB: TFDConnection
    Params.Strings = (
      'Database=DB_Atividades'
      'User_Name=postgres'
      'Password=root'
      'Server=127.0.0.1'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object qyTipoAtividade: TFDQuery
    Active = True
    Connection = DB
    SQL.Strings = (
      'select * from "TIPO_ATIVIDADE";')
    Left = 32
    Top = 72
    object qyTipoAtividadeID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      Origin = '"ID_TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyTipoAtividadeDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = '"DESCRICAO"'
      Size = 50
    end
  end
  object qyAtividades: TFDQuery
    Active = True
    Connection = DB
    SQL.Strings = (
      'select * from "ATIVIDADES";')
    Left = 120
    Top = 72
    object qyAtividadesID_ATIVIDADE: TIntegerField
      DisplayWidth = 14
      FieldName = 'ID_ATIVIDADE'
      Origin = '"ID_ATIVIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyAtividadesTITULO: TWideStringField
      DisplayWidth = 58
      FieldName = 'TITULO'
      Origin = '"TITULO"'
      Size = 100
    end
    object qyAtividadesDESCRICAO: TWideStringField
      DisplayWidth = 305
      FieldName = 'DESCRICAO'
      Origin = '"DESCRICAO"'
      Size = 254
    end
    object qyAtividadesTIPO: TIntegerField
      DisplayWidth = 16
      FieldName = 'TIPO'
      Origin = '"TIPO"'
    end
    object qyAtividadesSTATUS: TWideStringField
      DisplayWidth = 15
      FieldName = 'STATUS'
      Origin = '"STATUS"'
      FixedChar = True
      Size = 1
    end
    object qyAtividadesTipoDescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'TipoDescricao'
      LookupDataSet = qyTipoAtividade
      LookupKeyFields = 'ID_TIPO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPO'
      Lookup = True
    end
  end
  object dsTipoAtividade: TDataSource
    DataSet = qyTipoAtividade
    Left = 32
    Top = 136
  end
  object dsAtividades: TDataSource
    DataSet = qyAtividades
    Left = 120
    Top = 136
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 128
    Top = 16
  end
end
