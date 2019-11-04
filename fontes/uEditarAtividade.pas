unit uEditarAtividade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uNovaAtividade, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TFEditarAtividade = class(TFNovaAtividade)
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEditarAtividade: TFEditarAtividade;

implementation

{$R *.dfm}

uses uAtividadesControler, uDMDB;

procedure TFEditarAtividade.BitBtn1Click(Sender: TObject);
begin
  EditarAtividade(FDMDB.dsAtividades.DataSet);
  Close;
end;

end.
