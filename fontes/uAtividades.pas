unit uAtividades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPrincipal, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Menus,
  System.ImageList, Vcl.ImgList, inifiles;

type
  TFAtividades = class(TFPrincipal)
    Panel2: TPanel;
    btNovaAtividade: TBitBtn;
    btEditarAtividade: TBitBtn;
    btRemoverAtividade: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    ckAbertas: TCheckBox;
    ckConcluidas: TCheckBox;
    SB: TStatusBar;
    Timer1: TTimer;
    Label1: TLabel;
    PopupConcluir: TPopupMenu;
    ConcluirAtividade1: TMenuItem;
    NovaAtividade1: TMenuItem;
    EditarAtividade1: TMenuItem;
    RemoverAtividade1: TMenuItem;
    N1: TMenuItem;
    btConcluirAtividade: TBitBtn;
    ImageList1: TImageList;
    btFinalizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btNovaAtividadeClick(Sender: TObject);
    procedure btEditarAtividadeClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PopupConcluirPopup(Sender: TObject);
    procedure btRemoverAtividadeClick(Sender: TObject);
    procedure ckAbertasClick(Sender: TObject);
    procedure ckConcluidasClick(Sender: TObject);
    procedure btConcluirAtividadeClick(Sender: TObject);
    procedure btFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtividades: TFAtividades;

implementation

uses uFuncoesGerais, uDMDB, uNovaAtividade, uAtividadesControler,
  uEditarAtividade, uConfiguraBanco;

{$R *.dfm}

procedure TFAtividades.btNovaAtividadeClick(Sender: TObject);
begin
  inherited;
  NovaAtividade(FDMDB.dsAtividades.DataSet);
  Application.CreateForm(TFNovaAtividade, FNovaAtividade);
  FNovaAtividade.ShowModal;
  FNovaAtividade.Destroy;
end;

procedure TFAtividades.btEditarAtividadeClick(Sender: TObject);
begin
  inherited;
  if EditarAtividade(FDMDB.dsAtividades.DataSet) then
  begin
    Application.CreateForm(TFEditarAtividade, FEditarAtividade);
    FEditarAtividade.ShowModal;
    FEditarAtividade.Destroy;
  end;
end;

procedure TFAtividades.btRemoverAtividadeClick(Sender: TObject);
begin
  inherited;
  RemoverAtividade(FDMDB.dsAtividades.DataSet);
end;

procedure TFAtividades.btFinalizarClick(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TFAtividades.btConcluirAtividadeClick(Sender: TObject);
begin
  inherited;
  ConcluirAtividade(FDMDB.dsAtividades.DataSet);
end;

procedure TFAtividades.ckAbertasClick(Sender: TObject);
begin
  inherited;
  FiltrarAtividades(FDMDB.qyAtividades, ckAbertas.Checked,
    ckConcluidas.Checked);
end;

procedure TFAtividades.ckConcluidasClick(Sender: TObject);
begin
  inherited;
  FiltrarAtividades(FDMDB.qyAtividades, ckAbertas.Checked,
    ckConcluidas.Checked);
end;

procedure TFAtividades.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (FDMDB.qyAtividades.FieldByName('STATUS').AsString = 'A') then
  begin
    DBGrid1.Canvas.Font.Color := clGreen; // coloque aqui a cor desejada
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].field, State);
  end
  else
  begin
    DBGrid1.Canvas.Font.Color := clGray; // coloque aqui a cor desejada
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].field, State);
  end;
end;

procedure TFAtividades.FormCreate(Sender: TObject);
Var
  Config: TInifile;
  Protocolo, Banco, Usuario, Senha, Host: string;
begin
  inherited;
  SB.Panels[0].Text := DateToStr(Date) + ' - ' + DiadaSemana(Date);
  SB.Panels[1].Text := TimeToStr(Time);

  { Ler os Dados da Conexão com o banco do arquivo INI }
  if not FileExists(ExtractFilePath(Application.exeName) + 'DB_Connection.ini')
  then
  begin
    Application.CreateForm(TFConfiguraBanco, FConfiguraBanco);
    FConfiguraBanco.ShowModal;
    FreeAndNil(FConfiguraBanco);
  end
  else
  begin
    { Ler o arquivo INI, ler os dados }
    Config := TInifile.Create(ExtractFilePath(Application.exeName) +
      'DB_Connection.Ini');
    Banco := Config.ReadString('Banco', 'Banco', '');
    Protocolo := Config.ReadString('Protocolo', 'Protocolo', '');
    Usuario := Config.ReadString('Usuario', 'Usuario', '');
    Senha := Config.ReadString('Senha', 'Senha', '');
    Host := Config.ReadString('HostName', 'HostName', '');

    FreeAndNil(Config);

    with FDMDB do
    begin
      DB.Connected := False;
      DB.DriverName := Protocolo;
      DB.Params.Database := Banco;
      DB.Params.UserName := Usuario;
      DB.Params.Password := Senha;
      DB.Params.Add('Server=' + Host);
      DB.Connected := True;
    end;
  end;

  with FDMDB do
  begin
    if not qyTipoAtividade.Active then
      qyTipoAtividade.Active := True;
    if not qyAtividades.Active then
      qyAtividades.Active := True;
  end;
end;

procedure TFAtividades.PopupConcluirPopup(Sender: TObject);
begin
  inherited;
  if (FDMDB.qyAtividades.FieldByName('STATUS').AsString = 'A') then
    ConcluirAtividade1.Enabled := True
  else
    ConcluirAtividade1.Enabled := False;
end;

procedure TFAtividades.Timer1Timer(Sender: TObject);
begin
  inherited;
  SB.Panels[1].Text := TimeToStr(Time);
end;

end.
