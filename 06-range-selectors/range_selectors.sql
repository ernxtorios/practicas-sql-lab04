USE sqlpractico;

-- Selectores de rango
SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (1, 2, 3, 4);

SELECT *
FROM platzi.alumnos
WHERE tutor_id >= 1
AND tutor_id <= 10;

SELECT *
FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;

-- Devuelve false pues el 3 no se encuentra entre 10 y 20
SELECT int4range(10, 20) @> 3;

-- Devuelve true pues el 3 sí se encuentra entre 1 y 20
SELECT int4range(1, 20) @> 3;

-- Solapamiento de rangos, valor booleano
SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0);

SELECT numrange(11.1, 19.9) && numrange(20.0, 30.0);

-- Valor más alto de un rango
SELECT UPPER(int8range(15, 25));

-- Valor más bajo de un rango
SELECT LOWER(int8range(15, 25));

-- Intersección entre rangos, devuelve el rango de intersección
SELECT int4range(10, 20) * int4range(15, 25);

-- Rango vacío, valor booleano
SELECT ISEMPTY(numrange(1, 5));

SELECT *
FROM platzi.alumnos
WHERE int4range(10, 20) @> tutor_id;

-- Intersección entre rangos de ids de tutores y ids de carreras
SELECT int4range(MIN(tutor_id), MAX(tutor_id)) * int4range(MIN(carrera_id), MAX(carrera_id))
FROM platzi.alumnos;

SELECT numrange(
	(SELECT MIN(tutor_id) FROM platzi.alumnos),
	(SELECT MAX(tutor_id) FROM platzi.alumnos)
) *  numrange(
	(SELECT MIN(carrera_id) FROM platzi.alumnos),
	(SELECT MAX(carrera_id) FROM platzi.alumnos)
);
