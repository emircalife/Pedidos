inherited frmProducto: TfrmProducto
  Caption = 'Producto'
  ClientHeight = 643
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 682
  TextHeight = 15
  inherited lblBuscar: TLabel
    StyleElements = [seFont, seClient, seBorder]
  end
  object lblNombre: TLabel [1]
    Left = 190
    Top = 490
    Width = 44
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Nombre'
  end
  object lblDescripcion: TLabel [2]
    Left = 190
    Top = 519
    Width = 62
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Descripci'#243'n'
  end
  object lblPrecio: TLabel [3]
    Left = 190
    Top = 548
    Width = 33
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Precio'
  end
  object lblCantidadEnStock: TLabel [4]
    Left = 505
    Top = 548
    Width = 96
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Cantidad en Stock'
  end
  inherited pnlBotoes: TPanel
    Top = 581
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited grdCliente: TDBGrid
    Height = 427
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 470
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Title.Alignment = taCenter
        Title.Caption = 'Precio'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD_STOCK'
        Title.Caption = 'Cantidad en Stock'
        Width = 103
        Visible = True
      end>
  end
  inherited mskBuscar: TMaskEdit
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited cboBuscar: TComboBox
    ItemIndex = 0
    Text = 'Nombre'
    StyleElements = [seFont, seClient, seBorder]
    Items.Strings = (
      'Nombre'
      'Descripci'#243'n')
  end
  object edtNombre: TDBEdit [9]
    Left = 294
    Top = 485
    Width = 419
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'NOMBRE'
    DataSource = dataSource
    TabOrder = 4
  end
  object edtDescription: TDBEdit [10]
    Left = 294
    Top = 514
    Width = 419
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'DESCRIPCION'
    DataSource = dataSource
    TabOrder = 5
  end
  object edtPrecio: TDBEdit [11]
    Left = 294
    Top = 543
    Width = 100
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'PRECIO'
    DataSource = dataSource
    TabOrder = 6
  end
  object edtCantidadStock: TDBEdit [12]
    Left = 613
    Top = 543
    Width = 100
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'CANTIDAD_STOCK'
    DataSource = dataSource
    TabOrder = 7
  end
  inherited dataSource: TDataSource
    DataSet = DM.qryProducto
  end
end
