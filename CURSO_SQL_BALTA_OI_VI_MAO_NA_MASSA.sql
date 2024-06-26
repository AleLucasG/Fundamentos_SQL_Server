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
 TIPO NUMBER NOT NULL,						--TINYINT

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

--------------------------
--------------------------

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
 ATIVO INT NOT NULL,						--BIT	
 RECURSO INT NOT NULL,						--BIT
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

--------------------------
--------------------------

-- DROP TABLE CATEGORIA;

-- 1º Crie a sequência
CREATE SEQUENCE CATEGORIA_SEQ
START WITH 1
INCREMENT BY 1;

-- 2º Crie a tabela com a coluna ID utilizando a sequência
CREATE TABLE CATEGORIA
(
 ID INT NOT NULL,
 TITULO NVARCHAR2(160) NOT NULL,
 URL NVARCHAR2(1024) NOT NULL,
 SUMARIO NVARCHAR2(2000) NOT NULL,
 ORDEM INT NOT NULL,
 DESCRICAO VARCHAR2(1200) NOT NULL,
 RECURSO INT NOT NULL,						--BIT

 CONSTRAINT PK_CATEGORIA PRIMARY KEY (Id)
 );
 
-- 3º  Crie um gatilho para inserir automaticamente valores na coluna ID
CREATE OR REPLACE TRIGGER TRG_CATEGORIA_ID
BEFORE INSERT ON CATEGORIA
FOR EACH ROW
BEGIN
    SELECT CATEGORIA_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

SELECT * FROM CATEGORIA;

--------------------------
--------------------------

-- DROP TABLE CURSO;

-- 1º Crie a sequência
CREATE SEQUENCE CURSO_SEQ
START WITH 1
INCREMENT BY 1;

-- 2º Crie a tabela com a coluna ID utilizando a sequência
CREATE TABLE CURSO
(
 ID INT NOT NULL,
 TAG NVARCHAR2(20) NOT NULL,
 TITULO NVARCHAR2(160) NOT NULL,
 SUMARIO NVARCHAR2(2000) NOT NULL,
 URL NVARCHAR2(1024) NOT NULL,
 NIVEL NUMBER NOT NULL,      --TINYINT
 DURACAOEMMINUTOS INT NOT NULL,
 DATACRIACAO DATE DEFAULT SYSDATE NOT NULL,
 ULTIMAATUALIZAODATA DATE DEFAULT SYSDATE NOT NULL,
 ATIVO INT NOT NULL,      --BIT
 GRATUITO INT NOT NULL,      --BIT
 RECURSO INT NOT NULL,      --BIT
 IDAUTOR NUMBER NULL,      --UNIQUEIDENTIFIED
 IDCATEGORIA NUMBER NULL,    --UNIQUEIDENTIFIED
 TAGS NVARCHAR2(160) NOT NULL,

 CONSTRAINT PK_CURSO PRIMARY KEY (Id),
 CONSTRAINT FK_CURSO_AUTOR_AUTORID FOREIGN KEY (IDAUTOR) REFERENCES AUTOR(Id),
 CONSTRAINT FK_CURSO_CATEGORIA_CATEGORIAID FOREIGN KEY (IDCATEGORIA) REFERENCES CATEGORIA(Id)

 );
 
 
-- 3º  Crie um gatilho para inserir automaticamente valores na coluna ID
CREATE OR REPLACE TRIGGER TRG_CURSO_ID
BEFORE INSERT ON CURSO
FOR EACH ROW
BEGIN
    SELECT CURSO_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

SELECT * FROM CURSO;

------------------------------------------------------
----------- Criando as tabelas - Parte 2  ------------
------------------------------------------------------
 
 -- DROP TABLE ITEMCARREIRA;

-- 1º Crie a sequência
CREATE SEQUENCE ITEMCARREIRA_SEQ
START WITH 1
INCREMENT BY 1;

-- 2º Crie a tabela com a coluna ID utilizando a sequência
CREATE TABLE ITEMCARREIRA
(
 IDCARREIRA INT NOT NULL,
 IDCURSO INT NOT NULL,          --UNIQUEIDENTIFIED
 TITULO NVARCHAR2(160) NOT NULL,
 DESCRICAO VARCHAR2(1200) NOT NULL,
 ORDEM NUMBER NOT NULL,          --TINYINT
 
 CONSTRAINT PK_ITEMCARREIRA PRIMARY KEY (IDCARREIRA, IDCURSO),
 CONSTRAINT FK_ITEMCARREIRA_CARREIRA FOREIGN KEY (IDCARREIRA) REFERENCES CARREIRA(Id),
 CONSTRAINT FK_ITEMCARREIRA_CURSO_CURSOID FOREIGN KEY (IDCURSO) REFERENCES CURSO(Id)
 );
 
-- 3º  Crie um gatilho para inserir automaticamente valores na coluna ID
CREATE OR REPLACE TRIGGER TRG_ITEMCARREIRA_ID
BEFORE INSERT ON ITEMCARREIRA
FOR EACH ROW
BEGIN
    SELECT ITEMCARREIRA_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

SELECT * FROM ITEMCARREIRA;

--------------------------
--------------------------

-- DROP TABLE CURSOESTUDANTE;

-- 1º Crie a sequência
CREATE SEQUENCE CURSOESTUDANTE_SEQ
START WITH 1
INCREMENT BY 1;

-- 2º Crie a tabela com a coluna ID utilizando a sequência
CREATE TABLE CURSOESTUDANTE
(
 IDCURSO INT NOT NULL,
 IDALUNO INT NOT NULL,
 PROGRESSO NUMBER NOT NULL,          --TINYINT
 FAVORITO INT NOT NULL,				 --BIT
 IDESTUDANTE NUMBER NOT NULL,
 INICIODATA DATE NOT NULL,
 ULTIMAATUALIZACAO VARCHAR2(1200) NOT NULL,
 
 CONSTRAINT PK_CURSOESTUDANTE PRIMARY KEY (IDCURSO, IDALUNO),
 CONSTRAINT FK_CURSOESTUDANTE_CURSO_CURSOID FOREIGN KEY (IDCURSO) REFERENCES CURSO(Id),
 CONSTRAINT FK_CURSOESTUDANTE_ALUNO_ALUNOID FOREIGN KEY (IDALUNO) REFERENCES ALUNO(Id)
 );
 
-- 3º  Crie um gatilho para inserir automaticamente valores na coluna ID
CREATE OR REPLACE TRIGGER TRG_CURSOESTUDANTE_ID
BEFORE INSERT ON CURSOESTUDANTE
FOR EACH ROW
BEGIN
    SELECT CURSOESTUDANTE_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/

SELECT * FROM CURSOESTUDANTE;
  
  
------------------------------------------------------
------------------ Backup e Restore ------------------
------------------------------------------------------   

 
INSERT INTO CATEGORIA(NOME) VALUES('Backend')
INSERT INTO CATEGORIA(NOME) VALUES('Frontend')
INSERT INTO CATEGORIA(NOME) VALUES('Mobile')

INSERT INTO CURSO(NOME, CATEGORIAID) VALUES('Fundamentos de C#', 1)
INSERT INTO CURSO(NOME, CATEGORIAID) VALUES('Fundamentos OOP', 1)
INSERT INTO CURSO(NOME, CATEGORIAID) VALUES('Angular', 2)
INSERT INTO CURSO(NOME, CATEGORIAID) VALUES('Flutter', 3)

...  
  
------------------------------------------------------
----------------- Listando os cursos -----------------
------------------------------------------------------ 
  
CREATE VIEW VW_CURSOS AS
 SELECT 
		A.ID,
		A.TAG,
		A.TITULO,
		A.URL,
		A.DATACRIACAO,
		A.SUMARIO,
		B.TITULO AS CATEGORIA,
		C.NAME AS AUTOR
   FROM
		CURSO A
INNER JOIN 
		CATEGORIA B ON A.ID = B.ID
INNER JOIN 
		AUTOR C ON A.ID = C.ID
  WHERE
		ATIVIDADE = 1;
		
		
		
SELECT * FROM VW_CURSOS ORDER BY DATACRIACAO;
		
		
-------------------------------------------------------
---------------- Listando as carreiras ----------------
------------------------------------------------------- 		
 
 
CREATE VIEW VW_CARREIRAS AS
 SELECT
		A.ID,
		A.TITULO,
		A.URL,
		COUNT(ID) AS CURSOS
  FROM
		CARREIRA A
INNER JOIN ITEM_CARREIRA B ON B.IDCARREIRA = A.ID
GROUP BY 
		A.ID,
		A.TITULO,
		A.URL;
  
SELECT * FROM VW_CARREIRAS ORDER BY DATACRIACAO;  
  
 
-------------------------------------------------------
---------------- Inserindo o progresso ----------------
------------------------------------------------------- 	
  
 
INSERT INTO ESTUDANTE VALUES ('79b82071-80a8-4e78-a79c-92c8cd1fd052','André Baltieri','hello@balta.io','12345678901','12345678', NULL, NOW())
INSERT INTO ESTUDANTE VALUES ('c55390d4-71dd-4f3c-b978-d1582f51a327','André Baltieri','hello@balta.io','12345678901','11999999999', NULL, NOW())

INSERT INTO CURSOESTUDANTE VALUES ('5f5a33f8-4ff3-7e10-cc6e-3fa000000000','79b82071-80a8-4e78-a79c-92c8cd1fd052',50,0,'2020-01-13 12:35:54', NOW())
INSERT INTO CURSOESTUDANTE VALUES ('5d8cf396-e717-9a02-2443-021b00000000','c55390d4-71dd-4f3c-b978-d1582f51a327',50,0,'2021-01-15 12:35:54', NOW())
  
  
-------------------------------------------------------
-------------- Visualizando o progresso ---------------
------------------------------------------------------- 	 

 
CREATE VIEW VW_CURSOESTUDANTE AS 
SELECT 
		B.NOME AS ALUNO,
		C.TITULO AS CURSO,
		A.PROGRESSO,
		A.ULTIMAATUALIZACAO
  FROM 
		CURSOESTUDANTE A
INNER JOIN ALUNO B A.IDALUNO = B.ID
INNER JOIN CURSO C A.IDALUNO = C.ID
WHERE
		A.IDALUNO = '79b82071-80a8-4e78-a79c-92c8cd1fd052'
    AND	A.PROGRESSO < 100
    AND A.PROGRESSO > 0;
	
	
SELECT * FROM VW_CURSOESTUDANTE ORDER BY DATACRIACAO;  
	
	
-------------------------------------------------------
------------- Listando cursos e progressos ------------
------------------------------------------------------- 	
	
 
 SELECT 
 		A.TITULO AS CURSO,
		C.NOME AS ALUNO,
		B.PROGRESSO,
		B.ULTIMAATUALIZACAO
  FROM 
		CURSO A
LEFT JOIN CURSOESTUDANTE B A.IDCURSO= A.ID
LEFT JOIN ALUNO C B.IDCURSO = C.ID;
  

-------------------------------------------------------
----------------- Removendo uma conta -----------------
------------------------------------------------------- 	

-- CRIAR UMA PROCEDURE

SELECT 
		B.NOME AS ALUNO,
		C.TITULO AS CURSO,
		A.PROGRESSO,
		A.ULTIMAATUALIZACAO
  FROM 
		CURSOESTUDANTE A
INNER JOIN ALUNO B A.IDALUNO = B.ID
INNER JOIN CURSO C A.IDALUNO = C.ID
WHERE
		A.IDALUNO = '79b82071-80a8-4e78-a79c-92c8cd1fd052'
    AND	A.PROGRESSO < 100
    AND A.PROGRESSO > 0
ORDER BY 
		A.A.ULTIMAATUALIZACAO;
	


-------------------------------------------------------
------- PARABÉNS!!! VOCÊ CONCLUIU O CURSO (  ) --------
------------------------------------------------------- 	