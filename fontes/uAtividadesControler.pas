unit uAtividadesControler;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

function NovaAtividade(DS: TDataSet): Boolean;
function InserirAtividade(DS: TDataSet): Boolean;
function CancelarAtividade(DS: TDataSet): Boolean;
function EditarAtividade(DS: TDataSet): Boolean;
function ConcluirAtividade(DS: TDataSet): Boolean;
function RemoverAtividade(DS: TDataSet): Boolean;
function FiltrarAtividades(qy: TFDQuery; Abertas, Concluidas: Boolean): Boolean;

implementation

uses uDMDB, uFuncoesGerais;

function NovaAtividade(DS: TDataSet): Boolean;
begin
  Result := False;
  try
    DS.Append;
    DS.FieldByName('STATUS').AsString := 'A';
    Result := True;
  except
    Result := False;
  end;
end;

function InserirAtividade(DS: TDataSet): Boolean;
begin
  Result := False;
  if (DS.FieldByName('TIPO').AsInteger = 4) then
  begin
    if (SextaFeira) and (Apos13Horas) then
    begin
      mensagem('Atividade de Manutenção Urgente não pode ser criada 6a. feira após 13:00');
      Abort;
    end;
  end;

  try
    DS.Post;
    Result := True;
  except
    Result := False;
  end;
end;

function CancelarAtividade(DS: TDataSet): Boolean;
begin
  Result := False;
  try
    DS.Cancel;
    Result := True;
  except
    Result := False;
  end;
end;

function EditarAtividade(DS: TDataSet): Boolean;
begin
  Result := False;

  if (DS.FieldByName('TIPO').AsInteger = 4) then
  begin
    if (SextaFeira) and (Apos13Horas) then
    begin
      mensagem('Atividade de Manutenção Urgente não pode ser criada 6a. feira após 13:00');
      Abort;
    end;
  end;

  if (DS.FieldByName('STATUS').AsString = 'A') then
  begin
    try
      DS.Edit;
      Result := True;
    except
      Result := False;
    end;
  end
  else
    mensagem('Atividade Concluída não pode ser Editada');
end;

function ConcluirAtividade(DS: TDataSet): Boolean;
begin
  Result := False;
  if ((DS.FieldByName('TIPO').AsInteger = 2) or
    (DS.FieldByName('TIPO').AsInteger = 4)) then
  begin
    if (Length(DS.FieldByName('DESCRICAO').AsString) < 50) then
    begin
      mensagem('Atividade Atendimento e Manutenção Urgente Deve ter Mais de 50 caracteres na Descrição');
      Abort;
    end;
  end;

  try
    DS.Edit;
    DS.FieldByName('STATUS').AsString := 'C';
    DS.Post;
    Result := True;
  except
    Result := False;
  end;
end;

function RemoverAtividade(DS: TDataSet): Boolean;
begin
  Result := False;
  if (DS.FieldByName('TIPO').AsInteger = 4) then
  begin
    mensagem('Atividade Manutenção Urgente Não pode ser Removida.');
    exit;
  end
  else
  begin
    if pergunta('Confirma Exclusão?') then
    begin
      try
        DS.Delete;
        Result := True;
      except
        Result := False;
      end;
    end;
  end;
end;

function FiltrarAtividades(qy: TFDQuery; Abertas, Concluidas: Boolean): Boolean;
var
  comandoSQL: String;
begin
  comandoSQL := 'SELECT * from "ATIVIDADES"';

  if (Abertas) and (Concluidas) then
    comandoSQL := comandoSQL + ' WHERE "STATUS"=' + QuotedStr('A') +
      ' OR "STATUS"=' + QuotedStr('C')
  else if (Abertas) then
    comandoSQL := comandoSQL + ' WHERE "STATUS"=' + QuotedStr('A')
  else if (Concluidas) then
    comandoSQL := comandoSQL + ' WHERE "STATUS"=' + QuotedStr('C')
  else
    comandoSQL := '';

  Result := True;
  try
    qy.Close;
    qy.SQL.Clear;
    qy.SQL.Add(comandoSQL);
    qy.Prepare;
    qy.Open;
    Result := True;
  except
    Result := False;
  end;
end;

end.
