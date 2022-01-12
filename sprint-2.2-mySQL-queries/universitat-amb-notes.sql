-- Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:
USE universidad;

--1º- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
--2º- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
--3º- Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE "1999%";
--4º- Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE "%K";
--5º- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
--6º- Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT apellido1, apellido2, p.nombre, d.nombre FROM persona p JOIN profesor pro ON p.id = pro.id_profesor JOIN departamento d ON d.id = pro.id_departamento ORDER BY apellido1, apellido2, p.nombre;
--7º- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar c ON c.id = am.id_curso_escolar JOIN asignatura a ON a.id = am.id_asignatura WHERE p.nif = '26902806M';
--8º- Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON p.id_departamento = d.id JOIN asignatura a ON a.id_profesor = p.id_profesor JOIN grado g ON g.id = a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
--9º- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.* FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar c ON c.id = am.id_curso_escolar WHERE anyo_fin = 2019 AND anyo_inicio = 2018;

-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

--1º- Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre as Departamento, p.apellido1, p.apellido2, p.nombre FROM persona p RIGHT JOIN profesor pro ON p.id = pro.id_profesor RIGHT JOIN departamento d ON pro.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
--2º- Retorna un llistat amb els professors que no estan associats a un departament.
SELECT p.* FROM persona p RIGHT JOIN profesor pro ON p.id = pro.id_profesor WHERE p.tipo = 'profesor' AND pro.id_profesor IS NULL;
--3º- Retorna un llistat amb els departaments que no tenen professors associats.
SELECT d.nombre Departamento FROM departamento d LEFT JOIN profesor pro ON d.id = pro.id_departamento WHERE pro.id_departamento IS NULL;
--4º- Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT p.nombre Profesor FROM persona p LEFT JOIN asignatura a  ON p.id = a.id_profesor  LEFT JOIN profesor pro ON p.id = pro.id_profesor  WHERE a.id_profesor is NULL AND p.tipo = "profesor"; 
--5º- Retorna un llistat amb les assignatures que no tenen un professor assignat.
SELECT * FROM asignatura WHERE id_profesor IS NULL;
--6º- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT DISTINCT d.nombre Departamento FROM profesor pro RIGHT JOIN departamento d ON pro.id_departamento = d.id LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

-- Consultes resum:

--1º- Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) AS alumnes FROM persona p WHERE p.tipo = 'alumno';
--2º- Calcula quants alumnes van néixer en 1999.
SELECT COUNT(*) AS alumnes_1999 FROM persona p WHERE p.tipo = 'alumno' AND YEAR(p.fecha_nacimiento) = 1999;
--3º- Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
SELECT d.nombre AS Departament, COUNT(*) AS num_professors FROM departamento d JOIN profesor pro ON d.id = pro.id_departamento GROUP BY d.id ORDER BY num_professors DESC;
--4º- Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre AS departament, COUNT(pro.id_profesor) AS num_professors FROM departamento d RIGHT JOIN profesor pro ON d.id = pro.id_departamento GROUP BY d.id;
--5º- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre AS grau, COUNT(a.id_grado) AS Asignatures FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY grau ORDER BY Asignatures DESC;
--6º- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.nombre AS grau, COUNT(*) AS num_assignatures FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY g.id HAVING num_assignatures > 40;
--7º- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre AS grau, a.tipo AS tipus, SUM(a.creditos) AS credits FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY a.tipo, g.id;
--8º- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT c.anyo_inicio, COUNT(distinct id_alumno) AS alumnes FROM curso_escolar c JOIN alumno_se_matricula_asignatura a ON a.id_curso_escolar = c.id GROUP BY c.id;
--9º- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS assignatures FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor GROUP BY p.id;
--10º- Retorna totes les dades de l'alumne més jove.
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
--11º- Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.
SELECT p.tipo, p.nombre, p.apellido1, p.apellido2, a.id AS asignatura, d.nombre AS departamento FROM persona p JOIN profesor pro ON p.id = pro.id_profesor JOIN departamento d ON d.id = pro.id_departamento LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor WHERE a.id is NULL;