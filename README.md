# trier_atividades

Na pasta trunk->database existe o arquivo: Criar_Banco.sql
Esse arquivo vai criar as tabelas utilizadas pelo programa e insere alguns registros para teste.

O projeto -> Atividades.dpr contém:
uPrincipal.pas -> Formulário base que serve de Herança para todos os outros
uAtividades.pas -> Herda do uPrincipal. É a tela principal do programa
uAtividadesControler.pas -> Contém o código que faz a validaçãp das regras de negócio
uConfiguraBanco.pas -> Tela que verifica se existe o arquivo ini de configuração da conexão. Se não tiver, solicita os dados e grava no arquivo ini
uDMDB.pas -> Data Módule com os componentes FireDac responsáveis pela conexão com o banco de dados
uFuncoesGerais.pas -> Funções auxiliares
uNovaAtividade.pas -> Para cadastrar uma nova atividade
uEditarAtividade.pas  -> Herda de NovaAtividade e configurada para Editar a Atividade.

OBS: 
Utilizei o Delphi XE8 que é utilizado no CEDUP porque ganhamos uma licença educacional (então não é pirata)

Poderia ter criado uma classe Atividades e trabalhado com ela. Mais em virtude do tempo (esse final de semana teve um óbito na minha família)
fiz da maneira mais tradicional e rápida no Delphi. Mais não tenho dificuldade em criar classes com seus atributos e métodos.

Utilizei somente componentes padrão do Delphi. Mais utilizo vários: ACBR, RX, DEV Express entre outros.