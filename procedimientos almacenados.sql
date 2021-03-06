--LOS PROCEDIMIENTOS ALMACENADOS NO RETORNAN UNA VALOR, ALMENOS NO DE LA MISMA FORMA QUE LAS FUNCIONES SINO POR REFERENCI EN LOS PARAMETROS
--CRUD ES A TRAVEZ DE PROCEDIMIENTOS ALMACENADOS
-- PROCEDIMIENTOS ALMACENADOS SE EJECUTAN A TAVEZ DE PSQL

CREATE OR REPLACE PROCEDURE SP_SUMA 
(
  P_VALOR1 IN NUMBER 
, P_VALOR2 IN NUMBER 
, P_SUMA OUT NUMBER 
) AS 
BEGIN
  p_SUMA := P_VALOR1 + P_VALOR2;
END SP_SUMA;

--PROBANDOLO
DECLARE
  P_SUMA NUMBER;
BEGIN
  SP_SUMA(100,10,P_SUMA => P_SUMA);
  DBMS_OUTPUT.PUT_LINE('SUMA = ' || P_SUMA);
END;

--CREATE CON PROCEDIMIENTOS ALMACENADOS
CREATE OR REPLACE PROCEDURE SP_PRESTAMO_CREATE 
(
  P_NUMERO_PRESTAMO IN PRESTAMO.NUMERO_PRESTAMO%TYPE
, P_IMPORTE IN PRESTAMO.IMPORTE%TYPE
, P_NOMBRE_SUCURSAL IN PRESTAMO.NOMBRE_SUCURSAL%TYPE
) AS 
BEGIN
  INSERT INTO PRESTAMO(NUMERO_PRESTAMO, IMPORTE, NOMBRE_SUCURSAL)
  VALUES(P_NUMERO_PRESTAMO,P_IMPORTE,P_NOMBRE_SUCURSAL);
  
  COMMIT;
END SP_PRESTAMO_CREATE;

--IMPLEMENTAR
BEGIN
  SP_PRESTAMO_CREATE('P-98', 854, 'Centro');
END;