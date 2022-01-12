# 🧑🏻‍💻 MY SQL QUERIES

## 🗂 ORDEN DE LOS COMANDOS PARA REALIZAR CONSULTAS

Algo que me ayudó bastante a la hora de realizar consultas es memorizar el orden de los comandos principales (Tambien hay subcomandos dentro de esos comandos), ya que hay que ponerlos en un orden concreto o sino no funcionará. 

El orden de los comandos es el siguiente:

```
    🔹 1º SELECT - columnas.
    🔹 2º FROM - tablas.
    🔹 3º JOIN - mas tablas.
    🔹 4º WHERE - filtrar filas.
    🔹 5º GROUP BY - agrupar filas.
    🔹 6º HAVING - filtrar grupos.
    🔹 7º ORDER BY - ordenar filas.
    🔹 8º LIMIT - limita las búsquedas
```
<br>

## 📌 COMANDOS Y SUBCOMANDOS

Una vez memorizado el orden de los comandos pricipales para realizar consultas, hay que tener en cuenta que existen otros muchos subcomandos que servirán para buscar aquello que necesitemos, personalmente estos no me los se todos, pero siempre puedo venir aquí para hechar un vistazo.

Aquí dejo una lista de los comandos y subcomandos que utilizé para realizar todos los ejercicios de consultas.

```
    🔹 SELECT.

        🔸AS.                               -   Sirve para poner un alias a la columna.

        🔸UPPER (Columna).                  -   Muestra todos los registros en mayusculas.

        🔸LOWER (Columna).                  -   Muestra todos los registros en minusculas.

        🔸 ROUND (Columna_numerica).        -   Redondea un número decimal a entero.

        🔸 TRUNCATE (Columna numeros, 0).   -   Quita decimales a un decimal.

        🔸 DISTINCT.                        -   Se utiliza para devolver solo valores distintos.

        🔸 MAX (Columna_numerica).          -   Devuelve el valor máximo en un conjundo de valores.

        🔸 MIN (Columna_numerica).          -   Devuelve el valor mínimo en un conjunto de valores.

        🔸 AVG (Columna_numerica)           -   Halla la media.

        🔸 COUNT (Columna).                 -   Muestra el número de resultados de una sentencia SELECT.

        🔸 SUM (Columna).                   -   Suma los valores de las columnas de una tabla.

        🔸 SUBSTR (Columna, 1, 2).          -   Extrae una subcadena de una cadena. el primer número indica la posición de comienzo y el segundo número los caracteres que se extraen.

    🔹 FROM.
    
    🔹 JOIN, INNER JOIN, LEFT JOIN, RIGHT JOIN.

        🔸 ON.                              -   Sirve para unir los campos y valores de las llaves primarias de diferentes tablas.

    🔹 WHERE.

        🔸 AND.                             -   Sirve para añadir una segunda condición al WHERE.

        🔸 IN.                              -   Determina si un valor coincide con cualquier valor en una lista de valores.

        🔸 OR.                              -   Sirve para seleccionar si se cumple una condición u otra. Al contrario que AND, con OR solo se tiene que cumplir una condición.

        🔸 LIKE.                            -   Sirve para realizar búsquedas de patrones en las tablas mediante el uso de comodines.

        🔸 YEAR (Fecha).                    -   Devuelve la parte del año para una fecha dada.

        🔸 IS NULL.                         -   Devuelve los valores nulos.

    🔹 GROUP BY.

    🔹 HAVING.

    🔹 ORDER BY.

        🔸 ASC.                             -   Ordena el resultado de menor a mayor.

        🔸 DESC.                            -   Ordena el resultado de mayor a menor.

    🔹 LIMIT.

        🔸 OFFSET.                          -   Sirve para omitir varios datos en el LIMIT. 
```


- Ejemplos de LIKE:

```
SELECT * FROM clientes WHERE nombre LIKE '%m%';
```
En el código superior estamos buscando los clientes que contengan una ‘m’ en el nombre.

```
SELECT * FROM clientes WHERE nombre LIKE 'M%';
```
En el código superior estamos buscando los clientes cuyo nombre comienza por ‘M’.

```
SELECT * FROM clientes WHERE nombre LIKE '%a';
```
En el código superior estamos buscando los clientes cuyo nombre termina con ‘a’.

```
SELECT * FROM clientes WHERE nombre LIKE '_a%';
```
En el código superior estamos buscando los clientes cuyo nombre tiene como segundo caracter la ‘a’.

```
SELECT * FROM clientes WHERE nombre LIKE '_______';
```
En el código superior estamos buscando los clientes cuyo nombre tiene 7 caracteres de longitud.

```
SELECT * FROM clientes WHERE nombre LIKE '%a%' or nombre LIKE '%r%' ;
```
En el código superior estamos buscando los clientes cuyo nombre tiene una ‘a’ y una ‘r’.
<br>

## 🎥 VÍDEO DONDE RESUELVO EL EJERCICIO DE SPOTIFY Y TODAS LAS QUERIES

https://www.youtube.com/watch?v=Fh0eAzfvPTI