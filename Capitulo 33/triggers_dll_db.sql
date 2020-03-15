-- Created on 3/14/2020 by DIEGO 


CREATE TABLE LOG_DDL (
   DATA DATE, 
   USUARIO VARCHAR2(40), 
   SCHEMA VARCHAR2(30), 
   OPERACAO VARCHAR2(100), 
   OBJETO VARCHAR2(1000)
);


-- Trigger ligada ao banco de dados, e não a tabela.

CREATE OR REPLACE TRIGGER tri_log_ddl BEFORE ddl ON DATABASE
DECLARE
  v_oper VARCHAR2(30);
  v_schema VARCHAR2(30);
  v_obj VARCHAR2(30);
BEGIN
  SELECT ora_sysevent, ora_dict_obj_owner, ora_dict_obj_name
  INTO v_oper, v_schema, v_obj FROM DUAL;
  INSERT INTO LOG_DDL VALUES (sysdate, user, v_schema, v_oper, v_obj);
END;    


DROP TABLE TESTE;

SELECT * FROM LOG_DDL;




