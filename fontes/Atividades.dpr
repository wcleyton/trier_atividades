program Atividades;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FPrincipal},
  uDMDB in 'uDMDB.pas' {FDMDB: TDataModule},
  uAtividades in 'uAtividades.pas' {FAtividades},
  uFuncoesGerais in 'uFuncoesGerais.pas',
  uNovaAtividade in 'uNovaAtividade.pas' {FNovaAtividade},
  uAtividadesControler in 'uAtividadesControler.pas',
  uEditarAtividade in 'uEditarAtividade.pas' {FEditarAtividade};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFAtividades, FAtividades);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFDMDB, FDMDB);
  Application.Run;
end.
