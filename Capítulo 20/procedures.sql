

CREATE OR REPLACE PROCEDURE aumenta_preco
(pCod_Curso NUMBER)
IS
BEGIN
  UPDATE TCURSO 
  SET VALOR = VALOR * 1.5 
  WHERE COD_CURSO = pCod_Curso;
END;

EXEC aumenta_preco(2);
EXECUTE aumenta_preco(2);


DECLARE
   vCod INTEGER := &codigo;
BEGIN
  aumenta_preco(vCod);
END;        


-- EXEMPLO 2 


CREATE OR REPLACE PROCEDURE AUMENTA_PRECO
(pCodigo IN TCURSO.COD_CURSO%TYPE)
IS
BEGIN
  UPDATE TCURSO 
  SET VALOR = VALOR * 1.1 
  WHERE COD_CURSO = pCodigo;
END;

EXEC AUMENTA_PRECO(7);


-- EXEMPLO 3

CREATE OR REPLACE PROCEDURE CONSULTA_ALUNO
 (pCodigo IN TALUNO.COD_ALUNO%TYPE,
  pNome   OUT TALUNO.NOME%TYPE,
  pCep    OUT TALUNO.CEP%TYPE,
  pCidade OUT TALUNO.CIDADE%TYPE)
IS
BEGIN
  SELECT nome, cep, cidade 
  INTO pNome, pCep, pCidade 
  FROM TALUNO 
  WHERE Cod_aluno = pCodigo;
END; 

 
DECLARE 
 vNome VARCHAR2(30),
 vCidade VARCHAR2(30),
 vCep VARCHAR2(10),
 vCod INTEGER := &codigo;
BEGIN
  
  CONSULTA_ALUNO(pNome => vNome,
                 pCodigo => vCod,  
                 pCidade => vCidade,    
                 pCep => vCep);
                 

  DBMS_OUTPUT.put_line('Nome: ' || vNome);
  DBMS_OUTPUT.put_line('Cidade: ' || vCidade);
  DBMS_OUTPUT.put_line('Cep: : ' || vCep);
END; 


-- EXEMPLO 4


 
