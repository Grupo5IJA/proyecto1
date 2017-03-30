-- Generado por Oracle SQL Developer Data Modeler 4.1.5.907
--   en:        2017-03-30 20:42:47 CEST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE Categoria
  (
    codigo_categoria VARCHAR2 (4) NOT NULL ,
    nombre_categoria VARCHAR2 (25) NOT NULL
  ) ;
ALTER TABLE Categoria ADD CONSTRAINT Categoria_PK PRIMARY KEY ( codigo_categoria ) ;


CREATE TABLE Centro_Trabajo
  (
    cod_centro           VARCHAR2 (4) NOT NULL ,
    nombre_centro        VARCHAR2 (25) NOT NULL ,
    calle_centro         VARCHAR2 (25) NOT NULL ,
    numero_centro        INTEGER NOT NULL ,
    codigo_postal_centro INTEGER NOT NULL ,
    ciudad_centro        VARCHAR2 (25) NOT NULL ,
    provincia_centro     VARCHAR2 (25) NOT NULL ,
    telefono_centro      VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE Centro_Trabajo ADD CONSTRAINT Centro_Trabajo_PK PRIMARY KEY ( cod_centro ) ;


CREATE TABLE Parte
  (
    codigo_parte              VARCHAR2 (4) NOT NULL ,
    incidencias_parte         VARCHAR2 (255) ,
    albaran_parte             VARCHAR2 (6) NOT NULL ,
    Trabajador_dni_trabajador VARCHAR2 (9) NOT NULL ,
    fecha_parte               DATE NOT NULL ,
    estado_parte              CHAR (1) ,
    total_horas_parte         NUMBER
  ) ;
ALTER TABLE Parte ADD CONSTRAINT Parte_PK PRIMARY KEY ( codigo_parte ) ;


CREATE TABLE Trabajador
  (
    dni_trabajador               VARCHAR2 (9) NOT NULL ,
    nombre_trabajador            VARCHAR2 (25) NOT NULL ,
    apellido1_trabajador         VARCHAR2 (25) NOT NULL ,
    apellido2_trabajador         VARCHAR2 (25) NOT NULL ,
    calle_trabajador             VARCHAR2 (25) NOT NULL ,
    portal_trabajador            INTEGER NOT NULL ,
    piso_trabajador              INTEGER NOT NULL ,
    mano_trabajador              VARCHAR2 (5) NOT NULL ,
    telefono_personal_trabajador VARCHAR2 (20) ,
    telefono_empresa_trabajador  VARCHAR2 (20) NOT NULL ,
    salario_trabajador           NUMBER ,
    fecha_nacimiento_trabajador  DATE ,
    usuario                      VARCHAR2 (25) NOT NULL ,
    contraseña                   VARCHAR2 (25) NOT NULL ,
    Centro_Trabajo_cod_centro    VARCHAR2 (4) NOT NULL ,
    Categoria_codigo_categoria   VARCHAR2 (4) NOT NULL
  ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_PK PRIMARY KEY ( dni_trabajador ) ;


CREATE TABLE Vehiculo
  (
    matricula_vehiculo VARCHAR2 (9) NOT NULL ,
    marca_vehiculo     VARCHAR2 (40) NOT NULL ,
    modelo_vehiculo    VARCHAR2 (40) NOT NULL
  ) ;
ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_PK PRIMARY KEY ( matricula_vehiculo ) ;


CREATE TABLE Viaje
  (
    codigo_viaje                VARCHAR2 (4) NOT NULL ,
    hora_inicio_viaje           DATE NOT NULL ,
    hora_fin_viaje              DATE NOT NULL ,
    km_inicio_viaje             INTEGER NOT NULL ,
    km_fin_viaje                INTEGER NOT NULL ,
    gastos_gasolina__viaje      NUMBER ,
    gastos_autopistas_viaje     NUMBER ,
    gastos_dietas_viaje         NUMBER ,
    gastos_viaje                NUMBER ,
    Parte_codigo_parte          VARCHAR2 (4) NOT NULL ,
    Vehiculo_matricula_vehiculo VARCHAR2 (9)
  ) ;
ALTER TABLE Viaje ADD CONSTRAINT Viaje_PK PRIMARY KEY ( codigo_viaje ) ;


ALTER TABLE Parte ADD CONSTRAINT Parte_Trabajador_FK FOREIGN KEY ( Trabajador_dni_trabajador ) REFERENCES Trabajador ( dni_trabajador ) ;

ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_Categoria_FK FOREIGN KEY ( Categoria_codigo_categoria ) REFERENCES Categoria ( codigo_categoria ) ;

ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_Centro_Trabajo_FK FOREIGN KEY ( Centro_Trabajo_cod_centro ) REFERENCES Centro_Trabajo ( cod_centro ) ;

ALTER TABLE Viaje ADD CONSTRAINT Viaje_Parte_FK FOREIGN KEY ( Parte_codigo_parte ) REFERENCES Parte ( codigo_parte ) ;

ALTER TABLE Viaje ADD CONSTRAINT Viaje_Vehiculo_FK FOREIGN KEY ( Vehiculo_matricula_vehiculo ) REFERENCES Vehiculo ( matricula_vehiculo ) ;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
