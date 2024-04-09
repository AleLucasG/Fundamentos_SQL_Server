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


SELECT * FROM TB_CURSO;