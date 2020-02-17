

SELECT COD_CONTRATO, DATA, TOTAL 
FROM TCONTRATO
WHERE TOTAL > (SELECT VALOR FROM TCURSO WHERE COD_CURSO = 1);

-- Exemplo com Erro

SELECT cod_contrato, data, total 
FROM TCONTRATO
WHERE total >= (SELECT VALOR FROM TCURSO WHERE VALOR > 500);


SELECT * FROM TALUNO;


SELECT cod_aluno, nome, cidade 
FROM TALUNO
WHERE cidade = (SELECT CIDADE FROM TALUNO WHERE COD_ALUNO = 1)
AND COD_ALUNO <> 1;


SELECT cod_aluno, nome, cidade, estado 
FROM TALUNO
WHERE (cidade, estado) = (SELECT cidade, estado FROM TALUNO WHERE cod_aluno = 1 )
AND cod_aluno <> 1;


SELECT cod_curso, MIN(valor), SUM(valor), COUNT(*) QTDE 
FROM TITEM
WHERE cod_curso > 0 
GROUP BY cod_curso
HAVING MIN(valor) >= (SELECT AVG(valor) FROM TCURSO)
ORDER BY cod_curso; 


SELECT cod_aluno, MIN(total), SUM(total) 
FROM TCONTRATO
GROUP BY cod_aluno
HAVING MIN(total) > (SELECT AVG(valor) FROM TCURSO);


SELECT * FROM TCURSO;

SELECT cod_curso, nome, valor 
FROM TCURSO
WHERE cod_curso IN (SELECT cod_curso FROM TITEM);


SELECT cod_curso, nome, valor 
FROM TCURSO
WHERE cod_curso NOT IN (SELECT cod_curso FROM TITEM)
ORDER BY nome;


SELECT cod_curso, nome, valor 
FROM TCURSO
WHERE cod_curso IN (1,2,3);


SELECT cod_curso, nome, valor 
FROM TCURSO
WHERE cod_curso NOT IN (1,2,3);


SELECT cod_aluno, nome, cidade, estado 
FROM TALUNO
WHERE (cidade, estado) = (SELECT cidade, estado FROM TALUNO WHERE cod_aluno = 1)
AND cod_aluno <> 1;


SELECT * FROM TITEM
WHERE (cod_curso, valor) IN (SELECT cod_curso, valor FROM TCURSO);


SELECT ite.cod_contrato, 
       ite.valor, 
       ite.cod_curso, 
       cur.cod_curso, 
       cur.valor 
FROM TITEM ite,
    (SELECT cod_curso, valor FROM TCURSO WHERE valor > 500) cur
WHERE cur.cod_curso = ite.cod_curso;    







