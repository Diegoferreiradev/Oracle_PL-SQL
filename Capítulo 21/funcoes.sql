-- Created on 2/25/2020 by DIEGO 

CREATE OR REPLACE FUNCTION CONSULTA_PRECO
(pCod_Curso NUMBER) RETURN NUMBER
AS
 vValor NUMBER;
BEGIN
  SELECT VALOR INTO vValor FROM TCURSO WHERE COD_CURSO = pCod_Curso;
  
  RETURN(vValor);
END; 


DECLARE
  vCod NUMBER := &codigo;
  vValor NUMBER;
BEGIN
  vValor := CONSULTA_PRECO(vCod);
  dbms_output.put_line('Preco do Curso: ' || vValor);
END;  


-- EXEMPLO 02


CREATE OR REPLACE FUNCTION Existe_aluno
(pCod_aluno IN TALUNO.COD_ALUNO%TYPE) RETURN BOOLEAN
IS
   vAluno NUMBER(10);
BEGIN
  SELECT COD_ALUNO INTO vAluno FROM TALUNO WHERE COD_ALUNO = pCod_aluno;
  RETURN ( TRUE );

EXCEPTION  
  WHEN others THEN
     RETURN ( FALSE );
END;   
   

DECLARE
   vCodigo INTEGER := 3;
BEGIN
  IF Existe_aluno(vCodigo) THEN
     dbms_output.put_line('Código Encontrado!');
  ELSE   
    dbms_output.put_line('Código Não Encontrado!');
  END IF;  
END;     
   

-- EXEMPLO 03


CREATE OR REPLACE PROCEDURE Cadastrar_Aluno
(pCod_aluno IN TALUNO.COD_ALUNO%TYPE,
 pNome      IN TALUNO.NOME%TYPE,
 pCidade    IN TALUNO.CIDADE%TYPE,
 pEstado    IN TALUNO.ESTADO%TYPE);
 IS
 BEGIN
   IF (NOT Existe_aluno(pCod_aluno)) THEN
      INSERT INTO TALUNO (COD_ALUNO, NOME, CIDADE, ESTADO)
      VALUES (pCod_aluno, pNome, pCidade, pEstado);
   END IF;  
 END;
 
 
 BEGIN
   Cadastrar_Aluno(seq_aluno1.Nextval, 'Mariana', 'Cuiabá', 'MT');
   dbms_output.put_line('Aluno Cadasrado Com Sucesso!');
 END;
 
 
 --DROP PROCEDURE Cadastrar_Aluno;

 
 

   
   
   
   
   
