SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE "1999%";
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE "%K";
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1, apellido2, p.nombre, d.nombre FROM persona p JOIN profesor pro ON p.id = pro.id_profesor JOIN departamento d ON d.id = pro.id_departamento ORDER BY apellido1, apellido2, p.nombre;
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar c ON c.id = am.id_curso_escolar JOIN asignatura a ON a.id = am.id_asignatura WHERE p.nif = '26902806M';
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON p.id_departamento = d.id JOIN asignatura a ON a.id_profesor = p.id_profesor JOIN grado g ON g.id = a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.* FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar c ON c.id = am.id_curso_escolar WHERE anyo_fin = 2019 AND anyo_inicio = 2018;
SELECT d.nombre as Departamento, p.apellido1, p.apellido2, p.nombre FROM persona p RIGHT JOIN profesor pro ON p.id = pro.id_profesor RIGHT JOIN departamento d ON pro.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.* FROM persona p RIGHT JOIN profesor pro ON p.id = pro.id_profesor WHERE p.tipo = 'profesor' AND pro.id_profesor IS NULL;
SELECT d.nombre Departamento FROM departamento d LEFT JOIN profesor pro ON d.id = pro.id_departamento WHERE pro.id_departamento IS NULL;
SELECT p.nombre Profesor FROM persona p LEFT JOIN asignatura a  ON p.id = a.id_profesor  LEFT JOIN profesor pro ON p.id = pro.id_profesor  WHERE a.id_profesor is NULL AND p.tipo = "profesor"; 
SELECT * FROM asignatura WHERE id_profesor IS NULL;
SELECT DISTINCT d.nombre Departamento FROM profesor pro RIGHT JOIN departamento d ON pro.id_departamento = d.id LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;
SELECT COUNT(*) AS alumnes FROM persona p WHERE p.tipo = 'alumno';
SELECT COUNT(*) AS alumnes_1999 FROM persona p WHERE p.tipo = 'alumno' AND YEAR(p.fecha_nacimiento) = 1999;
SELECT d.nombre AS Departament, COUNT(*) AS num_professors FROM departamento d JOIN profesor pro ON d.id = pro.id_departamento GROUP BY d.id ORDER BY num_professors DESC;
SELECT d.nombre AS departament, COUNT(pro.id_profesor) AS num_professors FROM departamento d RIGHT JOIN profesor pro ON d.id = pro.id_departamento GROUP BY d.id;
SELECT g.nombre AS grau, COUNT(a.id_grado) AS Asignatures FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY grau ORDER BY Asignatures DESC;
SELECT g.nombre AS grau, COUNT(*) AS num_assignatures FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY g.id HAVING num_assignatures > 40;
SELECT g.nombre AS grau, a.tipo AS tipus, SUM(a.creditos) AS credits FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY a.tipo, g.id;
SELECT c.anyo_inicio, COUNT(distinct id_alumno) AS alumnes FROM curso_escolar c JOIN alumno_se_matricula_asignatura a ON a.id_curso_escolar = c.id GROUP BY c.id;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS assignatures FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor GROUP BY p.id;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT p.tipo, p.nombre, p.apellido1, p.apellido2, a.id AS asignatura, d.nombre AS departamento FROM persona p JOIN profesor pro ON p.id = pro.id_profesor JOIN departamento d ON d.id = pro.id_departamento LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor WHERE a.id is NULL;