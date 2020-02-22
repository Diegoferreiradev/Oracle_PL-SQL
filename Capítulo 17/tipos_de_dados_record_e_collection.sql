-- Created on 2/22/2020 by DIEGO 

DECLARE
   TYPE Rec_aluno IS RECORD
   ( cod_aluno NUMBER NOT NULL := 0,
     nome TALUNO.NOME%TYPE, 
     cidade TALUNO.CIDADE%TYPE );
     
   registro Rec_aluno;

BEGIN
  
  registro.cod_aluno := 50;
  registro.nome := 'Diego Ferreira';
  registro.cidade := 'Recife';
  
  dbms_output.put_line('Código: ' || registro.cod_aluno);
  dbms_output.put_line('Nome: ' || registro.nome);
  dbms_output.put_line('Cidade: ' || registro.cidade);

END;    

-- EXEMPLO 02


DECLARE 
   reg TALUNO%ROWTYPE;
   vCep VARCHAR2(10) := '98300000';

BEGIN
  SELECT COD_ALUNO, NOME, CIDADE
  INTO reg.cod_aluno, reg.nome, reg.cidade
  FROM TALUNO
  WHERE COD_ALUNO = 1;
  
  reg.cep := '9311100';
  reg.salario := 2300;
  
  dbms_output.put_line('Código: ' || reg.cod_aluno);
  dbms_output.put_line('Nome: ' || reg.nome);
  dbms_output.put_line('Cidade: ' || reg.cidade);
  dbms_output.put_line('CEP: ' || reg.cep);
  dbms_output.put_line('Salário: ' || reg.salario);

END;   
   

-- EXEMPLO 03

DECLARE   
   TYPE T_ALUNO IS TABLE OF TALUNO.NOME%TYPE
   INDEX BY BINARY_INTEGER;
   
   registro T_ALUNO;
   
BEGIN
  registro(1) := 'Diego';
  registro(2) := 'Maria';
  registro(3) := 'Suzana';
  registro(4) := 'Verônica';
  registro(5) := 'Izabel';
  
  dbms_output.put_line('Nome: ' || registro(1));
  dbms_output.put_line('Nome: ' || registro(2));
  dbms_output.put_line('Nome: ' || registro(3));
  dbms_output.put_line('Nome: ' || registro(4));
  dbms_output.put_line('Nome: ' || registro(5));

END;      
   
   
-- EXEMPLO 04

DECLARE
   TYPE NOME_TYPE IS TABLE OF TALUNO.NOME%TYPE;
   nome_table NOME_TYPE := NOME_TYPE();

BEGIN
  nome_table.EXTEND;
  nome_table(1) := 'Diego';
  nome_table.EXTEND;
  nome_table(2) := 'Joana';
  nome_table.EXTEND;
  nome_table(3) := 'Mercia';
  nome_table.EXTEND;
  nome_table(4) := 'Ana';
  nome_table.EXTEND;
  nome_table(5) := 'Felipe';
  
  dbms_output.put_line('Nome 1: ' || nome_table(1));
  dbms_output.put_line('Nome 2: ' || nome_table(2));
  dbms_output.put_line('Nome 3: ' || nome_table(3));
  dbms_output.put_line('Nome 4: ' || nome_table(4));
  dbms_output.put_line('Nome 5: ' || nome_table(5));
  
END;   


-- EXEMPLO 05

DECLARE
   TYPE tipo IS TABLE OF VARCHAR2(30) INDEX BY VARCHAR2(2);
   uf_capital tipo;
   
BEGIN
  uf_capital('PE') := 'RECIFE';
  uf_capital('RS') := 'PORTO ALEGRE';
  uf_capital('SP') := 'SÃO PAULO';
  uf_capital('RJ') := 'RIO DE JANEIRO';
  uf_capital('MT') := 'CUIABÁ';
  
  dbms_output.put_line(uf_capital('PE'));
  dbms_output.put_line(uf_capital('RS'));
  dbms_output.put_line(uf_capital('SP'));
  dbms_output.put_line(uf_capital('RJ'));
  dbms_output.put_line(uf_capital('MT'));

END;


-- EXEMPLO 06

DECLARE
   TYPE nome_varray IS VARRAY(5) OF TALUNO.NOME%TYPE;
   nome_vetor nome_varray := nome_varray();
   
BEGIN
  
  nome_vetor.EXTEND;
  nome_vetor(1) := 'Diego';
   
  dbms_output.put_line(nome_vetor(1));
  
END;   
   
