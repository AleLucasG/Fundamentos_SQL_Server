

--DROP TABLE TB_CURSO;

-- 1º Crie a sequência
CREATE SEQUENCE categoria_seq
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
    SELECT categoria_seq.NEXTVAL INTO :NEW.Id FROM dual;
END;
/

--4º Insert com auto incremento na coluna ID


INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Fundamentos C#', 21);
INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Fundamentos OOP', 21);
INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Angular', 22);
INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Flutter', 23);
INSERT INTO TB_CURSO (Nome, CategoriaId) VALUES ('Windows Form', 24);

       
SELECT * FROM TB_CURSO
WHERE ROWNUM <= 2;
--OU

SELECT * FROM (
    SELECT * FROM TB_CURSO ORDER BY Nome
) WHERE ROWNUM <= 2;

--OU
SELECT DISTINCT NOME FROM TB_CATEGORIA;

--OU
SELECT ID, NOME, CATEGORIAID
FROM TB_CURSO
WHERE CATEGORIAID > 21
OR ID IS NOT NULL;

