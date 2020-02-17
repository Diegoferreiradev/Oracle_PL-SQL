
SELECT COUNT(*) AS QTDE_REGISTROS, 
       AVG(TOTAL) AS MEDIA, 
       ROUND(AVG(TOTAL),2) AS MEDIA, 
       MAX(TOTAL) AS MAXIMO, 
       MIN(TOTAL) AS MINIMO,
       SUM(TOTAL) AS SOMA,
       MAX(DATA) AS DATA_MAIOR,
       TRUNC(MIN(DATA)) AS DATA_MENOR
FROM tcontrato;


SELECT MAX(cod_contrato) + 1 AS PROXIMO_CODIGO 
FROM TCONTRATO;


SELECT * FROM TCONTRATO;


SELECT cod_aluno, 
       count(*) as qtde_contratos, 
       sum(total) as valor_total 
FROM TCONTRATO 
GROUP BY cod_aluno;


SELECT TO_CHAR(TRUNC(SYSDATE), 'DD/MM/YYYY') AS DATA FROM DUAL; 


SELECT TO_CHAR(TRUNC(DATA), 'DD/MM/YYYY') AS DATA,
SUM(TOTAL) AS SOMA,
ROUND(AVG(TOTAL),2) AS MEDIA,
COUNT(*) AS QTDE
FROM TCONTRATO
GROUP BY TRUNC(DATA)
ORDER BY DATA DESC;


SELECT TO_CHAR(TRUNC(DATA), 'DD/MM/YYYY') AS DATA,
       SUM(TOTAL) AS SOMA,
       ROUND(AVG(TOTAL),2) AS MEDIA,
       COUNT(*) AS QTDE 
FROM TCONTRATO
GROUP BY TRUNC(DATA)
ORDER BY DATA DESC;


SELECT * FROM tcontrato;

SELECT COUNT(*) QTDE_CONTRATOS FROM tcontrato;

SELECT COUNT(desconto) FROM tcontrato;

--UPDATE tcontrato SET desconto = NULL WHERE cod_contrato IN (3,4);

--DELETE tcontrato WHERE cod_contrato = 8;

SELECT * FROM taluno;

SELECT COUNT(estado) FROM taluno;

SELECT COUNT(DISTINCT(estado)) 
FROM taluno;


SELECT estado, COUNT(*) 
FROM taluno 
GROUP BY estado;


SELECT SUM(desconto),
       AVG(desconto), 
       COUNT(desconto), 
       ROUND(AVG( NVL(desconto, 0) ), 2) 
FROM TCONTRATO;


SELECT alu.estado, 
       TRUNC(con.data) AS DATA, 
       SUM(con.total) TOTAL, 
       COUNT(*) QTDE 
FROM TALUNO ALU, TCONTRATO CON 
WHERE alu.cod_aluno = con.cod_aluno 
GROUP BY alu.estado, TRUNC(con.data) 
ORDER BY alu.estado, DATA DESC;


SELECT cod_aluno, AVG(total) MEDIA 
FROM TCONTRATO
WHERE cod_aluno > 0 HAVING AVG(total) > 500
GROUP BY cod_aluno 
ORDER BY cod_aluno;


SELECT TRUNC(data), SUM(total) TOTAL 
FROM TCONTRATO
WHERE cod_contrato > 0
GROUP BY TRUNC(data)
HAVING SUM(TOTAL) > 500
ORDER BY TOTAL DESC;


SELECT MAX(AVG(total)) 
FROM TCONTRATO
GROUP BY cod_aluno;


SELECT estado, SUM(salario) AS TOTAL 
FROM TALUNO
GROUP BY estado
ORDER BY 2 DESC;


