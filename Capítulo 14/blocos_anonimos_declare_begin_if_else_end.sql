-- Created on 2/16/2020 by DIEGO 


DECLARE
    X INTEGER;
    Y INTEGER;
    C INTEGER;
BEGIN

    X := 10;
    Y := 20;
    C := X + Y;
    
    DBMS_OUTPUT.put_line(C);
    
   
END;




DECLARE
    VDESCONTO NUMBER(6,2) := 0.50;
    VCIDADE VARCHAR(30) := 'NOVO HAMBURGO';
    VCOD_ALUNO TALUNO.COD_ALUNO%TYPE := 5;
    VTOTAL NUMBER(8,2) := 1345.89;
BEGIN
    VTOTAL := ROUND(VTOTAL * VDESCONTO, 2);
    DBMS_OUTPUT.PUT_LINE('TOTAL: ' || VTOTAL);
    VDESCONTO := 1.20;
    vCIDADE := INITCAP(VCIDADE);
    DBMS_OUTPUT.PUT_LINE('CIDADE: ' || vCIDADE);
    DBMS_OUTPUT.PUT_LINE('DESCONTO: ' || VDESCONTO);
    DBMS_OUTPUT.PUT_LINE('ALUNO: ' || VCOD_ALUNO);
    
END;




SELECT * FROM TCURSO;
SELECT * FROM TALUNO;


DECLARE

 vPreco1 number(8,2)   := 10;
 vPreco2 number(8,2)   := 20;
 vFlag boolean;
 
BEGIN
  vFlag := (vPreco1 > vPreco2);
  IF (vFlag = true) THEN
    dbms_output.put_line('Verdadeiro');
  ELSE
    dbms_output.put_line('Falso'); 
  END IF;
  IF (vPreco1 > vPreco2) THEN 
     dbms_output.put_line('vPreco1 é Maior'); 
  ELSE
    dbms_output.put_line('vPreco2 é Maior'); 
  END IF;     

END; 


-- BIND VARIABLE ---

VARIABLE vDESCONTO2 NUMBER

DECLARE
  VCOD_ALUNO NUMBER := 1;
BEGIN
  :vDESCONTO2 := 0.90;
  DBMS_OUTPUT.put_line('DESCONTO 2: ' || :vDESCONTO2);
  
  UPDATE TCONTRATO SET TOTAL = TOTAL * :vDESCONTO2 WHERE COD_ALUNO = VCOD_ALUNO;
END;


SELECT * FROM TCONTRATO;    

-- ALINHAMENTO --

DECLARE
   VTESTE VARCHAR2(10) := 'MARIA';
BEGIN
  
   DECLARE
     VTESTE VARCHAR2(10) := 'JOÃO';  
   BEGIN
     DBMS_OUTPUT.put_line('BLOCO INTERNO: ' || VTESTE);  
   END;
   
DBMS_OUTPUT.put_line('BLOCO EXTERNO: ' || VTESTE);

END;     






