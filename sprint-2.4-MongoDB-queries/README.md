# 🧑🏻‍💻 MONGODB QUERIES
<br>

## 📌 Conceptos básicos para realizar queries
<br>

El comando que siempre vamos a utilizar para realizar queries en MongoDB es .find(), que sería el equivalente al SELECT en SQL.

Una consulta sencilla sería esta:
```
db.nombreColección.find()                       -   Con este comando se obtienen todos los registros que están en la colección.
```

Para devolver esa o cualquier otra consulta en un formato más amigable añadiremos un .pretty() al final de la consulta.

```
db.nombreColección.find().pretty()              -   Es exactamente igual que el comando anterior, pero más amigable.
```

Con .find() tambien podemos buscar cosas más concretas si le damos un argumento:

```
db.nombreCol.find({name: 'Toni Soprano'})       -   Devuelve los campos y valores de este objeto.
```

Si queremos limitar los resultados, añadiremos .limit(n) al final de nuestra busqueda, y si queremos saltarnos alguno de los primeros resultados, añadiremos .skip(n) al final.

```
db.nombreCol.find({age: 42}).limit(1)           -   Devuelve el primer campo con ese valor (Es como LIMIT en SQL).

db.nombreCol.find({age: 42}).limit(1).skip(2)   -   Devuelve un campo con ese valor saltandose los dos primeros.

```

## 📌 Proyecciones
<br>

Una proyección se utiliza para devolver un conjunto determinado de campos de un documento. En los ejemplos anteriores, estábamos devolviendo todos los campos de un documento, pero es posible que no necesitemos todos. Es decir, que en lugar de hacer un SELECT *, realizaremos un SELECT nombrecampo. Las proyecciones se tienen que incorporar en el segundo parámetro del comando .find(). Las proyecciones se realizan indicando el nombre del campo, añadiendo un 1 si queremos mostrarlo y un 0 si no queremos.

```
    db.genbetadev.find({},{"nombre":1});
    { "_id" : 1, "nombre" : "rubenfa" }
    { "_id" : 2, "nombre" : "Txema Rodríguez" }
    { "_id" : 3, "nombre" : "Cecilio Álvarez" }
```

En este caso estamos aplicando un filtro vacío (se devuelven todos los documentos), y estamos diciendo que solo queremos devolver el campo nombre. MongoDB, por defecto, nos devuelve también el _id. Para no mostrarlo deberemos especificar de forma explícita que no lo queremos. Se haría así:

```
    db.genbetadev.find({},{"nombre":1,"_id":0});
    { "nombre" : "rubenfa" }
    { "nombre" : "Txema Rodríguez" }
    { "nombre" : "Cecilio Álvarez" }
```


## 📌 Operadores de consulta
<br>

Existen direfentes tipos de operadores para realizar consultan, entre ellos estan los operadores de comparación, lógicos, de elemento, de evaluación, geoespaciales, de formación, bit a bit, de proyección y misceláneos.
A continuación los veremos más detalladamente.


## 📌 Operadores de comparación
<br>

Los operadores de comparación se usan en filtros que, en vez de pasar únicamente un valor, pasan un nuevo documento que contiene las comparaciones a realizar. Por ejemplo, en vez de expresar { "edad": 19 } para obtener las personas cuya edad sea exactamente 19, indico un objeto { "edad" : {$gt: 19} } para expresar las personas cuya edad sea mayor que 19.

```
$eq             -   Coincide con valores que son iguales a un valor especificado (Equal).

$gt             -   Coincide con valores que son mayores que un valor especificado (greater than).

$gte            -   Coincide con valores que son mayores o iguales a un valor especificado (greater than or equal).

$in             -   Coincide con cualquiera de los valores especificados en una matriz.

$lt             -   Coincide con valores que son menores que un valor especificado (lower than).

$lte            -   Coincide con valores que son menores o iguales a un valor especificado (lower than or equal).

$ne             -   Coincide con todos los valores que no son iguales a un valor especificado (Not equal).

$nin            -   No coincide con ninguno de los valores especificados en una matriz.
```


## 📌 Operadores lógicos
<br>

Los operadores lógicos permiten realizar filtrados atendiendo a varias condiciones:

```
$or             -   Filtra los documentos que cumplan alguna de las condiciones del array. Por ejemplo: { $or: [ { "edad": {$gte: 60}}, { "edad": {$lte:10}} ]} filtra los documentos cuyo campo edad tenga valor mayor o igual que 60 O valor menor o igual que 10.

$and            -   Similar a $or, pero en este caso los documentos deben cumplir todas las condiciones del array. Su uso puede resultar superfluo teniendo en cuenta que en un filtro normal, las condiciones indicadas se juntan mediante operadores lógicos Y. Normalmente se usa en situaciones en las que se deben aplicar varias condiciones sobre un mismo campo. En una consulta normal, los campos deben ser únicos.
```


## 📌 Operadores de elemento
<br>

```
$exists         -   Coincide con documentos que tienen el campo especificado.

$type           -   Selecciona documentos si un campo es del tipo especificado.
```


## 📌 Operadores de evaluación
<br>

```
$expr           -   Permite el uso de expresiones de agregación dentro del lenguaje de consulta.

$jsonSchema     -   Valide documentos contra el esquema JSON dado.

$mod            -   Realiza una operación de módulo sobre el valor de un campo y selecciona documentos con un resultado especificado.

$regex          -   Selecciona documentos donde los valores coinciden con una expresión regular especificada.

$text           -   Realiza la búsqueda de texto.

$where          -   Coincide con documentos que satisfacen una expresión de JavaScript.
```


## 📌 Operadores geoespaciales
<br>

```
$geoIntersects      -   Selecciona geometrías que intersecan con una geometría GeoJSON . El índice 2dsphere admite $geoIntersects.

$geoWithin          -   Selecciona geometrías dentro de una geometría GeoJSON delimitadora . Los índices 2dsphere y 2d admiten $geoWithin.

$near               -   Devuelve objetos geoespaciales en la proximidad de un punto. Requiere un índice geoespacial. Los índices 2dsphere y 2d admiten $near.

$nearSphere         -   Devuelve objetos geoespaciales en la proximidad de un punto en una esfera. Requiere un índice geoespacial. Los índices 2dsphere y 2d admiten $nearSphere.
```


## 📌 Operadores de formación
<br>

```
$all                -   Coincide con matrices que contienen todos los elementos especificados en la consulta.

$elemMatch          -   Selecciona documentos si el elemento en el campo de la matriz coincide con todas las $elemMatchcondiciones especificadas.

$size               -   Selecciona documentos si el campo de matriz tiene un tamaño especificado.
```


## 📌 Operadores bit a bit
<br>

```
$bitsAllClear       -   Coincide con valores numéricos o binarios en el que un conjunto de posiciones de bits de todo tienen un valor de 0.

$bitsAllSet         -   Coincide con valores numéricos o binarios en el que un conjunto de posiciones de bits de todo tienen un valor de 1.

$bitsAnyClear       -   Coincide con valores numéricos o binarios en los que cualquier bit de un conjunto de posiciones de bit tiene un valor de 0.

$bitsAnySet         -   Coincide con valores numéricos o binarios en los que cualquier bit de un conjunto de posiciones de bit tiene un valor de 1.
```


## 📌 Operadores de proyección
<br>

```
$               -   Proyecta el primer elemento de una matriz que coincide con la condición de consulta.

$elemMatch      -   Proyecta el primer elemento de una matriz que coincide con la $elemMatchcondición especificada.

$meta           -   Proyecta la puntuación del documento asignada durante la $textoperación.

$slice          -   Limita el número de elementos proyectados desde una matriz. Admite saltos y límites de cortes.
```


## 📌 Operadores misceláneos
<br>

```
$comment        -   Agrega un comentario a un predicado de consulta.

$rand           -   Genera un flotante aleatorio entre 0 y 1.
```


## 📌 Expresiones regulares en MongoDB

Se utilizan con el operador $regex:
Proporciona capacidades de expresión regular para cadenas de coincidencia de patrones en consultas. MongoDB utiliza expresiones regulares compatibles con Perl (es decir, "PCRE") versión 8.42 con compatibilidad con UTF-8.

Opciones para usar en expresiones regulares:

- i: Insensibilidad a mayúsculas y minúsculas para que coincida con mayúsculas y minúsculas. El siguiente ejemplo utiliza la opción i para realizar una coincidencia que no distingue entre mayúsculas y minúsculas para documentos con un valor sku que comienza con ABC.

```
db.products.find( { sku: { $regex: /^ABC/i } } );
```

- m: Para patrones que incluyen anclas (es decir, ^para el inicio, $para el final), haga coincidir el principio o el final de cada línea para cadenas con valores de varias líneas. Sin esta opción, estos anclajes coinciden al principio o al final de la cadena. Si el patrón no contiene anclas o si el valor de la cadena no tiene caracteres de nueva línea (p \n. ej. ), la mopción no tiene efecto. El siguiente ejemplo usa la opción m para hacer coincidir líneas que comienzan con la letra S para cadenas de varias líneas:

```
db.products.find( { description: { $regex: /^S/, $options: 'm' } } );
```

- x: Capacidad "ampliada" para ignorar todos los caracteres de espacio en blanco en el $regexpatrón a menos que se escapen o se incluyan en una clase de caracteres. Además, ignora los caracteres intermedios e incluye un carácter almohadilla/almohadilla ( #) sin escape y la siguiente línea nueva, por lo que puede incluir comentarios en patrones complicados. Esto solo se aplica a los caracteres de datos; los caracteres de espacio en blanco nunca pueden aparecer dentro de secuencias de caracteres especiales en un patrón. El siguiente ejemplo usa la opción x para ignorar los espacios en blanco y los comentarios, denotados por # y que terminan con \n en el patrón coincidente:

```
db.products.find({sku: {$regex: pattern, $options: "x" }});
```

- s: Permite que el carácter de punto (es decir, .) coincida con todos los caracteres, incluidos los caracteres de nueva línea.

- / /: Para delimitar la expresión regular.

- ^: Significa comenzar desde el principio.

- .: Comodin, cualquier caracter.

- *: Cualquier caracter varias veces.

