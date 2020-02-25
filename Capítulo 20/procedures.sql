-- Created on 2/25/2020 by DIEGO 


CREATE OR REPLACE PROCEDURE aumenta_preco(pCod_Curso NUMBER)
IS
BEGIN
  UPDATE TCURSO SET VALOR = VALOR * 1.5 WHERE COD_CURSO = pCod_Curso;
END;


-- EXECUTE aumenta_preco(1);

DECLARE
   vCod INTEGER := &codigo;
BEGIN
  aumenta_preco(vCod);
END;   



-- EXEMPLO 02


CREATE OR REPLACE PROCEDURE aumenta_preco(pCod_Curso IN TCURSO.COD_CURSO%TYPE)
IS
BEGIN
  UPDATE TCURSO SET VALOR = VALOR * 1.1 WHERE COD_CURSO = pCod_Curso;
END;



EXEC aumenta_preco(1);


-- EXEMPLO 03


CREATE OR REPLACE PROCEDURE Consulta_Aluno
(pCodigo IN TALUNO.COD_ALUNO%TYPE,
 pNome   OUT TALUNO.NOME%TYPE,
 pCep    OUT TALUNO.CEP%TYPE,
 pCidade OUT TALUNO.CIDADE%TYPE)
IS
BEGIN
  SELECT  NOME, CEP, CIDADE 
  INTO pNome, pCep, pCidade
  FROM TALUNO
  WHERE COD_CURSO = pCodigo;
END;


DECLARE
  vNome VARCHAR2(30);
  vCidade VARCHAR2(30);
  vCep VARCHAR2(10);
  vCod INTEGER := &codigo;
BEGIN
  
  -- Consulta_Aluno(vCod, vNome, vCep, vCidade);

  Consulta_Aluno(pNome => vNome,
                 pCodigo => vCod,
                 pCidade => vCidade,
                 pCep => vCep);      

dbms_output.put_line(vNome);
dbms_output.put_line(vCidade);
dbms_output.put_line(vCep);                        
END;



-- EXEMPLO 04


CREATE OR REPLACE PROCEDURE Consulta_Aluno2
(pRegistro IN OUT TALUNO%ROWTYPE)
IS
  CURSOR CSQL IS 
     SELECT * FROM TALUNO WHERE cod_aluno = pRegistro.COD_ALUNO;
BEGIN
  OPEN CSQL;
  FETCH CSQL INTO pRegistro;
  CLOSE CSQL;
END; 

DECLARE
  registro TALUNO%ROWTYPE;
BEGIN
  REGISTRO.COD_ALUNO := 1;
  Consulta_Aluno2(REGISTRO);
  dbms_output.put_line('Nome: ' || REGISTRO.Nome);
  dbms_output.put_line('Cidade: ' || REGISTRO.Cidade || ' CEP: ' || REGISTRO.Cep);
END;  
    
  
-- EXEMPLO 05

CREATE OR REPLACE PROCEDURE formata_numero
(pTelefone IN OUT VARCHAR2)
IS
BEGIN
  pTelefone := SUBSTR(pTelefone, 1, 4) || '-' || SUBSTR(pTelefone, 5, 4);
END;


DECLARE
  vTelefone VARCHAR2(20);
BEGIN
  vTelefone := '00003333';
  formata_numero(vTelefone);
  dbms_output.put_line(vTelefone);
END;  











