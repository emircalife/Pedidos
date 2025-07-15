unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Phys.OracleDef,
  FireDAC.Phys.Oracle, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Trans: TFDTransaction;
    Conn: TFDConnection;
    FDPhysOracleDriverLink: TFDPhysOracleDriverLink;
    qryCliente: TFDQuery;
    qryClienteID: TFMTBCDField;
    qryClienteNOMBRE: TWideStringField;
    qryClienteCPF: TWideStringField;
    qryClienteCALLE: TWideStringField;
    qryClienteNUMERO: TWideStringField;
    qryClienteBARRIO: TWideStringField;
    qryClienteCIUDAD: TWideStringField;
    qryClienteCODIGO_POSTAL: TWideStringField;
    qryClienteTELEFONO: TWideStringField;
    qryClienteFECHA_NACIMIENTO: TDateTimeField;
    qryClienteCORREO_ELECTRONICO: TWideStringField;
    qryProducto: TFDQuery;
    qryProductoID: TFMTBCDField;
    qryProductoNOMBRE: TWideStringField;
    qryProductoDESCRIPCION: TWideStringField;
    qryProductoPRECIO: TBCDField;
    qryProductoCANTIDAD_STOCK: TFMTBCDField;
    qryPedido: TFDQuery;
    qryItensPedido: TFDQuery;
    dsPedido: TDataSource;
    FDSchemaAdapter: TFDSchemaAdapter;
    qryItensPedidoID: TFMTBCDField;
    qryItensPedidoIDPEDIDO: TFMTBCDField;
    qryItensPedidoIDPRODUCTO: TFMTBCDField;
    qryItensPedidoCANTIDAD: TFMTBCDField;
    qryItensPedidoPRECIO: TBCDField;
    qryItensPedidoNOMBREPRODUCTO: TWideStringField;
    qryPedidoID: TFMTBCDField;
    qryPedidoIDCLIENTE: TFMTBCDField;
    qryPedidoFECHA: TDateTimeField;
    qryPedidoESTADO: TWideStringField;
    qryPedidoPRECIOTOTAL: TBCDField;
    qryPedidoNOMBRECLIENTE: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryPedidoIDCLIENTEChange(Sender: TField);
    procedure qryItensPedidoIDPRODUCTOChange(Sender: TField);
    procedure qryItensPedidoNewRecord(DataSet: TDataSet);
    procedure qryItensPedidoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uPedido;

{$R *.dfm}

procedure TDM.AfterConstruction;
var
  vI: INTEGER;
begin
  inherited;
  for vI := 0 to ComponentCount - 1 do
  begin
     if Components[vI] IS TFDQuery then
     begin
        TFDQuery(Components[vI]).CachedUpdates := True;

        TFDQuery(Components[vI]).FetchOptions.AutoClose := True;
        TFDQuery(Components[vI]).FetchOptions.Mode := fmAll;
        TFDQuery(Components[vI]).FetchOptions.CursorKind := ckDefault;
        TFDQuery(Components[vI]).FetchOptions.RowsetSize := 1000;
        TFDQuery(Components[vI]).FetchOptions.DetailOptimize := False;

        TFDQuery(Components[vI]).UpdateOptions.UpdateChangedFields := False;
        TFDQuery(Components[vI]).UpdateOptions.UpdateMode := upWhereKeyOnly;
        TFDQuery(Components[vI]).UpdateOptions.LockMode := lmNone;
        TFDQuery(Components[vI]).UpdateOptions.RefreshMode := rmManual;
        TFDQuery(Components[vI]).UpdateOptions.CheckReadOnly := False;
        TFDQuery(Components[vI]).UpdateOptions.CheckRequired := False;
        TFDQuery(Components[vI]).UpdateOptions.CheckUpdatable := False;
        TFDQuery(Components[vI]).UpdateOptions.CountUpdatedRecords := False;
        TFDQuery(Components[vI]).UpdateOptions.FastUpdates := True;
        TFDQuery(Components[vI]).UpdateOptions.FetchGeneratorsPoint := gpImmediate;
        TFDQuery(Components[vI]).UpdateOptions.AutoCommitUpdates := False;

        TFDQuery(Components[vI]).ResourceOptions.SilentMode := True;
     end
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Conn.DriverName                     := 'Ora';
  Conn.Params.Values['User_Name']     := 'system';
  Conn.Params.Values['Password']      := '12345';
  Conn.Params.Values['Database']      := '//localhost:1521/XE';
  Conn.Params.Values['CharacterSet']  := 'UTF8';

  Conn.Connected  :=  True;
end;

procedure TDM.qryItensPedidoBeforePost(DataSet: TDataSet);
begin
//  qryItensPedido.FieldByName('IDPRODUCTO').AsInteger  := qryProducto.FieldByName('ID').AsInteger;
end;

procedure TDM.qryItensPedidoIDPRODUCTOChange(Sender: TField);
begin
  Sender.DataSet.FieldByName('NOMBREPRODUCTO').AsString := qryProductoNOMBRE.AsString;
end;

procedure TDM.qryItensPedidoNewRecord(DataSet: TDataSet);
begin
  qryItensPedido.FieldByName('IDPEDIDO').AsInteger  :=  qryPedido.FieldByName('ID').AsInteger;
end;

procedure TDM.qryPedidoIDCLIENTEChange(Sender: TField);
begin
  Sender.DataSet.FieldByName('NOMBRECLIENTE').AsString := qryClienteNOMBRE.AsString;
end;

end.

