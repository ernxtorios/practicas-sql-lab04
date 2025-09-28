-- Máximos y mínimos
-- Máximo
SELECT fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;

SELECT carrera_id, fecha_incorporacion
FROM platzi.alumnos
GROUP BY carrera_id, fecha_incorporacion
ORDER BY fecha_incorporacion DESC;

-- Obtenemos la fecha más actual en que una carrera recibió un alumno
SELECT carrera_id, MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;

-- Mínimo nombre alfabético de alumno y minimo id de tutor
-- El minimo (solo nombre)
SELECT MIN(nombre)
FROM alumnos;

-- El minimo por id de tutor ordenados por ID
SELECT tutor_id, MIN(nombre)
FROM platzi.alumnos
GROUP BY tutor_id
ORDER BY tutor_id;

