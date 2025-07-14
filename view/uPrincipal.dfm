object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de Pedidos'
  ClientHeight = 729
  ClientWidth = 1062
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mnuPrincipal
  Position = poDesktopCenter
  TextHeight = 15
  object mnuPrincipal: TMainMenu
    Left = 408
    Top = 200
    object Registro1: TMenuItem
      Caption = 'Registro'
      object Cliente1: TMenuItem
        Caption = 'Clientes'
        OnClick = Cliente1Click
      end
      object Producto1: TMenuItem
        Caption = 'Productos'
        OnClick = Producto1Click
      end
    end
    object Pedidos1: TMenuItem
      Caption = 'Pedidos'
      OnClick = Pedidos1Click
    end
  end
end
