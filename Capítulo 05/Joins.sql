
SELECT * FROM TALUNO;

SELECT * FROM TCONTRATO;

SELECT con.cod_aluno, alu.nome AS ALUNO, con.cod_contrato, con.data, con.total 
FROM TALUNO alu, TCONTRATO con 
WHERE con.cod_aluno = alu.cod_aluno AND UPPER(alu.nome) LIKE '%'
ORDER BY alu.nome;


----------------------

SELECT * FROM TALUNO;
SELECT * FROM TCONTRATO;
SELECT * FROM TITEM;
SELECT * FROM TCURSO;


SELECT alu.cod_aluno, 
       alu.nome as Aluno, 
       con.cod_contrato, 
       con.data, 
       con.total, 
       ite.cod_curso, 
       cur.nome as Curso, ite.valor 
FROM TALUNO alu, TCONTRATO con, TITEM ite, TCURSO cur
WHERE alu.cod_aluno = con.cod_aluno(+)
AND con.cod_contrato = ite.cod_contrato(+)
AND ite.cod_curso = cur.cod_curso(+)
ORDER BY con.total;

SELECT * FROM TALUNO;

 INSERT INTO taluno (cod_aluno, nome,cidade,cep) VALUES(10, 'José','Novo Hamburgo', NULL);
 
 
 CREATE TABLE TDESCONTO(
 
    CLASSE VARCHAR2(1) PRIMARY KEY,
    INFERIOR NUMBER(4,2),
    SUPERIOR NUMBER(4,2)
 
 );
 
 INSERT INTO TDESCONTO VALUES ('A',00,10);
 INSERT INTO TDESCONTO VALUES ('B',11,15);
 INSERT INTO TDESCONTO VALUES ('C',16,20);
 INSERT INTO TDESCONTO VALUES ('D',21,25);
 INSERT INTO TDESCONTO VALUES ('E',26,30);
 
 
 SELECT * FROM TDESCONTO; 
 
 SELECT * FROM TCONTRATO;
 
 UPDATE TCONTRATO SET DESCONTO = 18 WHERE cod_contrato = 5;
 
 
 SELECT con.cod_contrato as Contrato, con.desconto as Desconto, des.classe as Desconto 
 FROM TCONTRATO con, TDESCONTO des
 WHERE con.desconto BETWEEN des.inferior AND des.superior
 ORDER BY con.cod_contrato;
 
 
 SELECT * FROM tcurso;
 
 
 SELECT cur.cod_curso, cur.nome, ite.cod_item 
 FROM TCURSO cur, TITEM ite
 WHERE cur.cod_curso = ite.cod_curso(+)
 AND ite.cod_item IS NULL;
 
 INSERT INTO TCURSO VALUES (9, 'PHP', 1000, 100, NULL);
 INSERT INTO TCURSO VALUES (10, 'LÓGICA', 1000, 200, NULL);
 
 UPDATE TCURSO SET PRE_REQ = 7 WHERE COD_CURSO = 10;
 UPDATE TCURSO SET PRE_REQ = 7 WHERE COD_CURSO = 3;
 UPDATE TCURSO SET PRE_REQ = 1 WHERE COD_CURSO = 6;
 UPDATE TCURSO SET PRE_REQ = 4 WHERE COD_CURSO = 1;

 
 SELECT curso.nome as curso, 
        pre_req.nome as pre_requisito
 FROM tcurso curso, tcurso pre_req
 WHERE curso.pre_req = pre_req.cod_curso(+)
 
 

 