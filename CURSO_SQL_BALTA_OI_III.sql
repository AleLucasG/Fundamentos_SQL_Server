--DROP TABLE TB_CATEGORIA;

-- 1º Crie a sequência
--DROP TABLE categori_seq;

CREATE SEQUENCE categori_seq
START WITH 1
INCREMENT BY 1;

-- 2º Crie a tabela com a coluna ID utilizando a sequência
CREATE TABLE TB_CATEGORIA(
       Id INT NOT NULL,
       Nome VARCHAR2(60) NOT NULL,
       
       CONSTRAINT PK_CATEGORIA PRIMARY KEY (Id)
);
 

-- 3º  Crie um gatilho para inserir automaticamente valores na coluna ID
CREATE OR REPLACE TRIGGER tb_categori_trigger
BEFORE INSERT ON TB_CATEGORIA
FOR EACH ROW
BEGIN
    SELECT categori_seq.NEXTVAL INTO :NEW.Id FROM dual;
END;
/

--4º Insert com auto incremento na coluna ID

INSERT INTO TB_CATEGORIA (Nome) VALUES ('BackEnd');
INSERT INTO TB_CATEGORIA (Nome) VALUES ('FrontEnd');
INSERT INTO TB_CATEGORIA (Nome) VALUES ('Mobile');

SELECT * FROM TB_CATEGORIA;

--------------------------------------------------------------------

--DROP TABLE TB_CURSO;

-- 1º Crie a sequência
-- DROP TABLE curso_seq;
CREATE SEQUENCE curso_seq
START WITH 1
INCREMENT BY 1;

-- 2º Crie a tabela com a coluna ID utilizando a sequência
CREATE TABLE TB_CURSO(
       Id INT NOT NULL,
       Nome VARCHAR2(60) NOT NULL,
       CategoriaId INT NOT NULL,
       
       CONSTRAINT PK_CURSO PRIMARY KEY (Id),
       CONSTRAINT FK_CURSO_CATEGORIA FOREIGN KEY (CategoriaId) REFERENCES TB_CATEGORIA(Id));
);

-- 3º  Crie um gatilho para inserir automaticamente valores na coluna ID
CREATE OR REPLACE TRIGGER tb_curso_trigger
BEFORE INSERT ON TB_CURSO
FOR EACH ROW
BEGIN
    SELECT curso_seq.NEXTVAL INTO :NEW.Id FROM dual;
END;
/

--4º Insert com auto incremento na coluna ID

INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Fundamentos C#', 1);
INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Fundamentos OOP', 1);
INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Angular', 2);
INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Flutter', 3);
INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Flutter e SQLIte', 3);


SELECT * FROM TB_CURSO;

--------------------------------------------------------------------

BEGIN TRANSACTION
  UPDATE 
      TB_CATEGORIA 
  SET 
      NOME = 'BackEnd'
  WHERE
      Id = 1
COMMIT;
--------------------------------------------------------------------

DELETE FROM
    TB_CURSO
WHERE
     CategoriaId = 3

DELETE FROM
    TB_CATEGORIA 
WHERE
     Id = 3
	 
--------------------------------------------------------------------

SELECT * FROM TB_STOP4_BANS_21;

-- 11385  **EVITAR DE USAR O COUNT COM ASTERISCO
SELECT COUNT(*) FROM TB_STOP4_BANS_21;

-- 11385
SELECT COUNT(BAN) FROM TB_STOP4_BANS_21;

-- 911,16
SELECT MAX(NF_TOTAL_AMT) FROM TB_STOP4_BANS_21;

-- 0,02
SELECT MIN(NF_TOTAL_AMT) FROM TB_STOP4_BANS_21;

--476.667,46
SELECT SUM(NF_TOTAL_AMT) FROM TB_STOP4_BANS_21;

--476.667,46 / 11385 = 41,8687272727273
SELECT AVG(NF_TOTAL_AMT) FROM TB_STOP4_BANS_21;

--------------------------------------------------------------------

-- LIKE 'inválido%' = COMEÇA COM INVALIDO
-- LIKE '%inválido' = TERMINA COM INVALIDO
-- LIKE '%inválido%' = COMTEM A PALAVRA INVALIDO

SELECT * FROM TB_CEP_INVALIDO_REF
WHERE INFO LIKE '%inválido%';

--222432
SELECT COUNT(INFO) FROM TB_CEP_INVALIDO_REF
WHERE INFO LIKE '%inválido%';

--------------------------------------------------------------------
--VERIFICA SE O VALOR ESTA PRESENTE NA LISTA (ARRAY)

SELECT * FROM  TB_STOP4_BANS_21
WHERE BILL_SEQ_NO IN(28, 42);

--VERIFICA VALORES ENTRE X E Y.
SELECT * FROM  TB_STOP4_BANS_21
WHERE BILL_SEQ_NO BETWEEN 31 AND 42;

SELECT * FROM  TB_STOP4_BANS_21
WHERE CYCLE_RUN_YEAR BETWEEN '2024-04-01' AND '2024-04-09';

SELECT * FROM  TB_STOP4_BANS_21
WHERE CYCLE_RUN_YEAR BETWEEN '2024-04-01 00:00:00' AND '2024-04-09 00:00:00';


--------------------------------------------------------------------
--ALIAS (AS)

SELECT BAN,
       OVERDUE_AMT AS VALORES,
       NF_TOTAL_AMT AS VALOR_MES,
       BILL_SEQ_NO AS RESULTADO,
       CYCLE_RUN_YEAR AS ANO,
       CYCLE_RUN_MONTH AS CICLO_MES
FROM  TB_STOP4_BANS_21;

--------------------------------------------------------------------
-- CRIANDO UMA VIEW A PARTIR DO SELECT FEITO NA TABELA TB_STOP4_BANS_16


DROP VIEW TB_STOP4_BANS_16_X;

CREATE VIEW TB_STOP4_BANS_16_X AS
  SELECT BAN,
         CYCLE_CODE,
         NF_ID,
         NF_TOTAL_AMT
    FROM TB_STOP4_BANS_16
GROUP BY BAN,
         CYCLE_CODE,
         NF_TOTAL_AMT,
         NF_ID
HAVING COUNT(NF_ID) > 1;

SELECT * FROM TB_STOP4_BANS_16_X
WHERE CYCLE_CODE > 16;

--------------------------------------------------------------------


DROP PROCEDURE TESTE_PROCEDURE;

CREATE OR REPLACE PROCEDURE TESTE_PROCEDURE AS
SELECT * FROM TB_CEP_INVALIDO_1_22;