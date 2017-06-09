-- Generado por Oracle SQL Developer Data Modeler 4.1.3.901
--   en:        2017-06-09 13:45:57 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE G_i
  (
    código_GI            INTEGER NOT NULL ,
    nombre               VARCHAR (40) ,
    clasificación_actual VARCHAR (40) ,
    memo_clasificación   VARCHAR (50) ,
    logo BLOB ,
    lema   VARCHAR (100) ,
    misión VARCHAR (100) ,
    visión VARCHAR (100) ,
    organigrama BLOB
  ) ;
ALTER TABLE G_i ADD CONSTRAINT G_i_PK PRIMARY KEY ( código_GI ) ;


CREATE TABLE L_i
  (
    código_LI   INTEGER NOT NULL ,
    descripción VARCHAR (100) ,
    código_GI   INTEGER NOT NULL
  ) ;
ALTER TABLE L_i ADD CONSTRAINT L_i_PK PRIMARY KEY ( código_LI ) ;


CREATE TABLE Proyecto
  (
    código_Proy         INTEGER NOT NULL ,
    título              VARCHAR (40) ,
    palabras_clave      VARCHAR (50) ,
    objetivos           VARCHAR (80) ,
    descripción         VARCHAR (100) ,
    fecha_inicio        DATE ,
    duración            DATE ,
    financiación        CHAR (2) ,
    cooperación_interna VARCHAR (80) ,
    código_LI           INTEGER NOT NULL
  ) ;
ALTER TABLE Proyecto ADD CONSTRAINT Proyecto_PK PRIMARY KEY ( código_Proy ) ;


CREATE TABLE Rol
  (
    código_R          INTEGER NOT NULL ,
    nombre            VARCHAR (30) ,
    responsabilidades VARCHAR (100)
  ) ;
ALTER TABLE Rol ADD CONSTRAINT Rol_PK PRIMARY KEY ( código_R ) ;


CREATE TABLE avances
  (
    código_A             INTEGER NOT NULL ,
    nombre_usuario_envía VARCHAR (40) ,
    código_Proy          INTEGER NOT NULL ,
    código_TA            INTEGER NOT NULL
  ) ;
ALTER TABLE avances ADD CONSTRAINT avances_PK PRIMARY KEY ( código_A ) ;


CREATE TABLE e_n
  (
    codigo_E      INTEGER NOT NULL ,
    nombre        VARCHAR (50) ,
    descripción   VARCHAR (100) ,
    fecha_inicio  DATE ,
    fecha_final   DATE ,
    G_i_código_GI INTEGER NOT NULL
  ) ;
ALTER TABLE e_n ADD CONSTRAINT e_n_PK PRIMARY KEY ( codigo_E ) ;


CREATE TABLE productos
  (
    código_p    INTEGER NOT NULL ,
    nombre      VARCHAR (40) ,
    descripción VARCHAR (100) ,
    tipo        VARCHAR (80) ,
    código_Proy INTEGER NOT NULL
  ) ;
ALTER TABLE productos ADD CONSTRAINT productos_PK PRIMARY KEY ( código_p ) ;


CREATE TABLE tipo_avance
  (
    código_TA   INTEGER NOT NULL ,
    nombre      VARCHAR (40) ,
    descripción VARCHAR (100)
  ) ;
ALTER TABLE tipo_avance ADD CONSTRAINT tipo_avance_PK PRIMARY KEY ( código_TA ) ;


CREATE TABLE usuario
  (
    DNI                INTEGER NOT NULL ,
    nombres            VARCHAR (40) ,
    apellidos          VARCHAR (40) ,
    fecha_nacimiento   DATE ,
    programa_pertenece VARCHAR (50) ,
    fecha_salida       DATE ,
    temas_interés      VARCHAR (100) ,
    código_LI          INTEGER NOT NULL ,
    código_Proy        INTEGER NOT NULL ,
    código_GI          INTEGER NOT NULL
  ) ;
ALTER TABLE usuario ADD CONSTRAINT usuario_PK PRIMARY KEY ( DNI ) ;


CREATE TABLE usuario_avance
  (
    código_UA   INTEGER NOT NULL ,
    fecha_envio DATE ,
    código_A    INTEGER NOT NULL ,
    DNI         INTEGER NOT NULL
  ) ;
ALTER TABLE usuario_avance ADD CONSTRAINT usuario_avance_PK PRIMARY KEY ( código_UA ) ;


CREATE TABLE usuario_producto
  (
    código_UP    INTEGER NOT NULL ,
    fecha_inicio DATE ,
    fecha_fin    DATE ,
    código_p     INTEGER NOT NULL ,
    DNI          INTEGER NOT NULL
  ) ;
ALTER TABLE usuario_producto ADD CONSTRAINT usuario_producto_PK PRIMARY KEY ( código_UP ) ;


CREATE TABLE usuario_rol
  (
    código_UR    INTEGER NOT NULL ,
    fecha_inicio DATE ,
    fecha_fin    DATE ,
    código_R     INTEGER NOT NULL ,
    DNI          INTEGER NOT NULL
  ) ;
ALTER TABLE usuario_rol ADD CONSTRAINT usuario_rol_PK PRIMARY KEY ( código_UR ) ;


ALTER TABLE L_i ADD CONSTRAINT L_i_G_i_FK FOREIGN KEY ( código_GI ) REFERENCES G_i ( código_GI ) ;

ALTER TABLE Proyecto ADD CONSTRAINT Proyecto_L_i_FK FOREIGN KEY ( código_LI ) REFERENCES L_i ( código_LI ) ;

ALTER TABLE avances ADD CONSTRAINT avances_Proyecto_FK FOREIGN KEY ( código_Proy ) REFERENCES Proyecto ( código_Proy ) ;

ALTER TABLE avances ADD CONSTRAINT avances_tipo_avance_FK FOREIGN KEY ( código_TA ) REFERENCES tipo_avance ( código_TA ) ;

ALTER TABLE e_n ADD CONSTRAINT e_n_G_i_FK FOREIGN KEY ( G_i_código_GI ) REFERENCES G_i ( código_GI ) ;

ALTER TABLE productos ADD CONSTRAINT productos_Proyecto_FK FOREIGN KEY ( código_Proy ) REFERENCES Proyecto ( código_Proy ) ;

ALTER TABLE usuario ADD CONSTRAINT usuario_G_i_FK FOREIGN KEY ( código_GI ) REFERENCES G_i ( código_GI ) ;

ALTER TABLE usuario ADD CONSTRAINT usuario_L_i_FK FOREIGN KEY ( código_LI ) REFERENCES L_i ( código_LI ) ;

ALTER TABLE usuario ADD CONSTRAINT usuario_Proyecto_FK FOREIGN KEY ( código_Proy ) REFERENCES Proyecto ( código_Proy ) ;

ALTER TABLE usuario_avance ADD CONSTRAINT usuario_avance_avances_FK FOREIGN KEY ( código_A ) REFERENCES avances ( código_A ) ;

ALTER TABLE usuario_avance ADD CONSTRAINT usuario_avance_usuario_FK FOREIGN KEY ( DNI ) REFERENCES usuario ( DNI ) ;

ALTER TABLE usuario_producto ADD CONSTRAINT usuario_producto_productos_FK FOREIGN KEY ( código_p ) REFERENCES productos ( código_p ) ;

ALTER TABLE usuario_producto ADD CONSTRAINT usuario_producto_usuario_FK FOREIGN KEY ( DNI ) REFERENCES usuario ( DNI ) ;

ALTER TABLE usuario_rol ADD CONSTRAINT usuario_rol_Rol_FK FOREIGN KEY ( código_R ) REFERENCES Rol ( código_R ) ;

ALTER TABLE usuario_rol ADD CONSTRAINT usuario_rol_usuario_FK FOREIGN KEY ( DNI ) REFERENCES usuario ( DNI ) ;

