
SELECT t.cod_aluno, t.nome, t.cidade FROM TALUNO t;

SELECT t.cod_aluno as "Codigo", t.nome as "Nome do Aluno" FROM TALUNO t;

SELECT CIDADE FROM TALUNO;

SELECT DISTINCT cidade FROM TALUNO;

SELECT DISTINCT t.cidade, t.cod_aluno FROM TALUNO t ORDER BY t.cidade;

SELECT * FROM TCURSO;

SELECT t.nome as Curso, 
       t.valor, 
       valor/t.carga_horaria, 
       ROUND(t.valor/t.carga_horaria,2) as Valor_Hora 
       FROM TCURSO t 
       ORDER BY Valor_Hora;


SELECT * FROM tcontrato;

UPDATE tcontrato SET desconto = NULL WHERE cod_contrato = 4;

SELECT t.cod_contrato, 
       t.total, 
       t.desconto, 
       t.total + t.desconto 
FROM tcontrato t;


SELECT t.cod_contrato, 
       t.desconto, 
       NVL(t.desconto,0), 
       t.total, 
       t.total + NVL(t.desconto,0) AS TOTAL_MAIS_DESCONTO 
FROM tcontrato t;



