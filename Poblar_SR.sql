USE `SR_IOT`;

INSERT INTO Lugar(flujo_agua) VALUES (10);

INSERT INTO Zona(id_lugar, alto ,ancho,humedad_min,litros_metro) VALUES(1,20,70,30,40);
INSERT INTO Zona(id_lugar, alto ,ancho,humedad_min,litros_metro) VALUES(1,50,70,30,10);
INSERT INTO Zona(id_lugar, alto ,ancho,humedad_min,litros_metro) VALUES(1,60,70,12,15);
INSERT INTO Zona(id_lugar, alto ,ancho,humedad_min,litros_metro) VALUES(1,30,20,10,15);

INSERT INTO Aspersores(id_zona) VALUES(2);
INSERT INTO Aspersores(id_zona) VALUES(3);
INSERT INTO Aspersores(id_zona) VALUES(1);
INSERT INTO Aspersores(id_zona) VALUES(1);

INSERT INTO Arduinos(id_zona) VALUES(2);
INSERT INTO Arduinos(id_zona) VALUES(3);
INSERT INTO Arduinos(id_zona) VALUES(1);
INSERT INTO Arduinos(id_zona) VALUES(1);

INSERT INTO Sensores(id_arduino,tipo) VALUES(2,"sensor humedad");
INSERT INTO Sensores(id_arduino,tipo) VALUES(2,"sensor temperatura");
INSERT INTO Sensores(id_arduino,tipo) VALUES(2,"sensor lluvia");
INSERT INTO Sensores(id_arduino,tipo) VALUES(1,"sensor temperatura");
INSERT INTO Sensores(id_arduino,tipo) VALUES(3,"sensor lluvia");

INSERT INTO Humedad_minuto(id_sensor,fecha,humedad) VALUES(1,CURRENT_TIMESTAMP()+'1',70);
INSERT INTO Humedad_minuto(id_sensor,fecha,humedad) VALUES(2,CURRENT_TIMESTAMP()+'2',150);
INSERT INTO Humedad_minuto(id_sensor,fecha,humedad) VALUES(2,CURRENT_TIMESTAMP()+'3',50);

INSERT INTO Temperatura_minuto(id_sensor,fecha,temperatura) VALUES(1,CURRENT_TIMESTAMP()+'1',100);
INSERT INTO Temperatura_minuto(id_sensor,fecha,temperatura) VALUES(2,CURRENT_TIMESTAMP()+'2',150);
INSERT INTO Temperatura_minuto(id_sensor,fecha,temperatura) VALUES(1,CURRENT_TIMESTAMP()+'3',200);
INSERT INTO Temperatura_minuto(id_sensor,fecha,temperatura) VALUES(2,CURRENT_TIMESTAMP()+'4',250);

INSERT INTO LLuvias(id_sensor,fecha_i,fecha_f) VALUES (1,CURRENT_TIMESTAMP()+'1',CURRENT_TIMESTAMP()+'2');
INSERT INTO LLuvias(id_sensor,fecha_i,fecha_f) VALUES (2,CURRENT_TIMESTAMP()+'3',CURRENT_TIMESTAMP()+'4');
INSERT INTO LLuvias(id_sensor,fecha_i,fecha_f) VALUES (3,CURRENT_TIMESTAMP()+'5',CURRENT_TIMESTAMP()+'6');
INSERT INTO LLuvias(id_sensor,fecha_i,fecha_f) VALUES (4,CURRENT_TIMESTAMP()+'7',CURRENT_TIMESTAMP()+'8');
INSERT INTO LLuvias(id_sensor,fecha_i,fecha_f) VALUES (5,CURRENT_TIMESTAMP()+'9',CURRENT_TIMESTAMP()+'10');

INSERT INTO Riego(fecha_i,fecha_f,cant_agua,id_zona) VALUES (CURRENT_TIMESTAMP()+'1',CURRENT_TIMESTAMP()+'2',20,1);
INSERT INTO Riego(fecha_i,fecha_f,cant_agua,id_zona) VALUES (CURRENT_TIMESTAMP()+'3',CURRENT_TIMESTAMP()+'4',21,2);
INSERT INTO Riego(fecha_i,fecha_f,cant_agua,id_zona) VALUES (CURRENT_TIMESTAMP()+'5',CURRENT_TIMESTAMP()+'6',22,2);
INSERT INTO Riego(fecha_i,fecha_f,cant_agua,id_zona) VALUES (CURRENT_TIMESTAMP()+'7',CURRENT_TIMESTAMP()+'8',23,3);


Lugar(id_lugar,flujo_agua)
Zona(PK(id_zona),FK(id_lugar), alto ,ancho,humedad_min,litros_metro)
Aspersores(PK(id_aspersor),FK(id_zona))
Arduinos(id_arduino,id_zona)
Sensores(id_sensor,id_arduino,tipo)
Humedad_minuto(fecha, id_sensor,humedad)
Temperatura_minuto(fecha,id_sensor,temperatura)
LLuvias(id_sensor,fecha_i,fecha_f)
Riego(fecha_i,fecha_f,cant_agua,id_zona)

