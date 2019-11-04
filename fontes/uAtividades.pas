unit uAtividades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPrincipal, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Menus;

type
  TFAtividades = class(TFPrincipal)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    SB: TStatusBar;
    Timer1: TTimer;
    Label1: TLabel;
    PopupConcluir: TPopupMenu;
    ConcluirAtividade1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PopupConcluirPopup(Sender: TObject);
    procedure ConcluirAtividade1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtividades: TFAtividades;

implementation

uses uFuncoesGerais, uDMDB, uNovaAtividade, uAtividadesControler,
  uEditarAtividade;

{$R *.dfm}

procedure TFAtividades.BitBtn1Click(Sender: TObject);
begin
  inherited;
  NovaAtividade(FDMDB.dsAtividades.DataSet);
  Application.CreateForm(TFNovaAtividade, FNovaAtividade);
  FNovaAtividade.ShowModal;
  FNovaAtividade.Destroy;
end;

procedure TFAtividades.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if EditarAtividade(FDMDB.dsAtividades.DataSet) then
  begin
    Application.CreateForm(TFEditarAtividade, FEditarAtividade);
    FEditarAtividade.ShowModal;
    FEditarAtividade.Destroy;
  end;
end;

procedure TFAtividades.BitBtn3Click(Sender: TObject);
begin
  inherited;
  RemoverAtividade(FDMDB.dsAtividades.DataSet);
end;

procedure TFAtividades.ConcluirAtividade1Click(Sender: TObject);
begin
  inherited;
  ConcluirAtividade(FDMDB.dsAtividades.DataSet);
end;

procedure TFAtividades.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (FDMDB.qyAtividades.FieldByName('STATUS').AsString = 'A') then
  begin
    Dbgrid1.Canvas.Font.Color:= clGreen; // coloque aqui a cor desejada
    Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  end else
  begin
    Dbgrid1.Canvas.Font.Color:= clGray; // coloque aqui a cor desejada
    Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  end;
end;

procedure TFAtividades.FormCreate(Sender: TObject);
begin
  inherited;
  SB.Panels[0].Text := DateToStr(Date) + ' - ' + DiadaSemana(Date);
  SB.Panels[1].Text := TimeToStr(Time);
end;

procedure TFAtividades.PopupConcluirPopup(Sender: TObject);
begin
  inherited;
  if (FDMDB.qyAtividades.FieldByName('STATUS').AsString = 'A') then
    ConcluirAtividade1.Enabled:=True
  else
    ConcluirAtividade1.Enabled:=False;
end;

procedure TFAtividades.Timer1Timer(Sender: TObject);
begin
  inherited;
  SB.Panels[1].Text := TimeToStr(Time);
end;

end.
