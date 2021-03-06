--VALIDACION DE LLAVE PRIMARIA EN USUARIO
CREATE OR REPLACE TRIGGER TR_USUARIO BEFORE INSERT ON USUARIO FOR EACH ROW
DECLARE
  nCount NUMBER;
BEGIN
  SELECT COUNT(*) INTO nCount FROM USUARIO WHERE ID_USUARIO = :NEW.ID_USUARIO;
  
  IF(nCount > 0) THEN
    RAISE_APPLICATION_ERROR(-20001,'Error de llave primaria');
  END IF;
END;

--VALIDACIONES DE EMPLEADO
create or replace TRIGGER TR_EMPLEADO_BI 
BEFORE INSERT OR UPDATE ON EMPLEADO 
FOR EACH ROW 
DECLARE nVal NUMBER;
BEGIN
  --VALIDANDO LLAVE PRIMARIA DE EMPLEADO
  SELECT COUNT(*) INTO nVal FROM EMPLEADO WHERE CODIGO_EMPLEADO = :NEW.CODIGO_EMPLEADO;
  
  IF(nVal > 0) THEN
    RAISE_APPLICATION_ERROR(-20001,'Error de llave primaria');
  END IF;

  --VALIDANDO LLAVE FORANEA DE ID_USUARIO
  SELECT COUNT(*) INTO nVal FROM USUARIO U WHERE U.ID_USUARIO = :NEW.ID_USUARIO;
  
  IF(nVal = 0) THEN
    RAISE_APPLICATION_ERROR(-20001,'Error de llave Foranea 1');
  END IF;
  
  --VALIDANDO LLAVE FORANEA DE CREADO_POR
  SELECT COUNT(*) INTO nVal FROM USUARIO U WHERE U.ID_USUARIO = :NEW.CREADO_POR;
  
  IF(nVal = 0) THEN
    RAISE_APPLICATION_ERROR(-20001,'Error de llave Foranea 2');
  END IF;
  
  --VALIDANDO LLAVE FORANEA DE MODIFICADO_POR
  SELECT COUNT(*) INTO nVal FROM USUARIO U WHERE U.ID_USUARIO = :NEW.MODIFICADO_POR;
  
  IF(nVal = 0) THEN
    RAISE_APPLICATION_ERROR(-20001,'Error de llave Foranea 3');
  END IF;
  
END;