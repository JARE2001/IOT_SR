USE `SR_IOT`;
--Pruebas Zona
SELECT * FROM Zona;
--Prueba Aspesrores
SELECT * FROM Aspersores;
--Prueba Plantas
SELECT * FROM Plantas;

SELECT * FROM Arduinos;

SELECT * FROM Sensores;

SELECT * FROM Humedad_minuto;

SELECT * FROM Temperatura_minuto;

SELECT * FROM Lluvia_minuto;



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