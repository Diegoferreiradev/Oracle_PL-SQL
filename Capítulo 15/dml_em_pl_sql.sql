

DECLARE 
  vValor number(8,2);
  vNome varchar2(30);
BEGIN
  SELECT valor, nome
  INTO  vValor, vNome
  FROM TCURSO
  WHERE cod_curso = &cod_curso;
  
  dbms_output.put_line('Valor: ' || to_char(vValor, 'fm9999.99'));
  
  dbms_output.put_line('Curso: ' || initcap(vNome)); 
  
END;  


SELECT * FROM TCURSO;


-- EXEMPLO 02 --


DECLARE
 vDt_Compra tcontrato.data%TYPE;
 vDt_Curso  tcontrato.data%TYPE;
BEGIN
  SELECT data, data + 10
  INTO vDt_Compra, vDt_Curso
  FROM tcontrato
  WHERE cod_contrato = &cod_contrato;
  
  dbms_output.put_line('Data da Compra: ' || vDt_Compra);
  dbms_output.put_line('Data do Curso: ' || vDt_Curso);
 
END; 


SELECT * FROM TCONTRATO; 

-- EXEMPLO 03

SELECT MAX(COD_CONTRATO) FROM TCONTRATO;
CREATE SEQUENCE SEQ_CONTRATO START WITH 9;


DECLARE
 vCod tcontrato.cod_contrato%TYPE;
 
BEGIN
  SELECT SEQ_CONTRATO.NEXTVAL
  INTO vCod FROM Dual;
  
  INSERT INTO TCONTRATO(COD_CONTRATO, DATA, COD_ALUNO, DESCONTO)
  VALUES (vCod, sysdate, 2, null);
  
  dbms_output.put_line('Contrato Criado: ' || vCod);

END; 

-- Pegando o valor atual

SELECT SEQ_CONTRATO.CURRVAL FROM DUAL;

SELECT * FROM TCONTRATO;


-- UPDATE 

SELECT * FROM TCURSO;

DECLARE
   vValor tcurso.valor%TYPE := &Valor; 
BEGIN
  UPDATE TCURSO SET VALOR = VALOR + vValor WHERE CARGA_HORARIA > 30 AND CARGA_HORARIA <= 40; 
END; 


-- DELETE

 SELECT * FROM TCONTRATO;

DECLARE
   vContrato tcontrato.cod_contrato%TYPE := &contrato;
BEGIN
  
   DELETE FROM TCONTRATO WHERE COD_CONTRATO = vContrato;

END;


-- UPDATE 2 

SELECT * FROM TCONTRATO;

DECLARE
   vContrato number := &cod_contrato;
   vTexto varchar2(50);
BEGIN 
   UPDATE TCONTRATO SET DESCONTO = DESCONTO + 2 WHERE COD_CONTRATO >= vContrato;
   
   vTexto := SQL%ROWCOUNT;
   dbms_output.put_line(vTexto || ' Linhas Atualizadas');
   
END;


 
 
 






