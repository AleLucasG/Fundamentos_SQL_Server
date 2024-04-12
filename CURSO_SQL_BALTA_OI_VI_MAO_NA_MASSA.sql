 ----- EXECUÇÃO NO PL/SQL DEVELOPER
 
 ------------------------------------------------------
 ----------------- Iniciando o banco  -----------------
 ------------------------------------------------------
 
 -- DROP TABLE ALUNO;

-- 1º Crie a sequência
CREATE SEQUENCE ALUNO_SEQ
START WITH 1
INCREMENT BY 1;

-- 2º Crie a tabela com a coluna ID utilizando a sequência
CREATE TABLE ALUNO
(
 ID INT NOT NULL,
 NOME NVARCHAR2(120) NOT NULL,
 EMAIL NVARCHAR2(180) NOT NULL,
 DOCUMENTO NVARCHAR2(20) NULL,
 TELEFONE NVARCHAR2(20) NULL,
 ANIVERSARIO DATE,
 DATACRIACAO DATE DEFAULT SYSDATE NOT NULL,
 
 CONSTRAINT CHK_ANIVERSARIO_FORMAT CHECK (TO_CHAR(ANIVERSARIO, 'DDMMYYYY') IS NOT NULL),
 CONSTRAINT PK_ALUNO PRIMARY KEY (Id)
 );
 
-- 3º  Crie um gatilho para inserir automaticamente valores na coluna ID
CREATE OR REPLACE TRIGGER TRG_ALUNO_ID
BEFORE INSERT ON ALUNO
FOR EACH ROW
BEGIN
    SELECT ALUNO_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

SELECT * FROM ALUNO;
 
 
 ------------------------------------------------------
 ----------- Criando as tabelas - Parte 1  ------------
 ------------------------------------------------------
  
 -- DROP TABLE AUTOR;

-- 1º Crie a sequência
CREATE SEQUENCE AUTOR_SEQ
START WITH 1
INCREMENT BY 1;

-- 2º Crie a tabela com a coluna ID utilizando a sequência
CREATE TABLE AUTOR
(
 ID INT NOT NULL,
 NOME NVARCHAR2(120) NOT NULL,
 TITULO NVARCHAR2(80) NOT NULL,
 IMAGEM NVARCHAR2(1024) NOT NULL,
 BIO NVARCHAR2(2000) NOT NULL,
 URL NVARCHAR2(450) NOT NULL,
 EMAIL NVARCHAR2(180) NOT NULL,
 TIPO NUMBER NOT NULL,

 CONSTRAINT PK_AUTOR PRIMARY KEY (Id)
 );
 
-- 3º  Crie um gatilho para inserir automaticamente valores na coluna ID
CREATE OR REPLACE TRIGGER TRG_AUTOR_ID
BEFORE INSERT ON AUTOR
FOR EACH ROW
BEGIN
    SELECT AUTOR_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

SELECT * FROM AUTOR;

------

-- DROP TABLE CARREIRA;

-- 1º Crie a sequência
CREATE SEQUENCE CARREIRA_SEQ
START WITH 1
INCREMENT BY 1;

-- 2º Crie a tabela com a coluna ID utilizando a sequência
CREATE TABLE CARREIRA
(
 ID INT NOT NULL,
 TITULO NVARCHAR2(160) NOT NULL,
 SUMARIO NVARCHAR2(2000) NOT NULL,
 URL NVARCHAR2(1024) NOT NULL,
 DURACAOEMMINUTOS INT NOT NULL,
 ATIVO NUMBER NOT NULL,
 RECURSO NUMBER NOT NULL,
 TAG NVARCHAR2(160) NOT NULL,

 CONSTRAINT PK_CARREIRA PRIMARY KEY (Id)
 );
 
-- 3º  Crie um gatilho para inserir automaticamente valores na coluna ID
CREATE OR REPLACE TRIGGER TRG_CARREIRA_ID
BEFORE INSERT ON CARREIRA
FOR EACH ROW
BEGIN
    SELECT CARREIRA_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

SELECT * FROM CARREIRA;
  
  
 --Criando as tabelas - Parte 2
  
  
 --Backup e Restore
  
  
 --Listando os cursos
  
  
 --Listando as carreiras
  
  
 --Inserindo o progresso
  
  
 --Visualizando o progresso
  
  
 --Listando cursos e progressos
  
  
 --Removendo uma conta
