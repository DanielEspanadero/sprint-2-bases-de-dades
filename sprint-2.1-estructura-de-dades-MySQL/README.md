# 🧑🏻‍💻 INTRODUCCIÓN A MYSQL

## 🤷🏻‍♂️ DIFERENCIAS ENTRE SQL Y MYSQL

SQL es un lenguaje para operar con bases de datos y MySQL es un sistema de gestión de bases de datos. Es la principal diferencia entre uno y otro. Ambos conceptos están estrechamente ligados: MySQL es un software que gestiona bases de datos cuyo lenguaje de consulta es SQL.

Explicado para dummies, MySQL es un programa con el que creas y gestionas bases de datos (almacenas los datos, los modificas, los eliminas, los consultas, etcétera). SQL es el idioma en el que das las órdenes a MySQL.
<br>

## 📌 ESTRUCTURA DE UNA BASE DE DATOS (COMANDOS BÁSICOS).

Algunos de los comandos más básicos de SQL son:

```
CREATE DATABASE     -   Se utiliza para crear una nueva base de datos vacía.

DROP DATABASE       -   Se utiliza para eliminar completamente una base de datos existente.

CREATE TABLE        -   Se utiliza para crear una nueva tabla, donde la información se almacena realmente.

ALTER TABLE         -   Se utiliza para modificar una tabla ya existente.

DROP TABLE          -   Se utiliza para eliminar por completo una tabla existente.
```

Así pues los comandos recomendados al inicido de un documento a la hora de estructurar una base de datos SQL ⚠️ SOLO AL ESTRUCTURAR, NO HACER CON QUERIES ⚠️ serian estos:

```
DROP DATABASE IF EXISTS nombre_base;
CREATE DATABASE nombre_base;
USE nombre_base;
```

Es muy importante que al finalizar un comando de SQL pongamos punto y coma ;.

Una base de datos relacional es, en esencia, un conjunto de tablas (o relaciones) formadas por filas (registros) y columnas (campos); así, cada registro (cada fila) tiene una ID única, denominada clave y las columnas de la tabla contienen los atributos de los datos. Cada registro tiene normalmente un valor para cada atributo, lo que simplifica la creación de relaciones entre los puntos de datos.
<br>

## 📌 TIPOS DE DATOS

Después de la fase de diseño de una base de datos, y una vez se ha realizado el paso a tablas del mismo, en necesario crear las tablas correspondientes dentro de la base de datos. Para cada campo de cada una de las tablas, es necesario determinar el tipo de datos que contiene, para de esa forma ajustar el diseño de la base de datos, y conseguir un almacenamiento óptimo con la menor utilización de espacio.
Los tipos de datos que puede haber en un campo, se pueden agrupar en tres grandes grupos:

- Tipos numéricos
- Tipos de Fecha
- Tipos de Cadena
<br>

## 📌 TIPOS NUMÉRICOS

Existen tipos de datos numéricos, que se pueden dividir en dos grandes grupos, los que están en coma flotante (con decimales) y los que no.

- TinyInt:
Es un número entero con o sin signo. Con signo el rango de valores válidos va desde -128 a 127. Sin signo, el rango de valores es de 0 a 255

- Bit ó Bool:
Un número entero que puede ser 0 ó 1

- SmallInt:
Número entero con o sin signo. Con signo el rango de valores va desde -32768 a 32767. Sin signo, el rango de valores es de 0 a 65535.

- MediumInt:
Número entero con o sin signo. Con signo el rango de valores va desde -8.388.608 a 8.388.607. Sin signo el rango va desde 0 a16777215.

- Integer, Int:
Número entero con o sin signo. Con signo el rango de valores va desde -2147483648 a 2147483647. Sin signo el rango va desde 0 a 429.4967.295

- BigInt:
Número entero con o sin signo. Con signo el rango de valores va desde -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807. Sin signo el rango va desde 0 a 18.446.744.073.709.551.615.

- Float:
Número pequeño en coma flotante de precisión simple. Los valores válidos van desde -3.402823466E+38 a -1.175494351E-38, 0 y desde 1.175494351E-38 a 3.402823466E+38.

- xReal, Double:
Número en coma flotante de precisión doble. Los valores permitidos van desde -1.7976931348623157E+308 a -2.2250738585072014E-308, 0 y desde 2.2250738585072014E-308 a 1.7976931348623157E+308

- Decimal, Dec, Numeric:
Número en coma flotante desempaquetado. El número se almacena como una cadena.
<br>

## 📌 TIPOS DE FECHA

A la hora de almacenar fechas, hay que tener en cuenta que Mysql no comprueba de una manera estricta si una fecha es válida o no. Simplemente comprueba que el mes esta comprendido entre 0 y 12 y que el día esta comprendido entre 0 y 31.

- Date:
Tipo fecha, almacena una fecha. El rango de valores va desde el 1 de enero del 1001 al 31 de diciembre de 9999. El formato de almacenamiento es de año-mes-dia

- DateTime:
Combinación de fecha y hora. El rango de valores va desde el 1 de enero del 1001 a las 0 horas, 0 minutos y 0 segundos al 31 de diciembre del 9999 a las 23 horas, 59 minutos y 59 segundos. El formato de almacenamiento es de año-mes-dia horas:minutos:segundos

- TimeStamp:
Combinación de fecha y hora. El rango va desde el 1 de enero de 1970 al año 2037. El formato de almacenamiento depende del tamaño del campo:

```
14      -   AñoMesDiaHoraMinutoSegundo aaaammddhhmmss.
12      -   AñoMesDiaHoraMinutoSegundo aammddhhmmss.
8       -   AñoMesDia aaaammdd.
6       -   AñoMesDia aammdd.
4       -   AñoMes aamm.
2       -   Año aa.
```

- Time:
Almacena una hora. El rango de horas va desde -838 horas, 59 minutos y 59 segundos a 838, 59 minutos y 59 segundos. El formato de almacenamiento es de 'HH:MM:SS'

- Year:
Almacena un año. El rango de valores permitidos va desde el año 1901 al año 2155. El campo puede tener tamaño dos o tamaño 4 dependiendo de si queremos almacenar el año con dos o cuatro dígitos.
<br>

## 📌 TIPOS DE CADENA

- Char(n):
Almacena una cadena de longitud fija. La cadena podrá contener desde 0 a 255 caracteres.

- VarChar(n):
Almacena una cadena de longitud variable. La cadena podrá contener desde 0 a 255 caracteres.

Dentro de los tipos de cadena se pueden distinguir otros dos subtipos, los tipo Test y los tipo BLOB (Binary large Object)

La diferencia entre un tipo y otro es el tratamiento que reciben a la hora de realizar ordenamientos y comparaciones. Mientras que el tipo test se ordena sin tener en cuenta las Mayúsculas y las minúsculas, el tipo BLOB se ordena teniéndolas en cuenta.

Los tipos BLOB se utilizan para almacenar datos binarios como pueden ser ficheros.

- TinyText y TinyBlob:
Columna con una longitud máxima de 255 caracteres.

- Blob y Text:
Un texto con un máximo de 65535 caracteres.

- MediumBlob y MediumText:
Un texto con un máximo de 16.777.215 caracteres.

- LongBlob y LongText:
Un texto con un máximo de caracteres 4.294.967.295. Hay que tener en cuenta que debido a los protocolos de comunicación los paquetes pueden tener un máximo de 16 Mb.

- Enum:
Campo que puede tener un único valor de una lista que se especifica. El tipo Enum acepta hasta 65535 valores distintos

- Set:
Un campo que puede contener ninguno, uno ó varios valores de una lista. La lista puede tener un máximo de 64 valores.
<br>

## 📌 LLAVES Y OBLIGATORIEDAD

En las bases de datos relacionales, hay una serie de llaves y obligaciones que podemos llevar a cabo para unir tablas o seguir unas normas de estructuración.
Por un lado tenemos la llave primaria, que es la que vamos a utilizar como referencia para unirla varias tablas.
Luego tenemos la llave foranea, que es la que vamos a usar para enlazar el campo de una tabla con la llave primaria de otra tabla.
Unique se utiliza para campos que no se pueden repetir (Por ejemplo un DNI, un correo electronico...).
Auto-Increment sirve para aumentar en orden los campos de una tabla según vayan aumentando los registros (Solo pueden ser utilizados en llaves primarias).

```
PRIMARY KEY (nombre)
FOREIGN KEY (nombre) REFERENCES nombre_tabla (nombre)
UNIQUE
NOT NULL
AUTO-INCREMENT
```
<br>

## 📌 CREACIÓN DE TABLAS

Para crear una tabla hay que seguir una serie de normas a la hora de implementar los comandos. 

Aquí dejo un ejemplo de uno de los ejercicios realizados:

```
CREATE TABLE proveidors(
proveidor_id INT(11) NOT NULL AUTO_INCREMENT,
nom VARCHAR(60) NOT NULL,
carrer VARCHAR(60) NOT NULL,
numero INT(4) NOT NULL,
pis INT(3),
porta VARCHAR(11),
ciutat VARCHAR(30) NOT NULL,
codi_postal INT(10) NOT NULL,
pais VARCHAR(20) NOT NULL,
telefon VARCHAR(15) NOT NULL,
fax VARCHAR(20),
NIF VARCHAR(60) NOT NULL,
PRIMARY KEY(proveidor_id)
);
```
<br>

## 📌 INSERTAR DATOS EN UNA TABLA

Para insertar campos en una tabla lo haremos con el comando de INSERT INTO seguido del nombre de la tabla y, entre parentesis los campos de la tabla nombrada que quedamos añadir. Después añadimos el comando VALUE y entre parentesis los datos que queremos rellenar siguiendo el orden de los campos del parentesis anterior.

Aquí dejo un ejemplo de uno de los ejercicios:

```
INSERT INTO proveidors (nom, carrer, numero, pis, porta, ciutat, codi_postal, pais, telefon, fax, NIF)
VALUES ('Alco distribucions S.A', 'Carrer de la Glucosa', 16, 0, '', 'Barcelona', '08032', 'Espanya', '+34 687128964', '', 'A58375890');
```
<br>

## 🎥 VÍDEO DONDE RESUELVO EL EJERCICIO DE SPOTIFY Y TODAS LAS QUERIES

https://www.youtube.com/watch?v=Fh0eAzfvPTI