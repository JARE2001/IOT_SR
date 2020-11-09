DROP DATABASE IF EXISTS `SR_IOT`;
CREATE DATABASE `SR_IOT`; 
USE `SR_IOT`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE Zona(
id_zona INT AUTO_INCREMENT NOT NULL,
    alto INT NOT NULL,
    ancho INT NOT NULL,
    temperatura_ideal INT NOT NULL,
    hidratacion_diaria FLOAT NOT NULL,
    PRIMARY KEY (id_zona)
);

CREATE TABLE Aspersores(
id_aspersor INT AUTO_INCREMENT NOT NULL,
    id_zona INT NOT NULL,
    PRIMARY KEY(id_aspersor),
    FOREIGN KEY (id_zona) REFERENCES Zona(id_zona)
);

CREATE TABLE Plantas(
id_planta INT AUTO_INCREMENT NOT NULL,
    id_zona INT NOT NULL,
    tipo_planta VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_planta),
    FOREIGN KEY(id_zona) REFERENCES Zona(id_zona)
);

CREATE TABLE Arduinos(
id_arduino INT AUTO_INCREMENT NOT NULL,
    id_zona INT NOT NULL,
    PRIMARY KEY(id_arduino),
    FOREIGN KEY(id_zona) REFERENCES Zona(id_zona)
);
CREATE TABLE Sensores(
id_sensor INT AUTO_INCREMENT,
    id_arduino INT NOT NULL,
    id_zona INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_sensor),
    FOREIGN KEY(id_arduino) REFERENCES Arduinos(id_arduino),
    FOREIGN KEY(id_zona) REFERENCES Zona(id_zona)
);
CREATE TABLE Humedad_minuto(
    fecha DATETIME  NOT NULL,
    id_sensor INT NOT NULL,
    humedad INT NOT NULL,      
    PRIMARY KEY(id_sensor,fecha),
    FOREIGN KEY(id_sensor) REFERENCES Sensores(id_sensor)
);
CREATE TABLE Temperatura_minuto(
    fecha DATETIME  NOT NULL,
    id_sensor INT NOT NULL,
    temperatura INT NOT NULL,
    PRIMARY KEY(id_sensor,fecha),
    FOREIGN KEY(id_sensor) REFERENCES Sensores(id_sensor)
);
CREATE TABLE Lluvia_minuto(
    fecha DATETIME  NOT NULL,
    id_sensor INT NOT NULL,
    lluvia INT NOT NULL,
    PRIMARY KEY(id_sensor,fecha),
    FOREIGN KEY(id_sensor) REFERENCES Sensores(id_sensor)
);

CREATE TABLE LLuvias(
id_lluvia INT NOT NULL AUTO_INCREMENT,
    fecha_i DATETIME,
    fecha_f DATETIME,
    PRIMARY KEY (id_lluvia)
);

CREATE TABLE Riego(
id_riego INT NOT NULL AUTO_INCREMENT,
    fecha_i DATETIME,
    fecha_f DATETIME,
    cant_agua INT,
    id_zona INT,
    PRIMARY KEY (id_riego),
    FOREIGN KEY(id_zona) REFERENCES Zona(id_zona)
);

CREATE TRIGGER tr_ins_sensores
BEFORE INSERT ON Sensores
FOR EACH ROW 
SET NEW.id_zona =
(SELECT Arduinos.id_zona     
FROM Arduinos 
WHERE Arduinos.id_arduino = NEW.id_arduino);  


Zona(PK(id_zona), alto ,ancho,temperatura_ideal,hidratacion_diaria)
Aspersores(PK(id_aspersor),FK(id_zona))
Plantas(id_planta,id_zona,tipo_planta)   
Arduinos(id_arduino,id_zona)
Sensores(id_sensor,id_arduino,id_zona,nombre)
Humedad_minuto(fecha, id_sensor,humedad)
Temperatura_minuto(fecha,id_sensor,temperatura)
Lluvia_minuto(fecha, id_sensor,lluvia)
LLuvias(id_lluvia ,fecha_i,fecha_f)
Riego(id_riego,fecha_i,fecha_f,cant_agua,id_zona)