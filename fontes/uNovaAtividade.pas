unit uNovaAtividade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPrincipal, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons;

type
  TFNovaAtividade = class(TFPrincipal)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNovaAtividade: TFNovaAtividade;

implementation

{$R *.dfm}

uses uDMDB, uAtividadesControler;

procedure TFNovaAtividade.BitBtn1Click(Sender: TObject);
begin
  inherited;
  InserirAtividade(FDMDB.dsAtividades.DataSet);
  Close;
end;

procedure TFNovaAtividade.BitBtn2Click(Sender: TObject);
begin
  inherited;
  CancelarAtividade(FDMDB.dsAtividades.DataSet);
  Close;
end;

end.
