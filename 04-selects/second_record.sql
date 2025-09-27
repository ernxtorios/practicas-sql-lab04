-- Segunda colegiatura más alta
-- 1º forma
-- Dentro del subquery lo que hace es comparar dos copias de la misma columna, 
-- por ejemplo:
-- a1.colegiatura = [2000, 4800, 1000, 5000, 3000] # Distinct 
-- a2.colegiatura = [2000, 4800, 1000, 5000, 3000] # Distinct
-- Para cada valor, obtiene los valores que son mayores o igual a él
-- 2000 -> 3000, 5000, 4800, 2000
-- 4800 -> 5000, 4800
-- 1000 -> 3000, 5000, 4800, 2000, 1000
-- 5000 -> 5000
-- 3000 -> 3000, 5000, 4800
-- Y finalmente obtiene la cuenta de ellos:
-- colegiatura = [2000, 4800, 1000, 5000, 3000] 
-- count = [4, 2, 5, 1, 3]
-- Esto se traduce a un ordenamiento con indexación y es por eso que 
-- elegir el 2 nos dará el segundo valor más alto de colegiatura. 
-- Este método es muy poco eficiente porque requiere de n^2 pasos 
-- (hizo 5 comparaciones por los 5 valores) mientras que un order by 
-- requiere en promedio nlogn pasos.
SELECT DISTINCT colegiatura
FROM platzi.alumnos AS a1
WHERE 2 = (
	SELECT COUNT(DISTINCT colegiatura)
	FROM platzi.alumnos AS a2
	WHERE a1.colegiatura <= a2.colegiatura);

-- 2º forma
SELECT DISTINCT colegiatura
FROM platzi.alumnos
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

-- Segunda colegiatura más alta de un tutor
SELECT DISTINCT colegiatura, tutor_id
FROM platzi.alumnos
WHERE tutor_id = 20
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

-- Todos los alumnos de la segunda mayor colegiatura
SELECT * 
FROM platzi.alumnos AS datos_alumnos
INNER JOIN (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;

-- 3º forma
SELECT * 
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
);

-- Segunda mitad de registros de la tabla
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
OFFSET (
	SELECT COUNT(*)/2
	FROM platzi.alumnos);