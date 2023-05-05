CREATE DATABASE desafio2_raul_low_314;

\c desafio2_raul_low_314

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);

INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 99, '01/08/2021', 'Página' );

-- Seleccionar todo
SELECT * FROM inscritos;

-- ¿Cuántos registros hay?
SELECT COUNT(*) AS total_registros FROM inscritos;

-- ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) AS total_inscritos FROM inscritos;

-- ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT * FROM inscritos ORDER BY fecha ASC LIMIT 5;
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

-- ¿Cuántos inscritos hay por día?
SELECT fecha, SUM(cantidad) AS inscritos_dia FROM inscritos GROUP BY fecha ORDER BY fecha ASC;

-- ¿Cuántos inscritos hay por fuente?
SELECT fuente, SUM(cantidad) AS inscritos_fuente FROM inscritos GROUP BY fuente;

-- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS inscritos_dia FROM inscritos GROUP BY fecha ORDER BY inscritos_dia DESC LIMIT 1;

-- ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?																			  
SELECT fecha, SUM(cantidad) AS inscritos_dia_blog FROM inscritos WHERE fuente = 'Blog' GROUP BY fecha ORDER BY inscritos_dia_blog DESC LIMIT 2;

-- ¿Cuántas personas en promedio se inscriben en un día?
SELECT ROUND(AVG(suma_dia), 2) AS promedio_diario FROM (SELECT SUM(cantidad) AS suma_dia FROM inscritos GROUP BY fecha) AS mi_tabla;

-- ¿Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad) AS inscritos_dia FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50 ORDER BY fecha ASC;

--¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
SELECT fecha, ROUND(AVG(cantidad), 2) AS inscritos_dia FROM inscritos WHERE fecha >= '01/03/2021' GROUP BY fecha ORDER BY fecha ASC;
