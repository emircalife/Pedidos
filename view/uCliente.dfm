inherited frmCliente: TfrmCliente
  Caption = 'Clientes'
  ClientHeight = 642
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 681
  TextHeight = 15
  inherited lblBuscar: TLabel
    StyleElements = [seFont, seClient, seBorder]
  end
  object lblNombre: TLabel [1]
    Left = 6
    Top = 425
    Width = 44
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Nombre'
  end
  object lblCPF: TLabel [2]
    Left = 535
    Top = 425
    Width = 21
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'CPF'
  end
  object lblBarrio: TLabel [3]
    Left = 6
    Top = 481
    Width = 31
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Barrio'
  end
  object lblCiudad: TLabel [4]
    Left = 534
    Top = 483
    Width = 38
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Ciudad'
  end
  object lblNumero: TLabel [5]
    Left = 535
    Top = 454
    Width = 44
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Numero'
  end
  object lblCalle: TLabel [6]
    Left = 6
    Top = 454
    Width = 26
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Calle'
  end
  object lblCodigoPostal: TLabel [7]
    Left = 6
    Top = 512
    Width = 74
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Codigo Postal'
  end
  object lblTelefono: TLabel [8]
    Left = 416
    Top = 512
    Width = 46
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Tel'#233'fono'
  end
  object lblFechaNacimiento: TLabel [9]
    Left = 535
    Top = 512
    Width = 112
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Fecha de Nacimiento'
  end
  object lblCorreoElectronico: TLabel [10]
    Left = 6
    Top = 541
    Width = 98
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Correo Electr'#243'nico'
  end
  inherited pnlBotoes: TPanel
    Top = 580
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 580
  end
  inherited grdCliente: TDBGrid
    Height = 362
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 341
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CPF'
        Title.Alignment = taCenter
        Width = 91
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_NACIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Nacimiento'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TELEFONO'
        Title.Alignment = taCenter
        Title.Caption = 'Tel'#233'fono'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORREO_ELECTRONICO'
        Title.Caption = 'Correo Electr'#243'nico'
        Width = 282
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
    OnChange = cboBuscarChange
  end
  object edtNombre: TDBEdit [15]
    Left = 110
    Top = 421
    Width = 419
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'NOMBRE'
    DataSource = dataSource
    TabOrder = 4
  end
  object edtCPF: TDBEdit [16]
    Left = 657
    Top = 421
    Width = 70
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'CPF'
    DataSource = dataSource
    TabOrder = 5
  end
  object edtCalle: TDBEdit [17]
    Left = 110
    Top = 450
    Width = 419
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'CALLE'
    DataSource = dataSource
    TabOrder = 6
  end
  object edtNumero: TDBEdit [18]
    Left = 657
    Top = 450
    Width = 70
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'NUMERO'
    DataSource = dataSource
    TabOrder = 7
  end
  object edtBarrio: TDBEdit [19]
    Left = 110
    Top = 479
    Width = 419
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'BARRIO'
    DataSource = dataSource
    TabOrder = 8
  end
  object edtCiudad: TDBEdit [20]
    Left = 657
    Top = 479
    Width = 278
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'CIUDAD'
    DataSource = dataSource
    TabOrder = 9
  end
  object edtCodigoPostal: TDBEdit [21]
    Left = 110
    Top = 508
    Width = 43
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'CODIGO_POSTAL'
    DataSource = dataSource
    TabOrder = 10
  end
  object edtTetefono: TDBEdit [22]
    Left = 471
    Top = 508
    Width = 58
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'TELEFONO'
    DataSource = dataSource
    TabOrder = 11
  end
  object edtFechaDeNacimiento: TDBEdit [23]
    Left = 657
    Top = 508
    Width = 70
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'FECHA_NACIMIENTO'
    DataSource = dataSource
    TabOrder = 12
  end
  object edtCorreoElectronico: TDBEdit [24]
    Left = 110
    Top = 537
    Width = 419
    Height = 23
    Anchors = [akLeft, akBottom]
    DataField = 'CORREO_ELECTRONICO'
    DataSource = dataSource
    TabOrder = 13
  end
  inherited dataSource: TDataSource
    DataSet = DM.qryCliente
  end
end
