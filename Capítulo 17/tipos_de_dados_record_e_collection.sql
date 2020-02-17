
DECLARE
  TYPE Rec_aluno IS RECORD(
  cod_aluno NUMBER NOT NULL := 0,
  nome TALUNO.NOME%TYPE,
  cidade TALUNO.CIDADE%TYPE );
  
  registro Rec_aluno;
  
BEGIN
  registro.cod_aluno := 50;
  registro.nome := 'Diego';
  registro.cidade := 'Recife';
  
  DBMS_OUTPUT.put_line('Código: ' || registro.cod_aluno);
  DBMS_OUTPUT.put_line('Nome: ' || registro.nome);
  DBMS_OUTPUT.put_line('Cidade: ' || registro.cidade);
END;  


-- Exemplo 2

SELECT * FROM TALUNO;

DECLARE
   reg TALUNO%ROWTYPE;
   vCep VARCHAR2(10) := '98000000';
BEGIN
  SELECT COD_ALUNO, NOME, CIDADE
  INTO reg.cod_aluno, reg.nome, reg.cidade
  FROM TALUNO
  WHERE COD_ALUNO = 1;
  
  
  reg.Cep := '99000897';
  reg.Salario := 5533.22;
  
  DBMS_OUTPUT.put_line('Código: ' || reg.cod_aluno);
  DBMS_OUTPUT.put_line('Nome: ' || reg.nome);
  DBMS_OUTPUT.put_line('Cidade: ' || reg.cidade);
  DBMS_OUTPUT.put_line('CEP: ' || reg.cep);
  DBMS_OUTPUT.put_line('Salário: ' || reg.salario);
END;   
   
   
-- EXEMPLO 3

DECLARE
   TYPE T_ALUNO IS TABLE OF TALUNO.NOME%TYPE
   INDEX BY BINARY_INTEGER;
   
   registro T_ALUNO;
BEGIN
  registro(1) := 'Diego Ferreira';
  registro(2) := 'Joana Lima';
  registro(3) := 'Fernanda Nascimento';
  
  DBMS_OUTPUT.put_line('Nome 1: ' || registro(1));
  DBMS_OUTPUT.put_line('Nome 2: ' || registro(2));
  DBMS_OUTPUT.put_line('Nome 3: ' || registro(3));

END;      
   
   
-- EXEMPLO 4

DECLARE
   TYPE nome_type IS TABLE OF TALUNO.NOME%TYPE;
   nome_table nome_type := nome_type();
BEGIN
  nome_table.EXTEND;
  nome_table(1) := 'Diego Ferreira';
  nome_table.EXTEND;
  nome_table(2) := 'Fernanda Nirá';
  
  DBMS_OUTPUT.put_line('Nome: ' || nome_table(1));
  DBMS_OUTPUT.put_line('Nome: ' || nome_table(2));
END;      

