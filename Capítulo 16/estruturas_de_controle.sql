
-- IF 

DECLARE
  vNome varchar2(30) := 'Recifense';
  vCidade varchar2(20);
  vEstado varchar2(2);
BEGIN
  IF (vNome = 'Gaucho') THEN
    vCidade := 'Porto Alegre';
    vEstado := 'RS';
  ELSIF (vNome = 'Recifense') THEN
    vCidade := 'Recife';
    vEstado := 'PE';
  ELSE
    IF (vEstado = 'SP') THEN
      vCidade := 'São Paulo';
      vEstado := 'SP';
    ELSE 
      vCidade := 'OUTROS...';
      vEstado := 'QQ';
    END IF;
  END IF;               
     dbms_output.put_line(vCidade || ' - ' || vEstado);     
END;  


-- CASE  

DECLARE
  vEstado varchar2(2) := 'PE';
  vNome varchar2(30);
BEGIN
  CASE
    WHEN vEstado = 'PE' THEN vNome := 'PERNAMBUCO';
    WHEN vEstado = 'SP' OR vEstado = 'SÃO PAULO' THEN vNome := 'Paulistano';
  ELSE
    vNome := 'Outros';
  END CASE;
  dbms_output.put_line('Apelido: ' || vNome || '...');

END;   


-- LOOP

DECLARE
   vContador INTEGER := 0;
BEGIN
  LOOP
    vContador := vContador + 1;
      dbms_output.put_line(vContador);
      EXIT WHEN vContador = 10;  
  END LOOP;
  dbms_output.put_line('Fim do Loop');
END;   


-- FOR LOOP

DECLARE
   vContador INTEGER;
BEGIN
  FOR vContador IN 1..10
  LOOP
    DBMS_OUTPUT.put_line(vContador);
  END LOOP;
END;   


-- WHILE LOOP

DECLARE
   vContador INTEGER := 0;
   vTexto VARCHAR2(10);
BEGIN
  WHILE vContador < 8 
    LOOP
      vContador := vContador + 1;
      IF (vContador MOD 2)=0 THEN
        vTexto := 'Par';
      ELSE
        vTexto := 'Impar';
      END IF;
        DBMS_OUTPUT.put_line(vContador || ' -> ' || vTexto);      
    END LOOP;
END;   




