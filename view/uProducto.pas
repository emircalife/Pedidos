unit uProducto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormManut, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmProducto = class(TfrmManut)
    lblNombre: TLabel;
    lblDescripcion: TLabel;
    lblPrecio: TLabel;
    lblCantidadEnStock: TLabel;
    edtNombre: TDBEdit;
    edtDescription: TDBEdit;
    edtPrecio: TDBEdit;
    edtCantidadStock: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProducto: TfrmProducto;

implementation

{$R *.dfm}

uses uDM;

end.
