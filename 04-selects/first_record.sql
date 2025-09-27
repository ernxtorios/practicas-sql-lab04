-- Selecciona el primer registro de la tabla
-- 1:
SELECT *
FROM platzi.alumnos
FETCH FIRST 1 ROWS ONLY;

-- 2
SELECT *
FROM platzi.alumnos
LIMIT 1;

-- 3 (Windows Function)
-- Una window function es la relación que existe entre el row
-- que queremos medir y la totalidad de rows en un grupo
SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos) AS alumnos_with_row_num
WHERE row_id = 1;

-- Selecciona los cinco primeros registros de la tabla
-- 1:
SELECT *
FROM platzi.alumnos
FETCH FIRST 5 ROWS ONLY;

-- 2
SELECT *
FROM platzi.alumnos
LIMIT 5;

-- 3 (Windows Function)
-- Una window function es la relación que existe entre el row
-- que queremos medir y la totalidad de rows en un grupo
SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id BETWEEN 1 AND 5;