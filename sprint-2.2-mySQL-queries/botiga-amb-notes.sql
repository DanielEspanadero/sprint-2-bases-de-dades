-- ! Vídeo donde explican consultas usando una tienda como ejemplo: https://www.youtube.com/watch?v=ATBGLm7wC2w

USE tienda;
--1º- Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre FROM producto;
--2º- Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM producto;
--3º- Llista totes les columnes de la taula producto.
SELECT * FROM producto;
--4º- Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio, precio * 1.13 FROM producto;
--5º- Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
SELECT nombre AS 'nom de producto', precio AS euros, precio * 1.13 AS dolars FROM producto;
--6º- Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM producto;
--7º- Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM producto;
--8º- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(LEFT(nombre, 2)) AS fabricante FROM fabricante;
--9º- Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio) AS precio FROM producto;
--10º- Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM producto;
--11º- Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT f.codigo FROM fabricante f, producto p WHERE f.codigo = p.codigo_fabricante;
--12º- Llista el codi dels fabricants que tenen productes a la taula producto, eliminant els codis que apareixen repetits.
SELECT f.codigo FROM fabricante f, producto p WHERE f.codigo = p.codigo_fabricante GROUP BY f.codigo;
--13º- Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre ASC;
--14º- Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;
--15º- Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
--16º- Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM fabricante LIMIT 5;
--17º- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- ! MySQL Offset se usa para especificar de qué fila queremos que se recuperen los datos. Para ser precisos, especifique desde qué fila comenzar a recuperar. La compensación se usa junto con el LIMIT. Aquí, LIMIT no es más que restringir el número de filas de la salida.

--18º- Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
--19º- Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
--20º- Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- ! Vídeo donde explican las consultas multitabla (JOIN, ON...) casualmente usando una tienda como ejemplo: https://www.youtube.com/watch?v=E9m_ii37pNY

--21º- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT p.nombre AS nombre_producto, precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
--22º- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
SELECT p.nombre AS nombre_producto, precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
--23º- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT p.codigo AS codigo_p, p.nombre AS nombre_producto, f.codigo AS codigo_f, f.nombre AS codigo_nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
--24º- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT p.nombre AS nombre_producto, precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio ASC LIMIT 1;
--25º- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT p.nombre AS nombre_producto, precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;
--26º- Retorna una llista de tots els productes del fabricador Lenovo.
SELECT p.* FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo';
--27º- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT p.* FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Crucial' AND p.precio > 200;
--28º- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT p.* FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
--29º- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Utilitzant l'operador IN.
SELECT p.* FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
--30º- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
--31º- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
--32º- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE precio >= 180 ORDER BY precio DESC, p.nombre ASC;
--33º- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT f.* FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
--34º- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT f.nombre AS fabricante, p.nombre AS producto FROM fabricante f  LEFT JOIN producto p ON p.codigo_fabricante = f.codigo;
--35º- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT f.nombre AS fabricante, p.nombre AS producto FROM fabricante f  LEFT JOIN producto p ON p.codigo_fabricante = f.codigo  WHERE p.codigo is NULL;
--36º- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT f.nombre AS fabricante, p.nombre AS producto FROM fabricante f, producto p WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Lenovo';
--37º- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
--38º- Llista el nom del producte més car del fabricador Lenovo.
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre='Lenovo' ORDER BY precio DESC LIMIT 1;
--39º- Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre='Hewlett-Packard' ORDER BY precio ASC LIMIT 1;
--40º- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre='Lenovo'));
--41º- Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT p.* FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Asus' AND precio > (SELECT AVG(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus');
