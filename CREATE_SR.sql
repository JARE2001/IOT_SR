DROP DATABASE IF EXISTS `SR_IOT`;
CREATE DATABASE `SR_IOT`; 
USE `SR_IOT`;
 
SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;
 
CREATE TABLE Lugar(
id_lugar INT AUTO_INCREMENT NOT NULL,
    flujo_agua FLOAT NOT NULL ,
    PRIMARY KEY (id_lugar)
);
CREATE TABLE Zona(
id_zona INT AUTO_INCREMENT NOT NULL,
    id_lugar INT NOT NULL,
    alto INT NOT NULL,
    ancho INT NOT NULL,
    humedad_min FLOAT NOT NULL,
    litros_metro FLOAT NOT NULL,
    PRIMARY KEY (id_zona),
    FOREIGN KEY (id_lugar) REFERENCES Lugar(id_lugar)
);
 
CREATE TABLE Aspersores(
id_aspersor INT AUTO_INCREMENT NOT NULL,
    id_zona INT NOT NULL,
    PRIMARY KEY(id_aspersor),
    FOREIGN KEY (id_zona) REFERENCES Zona(id_zona)
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
    tipo VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_sensor),
    FOREIGN KEY(id_arduino) REFERENCES Arduinos(id_arduino)
);
 
CREATE TABLE Humedad_minuto(
    fecha DATETIME  NOT NULL,
    id_sensor INT NOT NULL,
    humedad FLOAT NOT NULL,      
    PRIMARY KEY(id_sensor,fecha),
    FOREIGN KEY(id_sensor) REFERENCES Sensores(id_sensor)
);
CREATE TABLE Temperatura_minuto(
    fecha DATETIME  NOT NULL,
    id_sensor INT NOT NULL,
    temperatura FLOAT NOT NULL,
    PRIMARY KEY(id_sensor,fecha),
    FOREIGN KEY(id_sensor) REFERENCES Sensores(id_sensor)
);
 
CREATE TABLE LLuvias(
    fecha_i DATETIME NOT NULL,
    fecha_f DATETIME NOT NULL,
    id_sensor INT NOT NULL,
    PRIMARY KEY (id_sensor, fecha_i),
    FOREIGN KEY (id_sensor) REFERENCES Sensores(id_sensor)
);
 
CREATE TABLE Riego(
    fecha_i DATETIME NOT NULL, 
    fecha_f DATETIME NOT NULL,
    cant_agua FLOAT NOT NULL,
    id_zona INT NOT NULL,
    PRIMARY KEY (fecha_i, id_zona),
    FOREIGN KEY(id_zona) REFERENCES Zona(id_zona)
);


Lugar(id_lugar,flujo_agua)
Zona(PK(id_zona),FK(id_lugar), alto ,ancho,humedad_min,litros_metro)
Aspersores(PK(id_aspersor),FK(id_zona))
Arduinos(id_arduino,id_zona)
Sensores(id_sensor,id_arduino,tipo)
Humedad_minuto(fecha, id_sensor,humedad)
Temperatura_minuto(fecha,id_sensor,temperatura)
LLuvias(id_sensor,fecha_i,fecha_f)
Riego(fecha_i,fecha_f,cant_agua,id_zona)
PK(fecha_i,id_zona)