
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

