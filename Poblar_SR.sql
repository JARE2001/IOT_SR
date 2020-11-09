
USE `SR_IOT`;
INSERT INTO Zona(ancho,alto temperatura_ideal,hidratacion_diaria) VALUES(1,2,22,1);
INSERT INTO Zona(ancho,alto temperatura_ideal,hidratacion_diaria) VALUES(3,5,22,1);
INSERT INTO Zona(ancho,alto temperatura_ideal,hidratacion_diaria) VALUES(4,6,22,1);

INSERT INTO Aspersores(id_zona) VALUES(2);
INSERT INTO Aspersores(id_zona) VALUES(3);

INSERT INTO Plantas(id_zona,tipo_planta) VALUES(2,"Fresa");
INSERT INTO Plantas(id_zona,tipo_planta) VALUES(2,"Manzana");

INSERT INTO Arduinos(id_zona) VALUES(2);
INSERT INTO Arduinos(id_zona) VALUES(3);

INSERT INTO Sensores(id_arduino,nombre) VALUES(1,"sensor humedad");
INSERT INTO Sensores(id_arduino,nombre) VALUES(2,"sensor temperatura");

INSERT INTO Humedad_minuto(id_sensor,fecha,humedad) VALUES(1,CURRENT_TIMESTAMP(),100);
INSERT INTO Humedad_minuto(id_sensor,fecha,humedad) VALUES(2,CURRENT_TIMESTAMP(),150);

INSERT INTO Temperatura_minuto(id_sensor,fecha,temperatura) VALUES(1,CURRENT_TIMESTAMP(),100);
INSERT INTO Temperatura_minuto(id_sensor,fecha,temperatura) VALUES(2,CURRENT_TIMESTAMP(),150);

INSERT INTO Lluvia_minuto(id_sensor,fecha,lluvia) VALUES(1,CURRENT_TIMESTAMP(),100);
INSERT INTO Lluvia_minuto(id_sensor,fecha,lluvia) VALUES(2,CURRENT_TIMESTAMP(),150);

Zona(PK(id_zona), alto ,ancho,temperatura_ideal,hidratacion_diaria)
Aspersores(PK(id_aspersor),FK(id_zona))
Plantas(id_planta,id_zona,tipo_planta)   
Arduinos(id_arduino,id_zona)
Sensores(id_sensor,id_arduino,id_zona,nombre)
Humedad_minuto(fecha,hora, id_sensor,humedad)
Temperatura_minuto(fecha,id_sensor,temperatura)
Lluvia_minuto(fecha,hora, id_sensor,lluvia)
LLuvias(id_lluvia ,fecha_i,fecha_f)
Riego(id_riego,fecha_i,fecha_f,cant_agua,id_zona)