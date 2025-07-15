unit uFormMasterDetailManut;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
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
  TfrmFormMasterDetailManut = class(TForm)
    lblBuscar: TLabel;
    mskBuscar: TMaskEdit;
    cboBuscar: TComboBox;
    dataSource: TDataSource;
    lstImagensBotoes: TImageList;
    pnlBotoesI: TPanel;
    btnNuevo: TBitBtn;
    btnAlterar: TBitBtn;
    btnAhorrar: TBitBtn;
    btnBorrar: TBitBtn;
    btnCancelar: TBitBtn;
    grdItensPedido: TDBGrid;
    pnlBotoesHijo: TPanel;
    btnNuevoHijo: TBitBtn;
    btnAlterarHijo: TBitBtn;
    btnAhorrarHijo: TBitBtn;
    btnBorrarHijo: TBitBtn;
    btnFechar: TBitBtn;
    btnAplicar: TBitBtn;
    btnDeshacer: TBitBtn;
    btnCancelarHijo: TBitBtn;
    DataSourceHijo: TDataSource;
    grdPedido: TDBGrid;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAhorrarClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnNuevoHijoClick(Sender: TObject);
    procedure btnAlterarHijoClick(Sender: TObject);
    procedure btnCancelarHijoClick(Sender: TObject);
    procedure btnAhorrarHijoClick(Sender: TObject);
    procedure btnBorrarHijoClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure DoShow; override;
  public
    { Public declarations }
end;

var
  frmFormMasterDetailManut: TfrmFormMasterDetailManut;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmFormMasterDetailManut.btnAhorrarClick(Sender: TObject);
begin
  if dataSource.DataSet.State in dsEditModes then
    dataSource.DataSet.Post;
end;

procedure TfrmFormMasterDetailManut.btnAhorrarHijoClick(Sender: TObject);
begin
  if DataSourceHijo.DataSet.State in dsEditModes then
    DataSourceHijo.DataSet.Post;
end;

procedure TfrmFormMasterDetailManut.btnAlterarClick(Sender: TObject);
begin
  if not dataSource.DataSet.IsEmpty then
    dataSource.DataSet.Edit;
end;

procedure TfrmFormMasterDetailManut.btnAlterarHijoClick(Sender: TObject);
begin
  if not DataSourceHijo.DataSet.IsEmpty then
    DataSourceHijo.DataSet.Edit;
end;

procedure TfrmFormMasterDetailManut.btnBorrarClick(Sender: TObject);
begin
  if dataSource.DataSet.State <> dsInactive then
    dataSource.DataSet.Delete;
end;

procedure TfrmFormMasterDetailManut.btnBorrarHijoClick(Sender: TObject);
begin
  if DataSourceHijo.DataSet.State <> dsInactive then
    DataSourceHijo.DataSet.Delete;
end;

procedure TfrmFormMasterDetailManut.btnCancelarClick(Sender: TObject);
begin
  if dataSource.DataSet.State in dsEditModes then
    dataSource.DataSet.Cancel;
end;

procedure TfrmFormMasterDetailManut.btnCancelarHijoClick(Sender: TObject);
begin
  if DataSourceHijo.DataSet.State in dsEditModes then
    DataSourceHijo.DataSet.Cancel;
end;

procedure TfrmFormMasterDetailManut.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFormMasterDetailManut.btnNuevoClick(Sender: TObject);
begin
  dataSource.DataSet.Append;
end;

procedure TfrmFormMasterDetailManut.btnNuevoHijoClick(Sender: TObject);
begin
  DataSourceHijo.DataSet.Append;
end;

procedure TfrmFormMasterDetailManut.DoShow;
begin
  inherited;

  TFDQuery(dataSource.DataSet).Open();
  TFDQuery(DataSourceHijo.DataSet).Open();
end;

procedure TfrmFormMasterDetailManut.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  TFDQuery(dataSource.DataSet).Close();
  TFDQuery(DataSourceHijo.DataSet).Close();
end;

end.
