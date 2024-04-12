 ----- EXECUÇÃO NO PL/SQL DEVELOPER
 
 
 --Iniciando o banco
 
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
 
 
  --Criando as tabelas - Parte 1
  
  
  --Criando as tabelas - Parte 2
  
  
  --Backup e Restore
  
  
  --Listando os cursos
  
  
  --Listando as carreiras
  
  
  --Inserindo o progresso
  
  
  --Visualizando o progresso
  
  
  --Listando cursos e progressos
  
  
  --Removendo uma conta
