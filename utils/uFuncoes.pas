unit uFuncoes;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, System.StrUtils, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
    Vcl.Dialogs,
    Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
    Vcl.StdCtrls, Vcl.Buttons, IdGlobal, IdHash, IdHashMessageDigest,
    Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
    FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
    FireDAC.Comp.Client;

  function StrZero(iNumero, iComp: Integer): String;
  function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
  procedure LimpaCampos (Form: TForm);

implementation

uses uDM;

procedure LimpaCampos(Form: TForm);
var
  i : Integer;
begin
  for i := 0 to (Form.ComponentCount - 2) do
    if Form.Components[i] is TEdit then
      (Form.Components[i] as TEdit).Clear
    else if Form.Components[i] is TMaskEdit then
      (Form.Components[i] as TMaskEdit).Clear
    else if Form.Components[i] is TMemo then
      (Form.Components[i] as TMemo).Clear
    else if Form.Components[i] is TCheckBox then
      (Form.Components[i] as TCheckBox).Checked := false
    else if Form.Components[i] is TComboBox then
      (Form.Components[i] as TComboBox).ItemIndex := -1;
end;

function StrZero(iNumero, iComp: Integer): String;
begin
  Result := StringOfChar('0', iComp - Length(IntToStr(iNumero))) +
            IntToStr(iNumero);
end;

function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
 begin
   if Expressao then
      Result := ParteTRUE
   else
      Result := ParteFALSE;
 end;

end.
