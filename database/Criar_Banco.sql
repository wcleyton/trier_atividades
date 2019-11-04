CREATE TABLE "TIPO_ATIVIDADE" (
	"ID_TIPO" serial PRIMARY KEY, 
	"DESCRICAO" varchar(50)
);

INSERT INTO "TIPO_ATIVIDADE" ("DESCRICAO") VALUES ('Desenvolvimento');
INSERT INTO "TIPO_ATIVIDADE" ("DESCRICAO") VALUES ('Atendimento');
INSERT INTO "TIPO_ATIVIDADE" ("DESCRICAO") VALUES ('Manutenção');
INSERT INTO "TIPO_ATIVIDADE" ("DESCRICAO") VALUES ('Manutenção Urgente');

CREATE TABLE "ATIVIDADES" (
	"ID_ATIVIDADE" serial PRIMARY KEY, 
	"TITULO" varchar(100) NOT NULL, 
	"DESCRICAO" varchar(254) NOT NULL, 
	"TIPO" integer, 
	"STATUS" char(1) CHECK ("STATUS" IN ('A','C')),
	
	FOREIGN KEY ("TIPO")
		REFERENCES "TIPO_ATIVIDADE" ("ID_TIPO")
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Desenvolvimento','Teste Desenvolvimento',1,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Atendimento','Teste Atendimento',2,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção','Teste manutenção',3,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção Urgente','Teste manutenção Urgente',4,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Desenvolvimento','Teste Desenvolvimento',1,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Atendimento','Teste Atendimento',2,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção','Teste manutenção',3,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção Urgente','Teste manutenção Urgente',4,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Desenvolvimento','Teste Desenvolvimento',1,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Atendimento','Teste Atendimento',2,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção','Teste manutenção',3,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção Urgente','Teste manutenção Urgente',4,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Desenvolvimento','Teste Desenvolvimento',1,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Atendimento','Teste Atendimento',2,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção','Teste manutenção',3,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção Urgente','Teste manutenção Urgente',4,'A');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Desenvolvimento','Teste Desenvolvimento',1,'C');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Atendimento','Teste Atendimento',2,'C');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção','Teste manutenção',3,'C');
INSERT INTO "ATIVIDADES" ("TITULO","DESCRICAO","TIPO","STATUS") VALUES ('Atv Manutenção Urgente','Teste manutenção Urgente',4,'C');

-- SELECT * FROM "TIPO_ATIVIDADE";
-- SELECT * FROM "ATIVIDADES";

commit;