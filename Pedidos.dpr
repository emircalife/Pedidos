program Pedidos;

uses
  Vcl.Forms,
  uPrincipal in 'view\uPrincipal.pas' {frmPrincipal},
  uDM in 'view\uDM.pas' {DM: TDataModule},
  uFuncoes in 'utils\uFuncoes.pas',
  uFormManut in 'heranca\uFormManut.pas' {frmManut},
  uCliente in 'view\uCliente.pas' {frmCliente},
  uProducto in 'view\uProducto.pas' {frmProducto},
  uFormMasterDetailManut in 'heranca\uFormMasterDetailManut.pas' {frmFormMasterDetailManut},
  uPedido in 'view\uPedido.pas' {frmPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
