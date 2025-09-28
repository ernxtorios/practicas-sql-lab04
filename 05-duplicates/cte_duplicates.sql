WITH row_number_alumnos AS (
	SELECT id,
	ROW_NUMBER() OVER(PARTITION BY
					  nombre, 
					  apellido,
					  email,
					  colegiatura,
					  fecha_incorporacion,
					  carrera_id,
					  tutor_id
					  ORDER BY id ASC) AS row,
	*
	FROM platzi.alumnos)

-- Duplicates
SELECT * FROM row_number_alumnos WHERE row > 1;