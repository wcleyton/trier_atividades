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
  semana: array [1 .. 7] of string = ('Domingo', 'Segunda-feira', 'Terça-feira',
    'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado');
begin
  Result := semana[DayOfWeek(Data)];
end;

Function pergunta(mensagem: string): boolean;
begin
  Result := (application.messagebox(pchar(mensagem), pchar('confirmação'),
    mb_yesno) = idyes); // esta função é para perguntar para o usuario.
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
