unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    Registro1: TMenuItem;
    Cliente1: TMenuItem;
    Producto1: TMenuItem;
    Pedidos1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure Producto1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCliente, uProducto, uPedido;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmCliente := TfrmCliente.Create(self);
  frmCliente.ShowModal;
  FreeAndNil(frmCliente);
end;

procedure TfrmPrincipal.Pedidos1Click(Sender: TObject);
begin
  frmPedido := TfrmPedido.Create(self);
  frmPedido.ShowModal;
  FreeAndNil(frmPedido);
end;

procedure TfrmPrincipal.Producto1Click(Sender: TObject);
begin
  frmProducto := TfrmProducto.Create(self);
  frmProducto.ShowModal;
  FreeAndNil(frmProducto);
end;

end.
