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
