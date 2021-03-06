-- Created on 3/14/2020 by DIEGO 


CREATE OR REPLACE VIEW V_ALUNO
AS
  SELECT COD_ALUNO AS CODIGO, SALARIO, NOME AS ALUNO, CIDADE
  FROM TALUNO 
  WHERE CIDADE = 'Recife';
  

SELECT * FROM TALUNO;  

SELECT * FROM V_ALUNO ORDER BY ALUNO DESC;


-------------------------------------------------------

CREATE OR REPLACE VIEW V_CONTRATO_TOP
AS
  SELECT COD_CONTRATO, DESCONTO
  FROM TCONTRATO
  WHERE COD_CONTRATO > 10;
 

SELECT * FROM TCONTRATO;

SELECT * FROM V_CONTRATO_TOP;


--------------------------------------------------------

-- VIEWS EXISTENTES

SELECT VIEW_NAME, TEXT FROM USER_VIEWS;


CREATE OR REPLACE VIEW V_ALUNO2 (COD, ALUNO, SALARIO)
AS
  SELECT COD_ALUNO, NOME, SALARIO 
  FROM TALUNO;
  
  
SELECT * FROM V_ALUNO2;  
  
--------------------------------------------------------------


CREATE OR REPLACE VIEW V_CONTRATO
AS
  SELECT TRUNC(DATA) AS DATA,
         MAX(DESCONTO) MAXIMO,
         AVG(DESCONTO) MEDIA,
         COUNT(*) QTDE
  FROM TCONTRATO
  GROUP BY TRUNC(DATA);       


SELECT * FROM V_CONTRATO; 
  
--------------------------------------------------------------  

CREATE OR REPLACE VIEW V_PESSOA_F
AS
  SELECT COD_PESSOA, TIPO, NOME, COD_RUA AS RUA
  FROM TPESSOA
  WHERE TIPO = 'F';
  

SELECT * FROM V_PESSOA_F;


---------------------------------------------------------------
-- CONSULTA COM VIEW E TABELA

SELECT PES.COD_PESSOA AS CODIGO, 
       PES.NOME AS PESSOA, 
       CID.NOME AS CIDADE, 
       RUA.NOME AS RUA 
FROM V_PESSOA_F PES, TRUA RUA, TCIDADE CID
WHERE PES.RUA = RUA.COD_RUA (+)
AND CID.COD_CIDADE = RUA.COD_CIDADE
ORDER BY PES.NOME; 


-----------------------------------------------------------------


CREATE OR REPLACE VIEW V_CURSOS_1000_CK
AS
  SELECT COD_CURSO, NOME, VALOR
  FROM TCURSO
  WHERE VALOR = 1000
  WITH CHECK OPTION CONSTRAINT vcursos1000_ck;


INSERT INTO V_CURSOS_1000_CK (COD_CURSO, NOME, VALOR) 
VALUES (55, 'TESTESN', 999);


SELECT * FROM TCURSO;

---------------------------------------------------------------------


SELECT * FROM V_ALUNO;

DELETE FROM V_ALUNO WHERE CODIGO = 2; 

INSERT INTO V_ALUNO VALUES (50, 500, 'MARINA', 'NH');

DELETE FROM V_CONTRATO;  -- ERRO / VIEW COMPLEXA


-----------------------------------------------------------------------

CREATE OR REPLACE VIEW V_ALUNO3
AS
  SELECT COD_ALUNO CODIGO, 
         NOME ALUNO, 
         CIDADE 
  FROM TALUNO 
  WHERE CIDADE = 'Recife' 
  WITH READ ONLY;


SELECT * FROM V_ALUNO3;

DELETE FROM V_ALUNO3; -- N�O � PERMITIDO DELETAR VIEW DE LEITURA.

DROP VIEW V_ALUNO3;






