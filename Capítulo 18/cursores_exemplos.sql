-- Created on 2/22/2020 by DIEGO 

DECLARE
   vCod_aluno TALUNO.COD_ALUNO%TYPE;
   vNome TALUNO.NOME%TYPE;
   CURSOR c1 IS
          SELECT cod_aluno, nome FROM TALUNO;
BEGIN
  OPEN c1;
     LOOP
       FETCH c1 INTO vCod_aluno, vNome;
       EXIT WHEN c1%ROWCOUNT >= 10 OR c1%NOTFOUND;
        dbms_output.put_line('Código: ' || LPAD(vCod_aluno, 4, '0') || ' - ' || 'Nome: ' || vNome);    
     END LOOP;
  CLOSE c1;
END;       


--EXEMPLO 02


DECLARE
  CURSOR c1 IS
      SELECT * FROM TALUNO;
  reg c1%ROWTYPE;
BEGIN
  OPEN c1;
     LOOP
       FETCH c1 INTO reg;
       EXIT WHEN c1%ROWCOUNT > 10 OR c1%NOTFOUND;
       dbms_output.put_line('Código: ' || LPAD(reg.cod_aluno, 5, '0') || ' - ' || 'Nome: ' || reg.nome);
     END LOOP;
  CLOSE c1;
END;         


-- EXEMPLO 03


DECLARE
   CURSOR c1 IS
      SELECT * FROM TALUNO;
      reg TALUNO%ROWTYPE;
BEGIN
  FOR reg IN c1
    LOOP
      dbms_output.put_line('Código: ' || LPAD(reg.cod_aluno, 5, '0') || ' - ' || 'Nome: ' || reg.nome);
    END LOOP;
END;      
   

-- EXEMPLO 04


DECLARE
   reg TALUNO%ROWTYPE;
BEGIN
  FOR reg IN (SELECT * FROM TALUNO)
    LOOP
      dbms_output.put_line('Código: ' || LPAD(reg.cod_aluno, 5, '0') ||  ' Nome: ' || reg.nome);
    END LOOP;
END;   
   
   
-- EXEMPLO 05


DECLARE
   CURSOR c1 (pCod_aluno NUMBER) IS
      SELECT * FROM TALUNO WHERE COD_ALUNO = pCod_aluno FOR UPDATE OF NOME NOWAIT;
         
   reg c1%ROWTYPE;
BEGIN
  OPEN c1(&codigo);
      FETCH c1 INTO reg;
        dbms_output.put_line('Código: ' || LPAD(reg.cod_aluno, 5, '0') || ' - ' || ' Nome: ' || reg.nome);
  CLOSE c1;
END;   
   

-- EXEMPLO 06


DECLARE
   CURSOR c1 IS
       SELECT NOME FROM TALUNO FOR UPDATE;
       
   reg_aluno c1%ROWTYPE;
BEGIN
  FOR reg_aluno IN c1
    LOOP
      UPDATE TALUNO SET NOME = INITCAP(reg_aluno.nome) WHERE CURRENT OF c1;
        dbms_output.put_line('Nome: ' || INITCAP(reg_aluno.nome));
    END LOOP;
    COMMIT;
END;       

   
SELECT * FROM TALUNO;   
   
   
   
   



