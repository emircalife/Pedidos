object DM: TDM
  OnCreate = DataModuleCreate
  Height = 562
  Width = 814
  object Trans: TFDTransaction
    Connection = Conn
    Left = 120
    Top = 16
  end
  object Conn: TFDConnection
    Params.Strings = (
      'User_Name=system'
      'Password=12345'
      'Database=//localhost:1521/XE'
      'CharacterSet=UTF8'
      'ReadTimeout=10000'
      'WriteTimeout=10000'
      'DriverID=Ora')
    Connected = True
    LoginPrompt = False
    Transaction = Trans
    Left = 56
    Top = 16
  end
  object FDPhysOracleDriverLink: TFDPhysOracleDriverLink
    VendorLib = 'C:\oracle\instantclient_21_18\oci.dll'
    Left = 224
    Top = 16
  end
  object qryCliente: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    CachedUpdates = True
    Connection = Conn
    SQL.Strings = (
      'select * '
      'from cliente'
      'order by nombre')
    Left = 48
    Top = 120
    object qryClienteID: TFMTBCDField
      FieldName = 'ID'
      KeyFields = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Precision = 38
      Size = 38
    end
    object qryClienteNOMBRE: TWideStringField
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Required = True
      Size = 255
    end
    object qryClienteCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '0000000;1;_'
    end
    object qryClienteCALLE: TWideStringField
      FieldName = 'CALLE'
      Origin = 'CALLE'
      Size = 255
    end
    object qryClienteNUMERO: TWideStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 8
    end
    object qryClienteBARRIO: TWideStringField
      FieldName = 'BARRIO'
      Origin = 'BARRIO'
      Size = 255
    end
    object qryClienteCIUDAD: TWideStringField
      FieldName = 'CIUDAD'
      Origin = 'CIUDAD'
      Size = 255
    end
    object qryClienteCODIGO_POSTAL: TWideStringField
      FieldName = 'CODIGO_POSTAL'
      Origin = 'CODIGO_POSTAL'
      EditMask = '!999999;1;_'
      Size = 10
    end
    object qryClienteTELEFONO: TWideStringField
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
      EditMask = '00 000 000;1;_'
      Size = 10
    end
    object qryClienteFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'FECHA_NACIMIENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object qryClienteCORREO_ELECTRONICO: TWideStringField
      FieldName = 'CORREO_ELECTRONICO'
      Origin = 'CORREO_ELECTRONICO'
      Size = 255
    end
  end
  object qryProducto: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    CachedUpdates = True
    Connection = Conn
    SQL.Strings = (
      'select * '
      'from producto'
      'order by nombre, descripcion')
    Left = 128
    Top = 120
    object qryProductoID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      KeyFields = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Precision = 38
      Size = 38
    end
    object qryProductoNOMBRE: TWideStringField
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Required = True
      Size = 255
    end
    object qryProductoDESCRIPCION: TWideStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DESCRIPCION'
      Size = 255
    end
    object qryProductoPRECIO: TBCDField
      FieldName = 'PRECIO'
      Origin = 'PRECIO'
      currency = True
      Precision = 10
      Size = 2
    end
    object qryProductoCANTIDAD_STOCK: TFMTBCDField
      FieldName = 'CANTIDAD_STOCK'
      Origin = 'CANTIDAD_STOCK'
      Precision = 38
      Size = 0
    end
  end
  object qryPedido: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    CachedUpdates = True
    FilterChanges = [rtModified, rtInserted, rtUnmodified, rtHasErrors]
    Connection = Conn
    SchemaAdapter = FDSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName, uvAutoCommitUpdates]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = '"SYSTEM".PEDIDOS_PEDIDO_SEQ'
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.UpdateTableName = 'SYSTEM.PEDIDO'
    UpdateOptions.KeyFields = 'ID'
    UpdateOptions.AutoIncFields = 'ID'
    SQL.Strings = (
      'SELECT pe.ID,'
      '       pe.IDCLIENTE, '
      '       pe.FECHA,'
      '       pe.ESTADO,'
      '       pe.PRECIOTOTAL,'
      '       cl.nombre as NombreCliente'
      'FROM SYSTEM.PEDIDO pe'
      'INNER JOIN SYSTEM.CLIENTE cl ON cl.ID = pe.IDCLIENTE')
    Left = 224
    Top = 120
    object qryPedidoID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 38
      Size = 38
    end
    object qryPedidoIDCLIENTE: TFMTBCDField
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
      Precision = 38
      Size = 38
    end
    object qryPedidoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FECHA'
    end
    object qryPedidoESTADO: TWideStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
    end
    object qryPedidoPRECIOTOTAL: TBCDField
      FieldName = 'PRECIOTOTAL'
      Origin = 'PRECIOTOTAL'
      Precision = 10
      Size = 2
    end
    object qryPedidoNOMBRECLIENTE: TWideStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'NOMBRECLIENTE'
      Required = True
      Size = 255
    end
  end
  object qryItensPedido: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    CachedUpdates = True
    FilterChanges = [rtModified, rtInserted, rtUnmodified, rtHasErrors]
    MasterSource = dsPedido
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = Conn
    SchemaAdapter = FDSchemaAdapter
    FetchOptions.AssignedValues = [evCache, evDetailCascade, evDetailServerCascade]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName, uvAutoCommitUpdates]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = '"SYSTEM".PEDIDOS_ITENS_PEDIDO_SEQ'
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.UpdateTableName = 'SYSTEM.ITENS_PEDIDO'
    UpdateOptions.KeyFields = 'ID'
    UpdateOptions.AutoIncFields = 'ID'
    SQL.Strings = (
      'SELECT ipe.ID,'
      '       ipe.IDPEDIDO, '
      '       ipe.IDPRODUCTO, '
      '       ipe.CANTIDAD,'
      '       ipe.PRECIO,'
      '       pr.NOMBRE as NombreProducto'
      'FROM SYSTEM.ITENS_PEDIDO ipe'
      'INNER JOIN SYSTEM.PRODUCTO pr ON pr.ID = ipe.IDPRODUCTO'
      'WHERE ipe.IDPEDIDO = :ID')
    Left = 320
    Top = 120
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFMTBcd
        NumericScale = 38
        ParamType = ptInput
        Value = '16'
      end>
    object qryItensPedidoID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 38
      Size = 38
    end
    object qryItensPedidoIDPEDIDO: TFMTBCDField
      FieldName = 'IDPEDIDO'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoIDPRODUCTO: TFMTBCDField
      FieldName = 'IDPRODUCTO'
      Precision = 38
      Size = 38
    end
    object qryItensPedidoCANTIDAD: TFMTBCDField
      FieldName = 'CANTIDAD'
      Precision = 38
      Size = 0
    end
    object qryItensPedidoPRECIO: TBCDField
      FieldName = 'PRECIO'
      Precision = 10
      Size = 2
    end
    object qryItensPedidoNOMBREPRODUCTO: TWideStringField
      FieldName = 'NOMBREPRODUCTO'
      Required = True
      Size = 255
    end
  end
  object dsPedido: TDataSource
    DataSet = qryPedido
    Left = 224
    Top = 184
  end
  object FDSchemaAdapter: TFDSchemaAdapter
    ResourceOptions.AssignedValues = [rvPersistent]
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.AutoIncFields = 'ID'
    Left = 368
    Top = 16
  end
end
