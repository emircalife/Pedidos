unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormManut, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmCliente = class(TfrmManut)
    lblNombre: TLabel;
    lblCPF: TLabel;
    lblBarrio: TLabel;
    lblCiudad: TLabel;
    lblNumero: TLabel;
    lblCalle: TLabel;
    lblCodigoPostal: TLabel;
    lblTelefono: TLabel;
    lblFechaNacimiento: TLabel;
    lblCorreoElectronico: TLabel;
    edtNombre: TDBEdit;
    edtCPF: TDBEdit;
    edtCalle: TDBEdit;
    edtNumero: TDBEdit;
    edtBarrio: TDBEdit;
    edtCiudad: TDBEdit;
    edtCodigoPostal: TDBEdit;
    edtTetefono: TDBEdit;
    edtFechaDeNacimiento: TDBEdit;
    edtCorreoElectronico: TDBEdit;
    procedure cboBuscarChange(Sender: TObject);
    procedure mskBuscarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmCliente.cboBuscarChange(Sender: TObject);
begin
  inherited;

  case cboBuscar.ItemIndex of
    0: //Nombre
      begin
        mskBuscar.EditMask  := '';
        mskBuscar.Width     := 320;
      end;
    1: //CPF
      begin
        mskBuscar.EditMask  := '0000000;1;_';
        mskBuscar.Width     := 60;
      end;
  end;

  mskBuscar.Text      := '';
end;

procedure TfrmCliente.mskBuscarChange(Sender: TObject);
begin
  if trim(mskBuscar.Text) <> '' then
  begin
    case cboBuscar.ItemIndex of
      0: self.cFiltro := 'UPPER(NOMBRE) LIKE ' + QuotedStr('%' + trim(UpperCase(mskBuscar.Text)) + '%');  //Nombre
      1: self.cFiltro := 'CPF LIKE ' + QuotedStr('%' + trim(mskBuscar.Text) + '%');  //CPF
    end;

    inherited;
  end;
end;

end.
