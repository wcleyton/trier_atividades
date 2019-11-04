unit uDMDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TFDMDB = class(TDataModule)
    DB: TFDConnection;
    qyTipoAtividade: TFDQuery;
    qyAtividades: TFDQuery;
    dsTipoAtividade: TDataSource;
    dsAtividades: TDataSource;
    qyTipoAtividadeID_TIPO: TIntegerField;
    qyTipoAtividadeDESCRICAO: TWideStringField;
    qyAtividadesID_ATIVIDADE: TIntegerField;
    qyAtividadesTITULO: TWideStringField;
    qyAtividadesDESCRICAO: TWideStringField;
    qyAtividadesTIPO: TIntegerField;
    qyAtividadesSTATUS: TWideStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qyAtividadesTipoDescricao: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDMDB: TFDMDB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
