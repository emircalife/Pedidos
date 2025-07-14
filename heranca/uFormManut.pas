unit uFormManut;

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
  TfrmManut = class(TForm)
    pnlBotoes: TPanel;
    btnNuevo: TBitBtn;
    btnAlterar: TBitBtn;
    btnDeshacer: TBitBtn;
    btnAhorrar: TBitBtn;
    btnBorrar: TBitBtn;
    btnFechar: TBitBtn;
    btnAplicar: TBitBtn;
    btnCancelar: TBitBtn;
    grdCliente: TDBGrid;
    lstImagensBotoes: TImageList;
    dataSource: TDataSource;
    mskBuscar: TMaskEdit;
    cboBuscar: TComboBox;
    lblBuscar: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAhorrarClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnDeshacerClick(Sender: TObject);
    procedure mskBuscarChange(Sender: TObject);
  private
    { Private declarations }
  protected
    cFIltro : String;
    procedure DoShow; override;

  public
    { Public declarations }
  end;

var
  frmManut: TfrmManut;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmManut.btnAhorrarClick(Sender: TObject);
begin
  if dataSource.DataSet.State in dsEditModes then
    dataSource.DataSet.Post;
end;

procedure TfrmManut.btnAlterarClick(Sender: TObject);
begin
    if not dataSource.DataSet.IsEmpty then
      dataSource.DataSet.Edit;
end;

procedure TfrmManut.btnAplicarClick(Sender: TObject);
begin
  if TFDQuery(dataSource.DataSet).UpdatesPending then
  begin
    try
      if TFDQuery(dataSource.DataSet).ApplyUpdates(0) = 0 then
      begin
        ShowMessage('Los datos persistieron con éxito.');
        TFDQuery(dataSource.DataSet).CommitUpdates;
      end
      else
      begin
        ShowMessage('Errores al aplicar los cambios.');
      end;
    except
      on E: Exception do
      begin
        ShowMessage('Error al aplicar cambios: ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmManut.btnBorrarClick(Sender: TObject);
begin
  if dataSource.DataSet.State <> dsInactive then
    dataSource.DataSet.Delete;
end;

procedure TfrmManut.btnCancelarClick(Sender: TObject);
begin
  if dataSource.DataSet.State in dsEditModes then
    dataSource.DataSet.Cancel;
end;

procedure TfrmManut.btnDeshacerClick(Sender: TObject);
begin
  TFDQuery(dataSource.DataSet).CancelUpdates;
end;

procedure TfrmManut.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmManut.btnNuevoClick(Sender: TObject);
begin
  dataSource.DataSet.Append;
end;

procedure TfrmManut.DoShow;
begin
  inherited;
  TFDQuery(dataSource.DataSet).CachedUpdates := True;
  TFDQuery(dataSource.DataSet).Open();

end;

procedure TfrmManut.mskBuscarChange(Sender: TObject);
begin
  TFDQuery(dataSource.DataSet).Filtered := false;
  TFDQuery(dataSource.DataSet).Filter   := cFiltro;

  if trim(cFiltro) <> '' then
    TFDQuery(dataSource.DataSet).Filtered := true;
end;

end.
