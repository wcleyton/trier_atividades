unit uConfiguraBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFConfiguraBanco = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btTestar: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    cbProtocolo: TComboBox;
    edBanco: TEdit;
    edUsuario: TEdit;
    edSenha: TEdit;
    edHostName: TEdit;
    procedure btGravarClick(Sender: TObject);
    procedure btTestarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfiguraBanco: TFConfiguraBanco;

implementation

uses inifiles, uDMDB, uFuncoesGerais;

{$R *.dfm}

procedure TFConfiguraBanco.btCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFConfiguraBanco.btGravarClick(Sender: TObject);
var
  Config: TInifile;
begin
  { Se nao existir o arquivo, gravar os dados }
  Config := TInifile.Create(ExtractFilePath(Application.exeName) +
    'DB_Connection.Ini');
  Config.WriteString('Protocolo', 'Protocolo', cbProtocolo.Text);
  Config.WriteString('Banco', 'Banco', edBanco.Text);
  Config.WriteString('Usuario', 'Usuario', edUsuario.Text);
  Config.WriteString('Senha', 'Senha', edSenha.Text);
  Config.WriteString('HostName', 'HostName', edHostName.Text);
  Config.UpdateFile;
  Close;
end;

procedure TFConfiguraBanco.btTestarClick(Sender: TObject);
begin
  Try
    with FDMDB do
    begin
      DB.Connected := False;
      DB.DriverName := cbProtocolo.Text;
      DB.Params.Database := edBanco.Text;
      DB.Params.UserName := edUsuario.Text;
      DB.Params.Password := edSenha.Text;
      DB.Params.Add('Server=' + edHostName.Text);
      DB.Connected := True;
      mensagem('Conectado com Sucesso! Clique no Botão Gravar para Salvar as Configurações.');
      btGravar.Enabled := True;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro:' + E.Message +
        ' Verifique os parâmetros e tente novamente');
      btGravar.Enabled := False;
      edUsuario.SetFocus;
    end;
  end;
end;

end.
