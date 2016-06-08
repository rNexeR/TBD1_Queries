--------------------------------------------------------
--  DDL for Create Table USUARIO_LOG
--------------------------------------------------------
CREATE TABLE USUARIO_LOG 
(
  ID_USUARIO VARCHAR2(50 BYTE) 
, NOMBRE VARCHAR2(50 BYTE) 
, CREADO_POR VARCHAR2(50 BYTE) 
, MODIFICADO_POR VARCHAR2(50 BYTE) 
, FECHA_CREACION DATE 
, FECHA_MODIFICACION DATE 
, OPERACION VARCHAR2(50 BYTE) 
, FECHA DATE 
, CLAVE VARCHAR2(100 BYTE)
) 

--------------------------------------------------------
--  Triggers for register log AFTER INSERT
--------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_USUARIO_AI 
AFTER INSERT ON USUARIO FOR EACH ROW
BEGIN
  INSERT INTO USUARIO_LOG ( ID_USUARIO, NOMBRE, 
            CREADO_POR, MODIFICADO_POR,FECHA_CREACION,FECHA_MODIFICACION,OPERACION,FECHA,CLAVE)
  VALUES(   :NEW.ID_USUARIO, :NEW.NOMBRE, 
            :NEW.CREADO_POR, :NEW.MODIFICADO_POR,:NEW.FECHA_CREACION,:NEW.FECHA_MODIFICACION,'INSERT',SYSDATE,:NEW.CLAVE);
END;

--------------------------------------------------------
--  Triggers for register log AFTER UPDATE
--------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_USUARIO_AU 
AFTER UPDATE ON USUARIO FOR EACH ROW
BEGIN
  INSERT INTO USUARIO_LOG ( ID_USUARIO, NOMBRE, 
            CREADO_POR, MODIFICADO_POR,FECHA_CREACION,FECHA_MODIFICACION,OPERACION,FECHA,CLAVE)
  VALUES(   :OLD.ID_USUARIO, :OLD.NOMBRE, 
            :OLD.CREADO_POR, :OLD.MODIFICADO_POR,:OLD.FECHA_CREACION,:OLD.FECHA_MODIFICACION,'UPDATE',SYSDATE,:OLD.CLAVE);
            
  INSERT INTO USUARIO_LOG ( ID_USUARIO, NOMBRE, 
            CREADO_POR, MODIFICADO_POR,FECHA_CREACION,FECHA_MODIFICACION,OPERACION,FECHA,CLAVE)
  VALUES(   :NEW.ID_USUARIO, :NEW.NOMBRE, 
            :NEW.CREADO_POR, :NEW.MODIFICADO_POR,:NEW.FECHA_CREACION,:NEW.FECHA_MODIFICACION,'UPDATE',SYSDATE,:NEW.CLAVE);
END;

--------------------------------------------------------
--  Triggers for register log AFTER DELETE
--------------------------------------------------------
CREATE OR REPLACE TRIGGER TR_USUARIO_AD 
AFTER DELETE ON USUARIO FOR EACH ROW
BEGIN
  INSERT INTO USUARIO_LOG ( ID_USUARIO, NOMBRE, 
            CREADO_POR, MODIFICADO_POR,FECHA_CREACION,FECHA_MODIFICACION,OPERACION,FECHA,CLAVE)
  VALUES(   :OLD.ID_USUARIO, :OLD.NOMBRE, 
            :OLD.CREADO_POR, :OLD.MODIFICADO_POR,:OLD.FECHA_CREACION,:OLD.FECHA_MODIFICACION,'DELETE',SYSDATE,:OLD.CLAVE);
END;