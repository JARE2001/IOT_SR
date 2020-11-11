USE `SR_IOT`;
SELECT * FROM Lugar;

SELECT * FROM Zona;

SELECT * FROM Aspersores;

SELECT * FROM Arduinos;

SELECT * FROM Sensores;

SELECT * FROM Humedad_minuto;

SELECT * FROM Temperatura_minuto;

SELECT * FROM LLuvias;

SELECT * FROM Riego;



DELETE FROM Humedad_minuto;

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