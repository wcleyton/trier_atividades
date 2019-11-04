unit uFuncoesGerais;

interface

uses Dialogs, Forms, Controls, Windows, Classes, Variants, SysUtils;

Function DiadaSemana(Data: TDate): string;
Function pergunta(mensagem: string): boolean;
Procedure mensagem(msg: string);
Function SextaFeira:boolean;
Function Apos13Horas:boolean;

implementation

Function DiadaSemana(Data: TDate): string;
const
  semana: array [1 .. 7] of string = ('Domingo', 'Segunda-feira', 'Ter�a-feira',
    'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'S�bado');
begin
  Result := semana[DayOfWeek(Data)];
end;

Function pergunta(mensagem: string): boolean;
begin
  Result := (application.messagebox(pchar(mensagem), pchar('confirma��o'),
    mb_yesno) = idyes); // esta fun��o � para perguntar para o usuario.
end;

Procedure mensagem(msg: string);
begin
 showmessage(msg);
end;

Function SextaFeira:boolean;
begin
  Result := (DayOfWeek(Date)=6);
end;

Function Apos13Horas:boolean;
begin
  Result := (Time>strToTime('13:00:00'));
end;

end.
