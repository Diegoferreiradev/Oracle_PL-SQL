

SELECT NOME FROM TALUNO WHERE NOME LIKE '%MA%';

CREATE INDEX IND_TALUNO_NOME ON TALUNO(NOME);

SELECT NOME FROM TALUNO WHERE NOME LIKE '%MA%';


CREATE INDEX IND_TALU_NOMECIDADE ON TALUNO(NOME, CIDADE);


SELECT NOME, CIDADE FROM TALUNO WHERE NOME LIKE '%A%' AND CIDADE LIKE '%A%';

SELECT * FROM USER_INDEXES;

------- Sinonimos

CREATE SYNONYM ALU FOR TALUNO;

SELECT * FROM ALU;



