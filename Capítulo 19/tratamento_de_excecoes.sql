-- Created on 2/23/2020 by DIEGO 

DECLARE
   vCod TALUNO.COD_ALUNO%TYPE := 566;
   vCidade TALUNO.CIDADE%TYPE;
   x NUMBER;
BEGIN
  SELECT CIDADE INTO vCidade FROM TALUNO WHERE COD_ALUNO = vCod;
    X := 0 / 0;
    dbms_output.put_line('Cidade: ' || vCidade);
    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20001, 'Aluno Inexistente! ' || SQLCODE || ' ' || SQLERRM); 
      
    WHEN TOO_MANY_ROWS THEN
      RAISE_APPLICATION_ERROR(-20002, 'Registro Duplicado! ' || SQLCODE || ' ' || SQLERRM);
      
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20003, 'Exceção Desconhecida! ' || SQLCODE || ' ' || SQLERRM);  
    
END;   


-- EXEMPLO 02


CREATE TABLE CONTAS(
  
   Codigo INTEGER NOT NULL PRIMARY KEY,
   Valor NUMBER(10, 2),
   juros NUMBER(10, 2),
   Vencimento DATE     
);

INSERT INTO CONTAS VALUES (100, 550, 50, SYSDATE - 10);

SELECT * FROM CONTAS;

COMMIT;


DECLARE
  vDt_Nascimento DATE;
  vConta NUMBER := 100;
  eConta_Vencida EXCEPTION;
BEGIN
  SELECT VENCIMENTO INTO vDt_Nascimento FROM CONTAS WHERE CODIGO = vConta;
  IF vDt_Nascimento < TRUNC(SYSDATE) THEN
    RAISE eConta_Vencida;
  END IF;  
EXCEPTION
  WHEN eConta_Vencida THEN
    dbms_output.put_line('Conta Vencida');
    UPDATE CONTAS SET VALOR = VALOR + JUROS WHERE CODIGO = vConta;
END;  
  

-- EXEMPLO 03


DECLARE
   eFK_Inexistente EXCEPTION;
   PRAGMA EXCEPTION_INIT(eFK_Inexistente, -02291);
BEGIN
  INSERT INTO TBAIRRO VALUES (100, 100, 'ERRO');
EXCEPTION
  WHEN eFK_Inexistente THEN
    RAISE_APPLICATION_ERROR(-20200, 'Cidade não Existe!');  
END;   


SELECT * FROM TBAIRRO;  

SELECT * FROM TCIDADE;    
  
  
  
  

