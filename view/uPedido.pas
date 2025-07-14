unit uPedido;

interface

uses
  uFormMasterDetailManut, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Phys.OracleDef,
  FireDAC.Phys.Oracle, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmPedido = class(TfrmFormMasterDetailManut)
    lblCliente: TLabel;
    lblFecha: TLabel;
    lblPrecioTotal: TLabel;
    lblEstado: TLabel;
    lkpCliente: TDBLookupComboBox;
    edtFecha: TDBEdit;
    edtPrecioTotal: TDBEdit;
    cboEstado: TDBComboBox;
    dsCliente: TDataSource;
    lblProducto: TLabel;
    lkpProduto: TDBLookupComboBox;
    edtCantidad: TDBEdit;
    edtPrecio: TDBEdit;
    dsProducto: TDataSource;
    lblCantidad: TLabel;
    lblPrecio: TLabel;
    procedure lkpProdutoExit(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnDeshacerClick(Sender: TObject);
  private
    { Private declarations }
    function getPrecioTotal(idPedido : Integer):Currency;

  protected
    procedure DoShow; override;
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmPedido.lkpProdutoExit(Sender: TObject);
begin
  inherited;

  if lkpProduto.KeyValue > 0 then
    edtPrecio.Text := FormatFloat('#,0.00', DM.qryProducto.FieldByName('PRECIO').AsCurrency);
end;

procedure TfrmPedido.btnAplicarClick(Sender: TObject);
var
  idPedido : Integer;
  precioTotal : Currency;
begin
  try
    if DM.FDSchemaAdapter.UpdatesPending then
      DM.FDSchemaAdapter.ApplyUpdates(0);

    idPedido    :=  dataSource.DataSet.FieldByName('ID').Value;
    precioTotal :=  getPrecioTotal(idPedido);

    edtPrecioTotal.Text :=  FormatFloat('#,0.00', precioTotal);

    ShowMessage('Los datos persistieron con éxito.');
  except
    on E: Exception do
    begin
      DM.Conn.Rollback;
      ShowMessage('Error al aplicar cambios: ' + E.Message);
    end;
  end;
end;

procedure TfrmPedido.btnDeshacerClick(Sender: TObject);
begin
  try
    DM.FDSchemaAdapter.CancelUpdates;
  except
    on E: Exception do
    begin
      ShowMessage('Error al deshacer cambios: ' + E.Message);
    end;
  end;
end;

procedure TfrmPedido.DoShow;
begin
  DM.qryCliente.CachedUpdates := False;
  DM.qryCliente.Open();

  DM.qryProducto.CachedUpdates := False;
  DM.qryProducto.Open();

  inherited;
end;

procedure TfrmPedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  DM.qryCliente.Close();
  DM.qryProducto.Close();
end;

function TfrmPedido.getPrecioTotal(idPedido : Integer):Currency;
const
  cSQL : String = 'SELECT SUM(PRECIO_UNITARIO) AS PRECIO_TOTAL       '+
                  'FROM (                                            '+
                  '    SELECT (CANTIDAD * PRECIO) AS PRECIO_UNITARIO '+
                  '    FROM SYSTEM.ITENS_PEDIDO                      '+
                  '    WHERE IDPEDIDO = :PIDPEDIDO)                  ';
var
  qryPrecioTotal : TFDQuery;

begin
  try
    qryPrecioTotal            := TFDQuery.Create(nil);
    qryPrecioTotal.Connection := DM.Conn;

    qryPrecioTotal.Close;
    qryPrecioTotal.SQL.Clear;
    qryPrecioTotal.SQL.Add(cSQL);
    qryPrecioTotal.ParamByName('PIDPEDIDO').AsInteger :=  idPedido;
    qryPrecioTotal.Open;

    Result := qryPrecioTotal.FieldByName('PRECIO_TOTAL').AsCurrency;

    FreeAndNil(qryPrecioTotal);
  except
    Raise Exception.Create('Hubo un error en elcalculo de precio, ¡inténtelo de nuevo!');
  end;

end;
end.
