# MONGODB
<br>

## INTRODUCCIÓN A MONGODB
<br>

MongoDB es una base de datos documental, en mongo cada registro es un documento que no es más que una estructura de datos compuesta por pares campo-valor.
Los documentos son similarea a objetos JSON e incluso los valores de los campos pueden incluir tambien otros documentos, arrays, o arrays de documentos. JSON es fundamental para trabajar con MongoDB.

```
documento
{
    name: 'Sue',                                field: value,
    age: 26,                                    field: value,
    status: 'A',                                field: value,
    groups: ['news', 'sports']                  field: value
}
```

Una de las principales ventajas de usar documentos es que un objeto JSON, en general, va a corresponder a los tipos de datos que uses en tu aplicación (Dependiendo del lenguaje de programación que estés utilizando).
Otra de las ventajas es que el hecho de poder almacenar un objeto JSON complejo con objetos anidados en un registro de la base de datos, elimina por completo la necesidad de JOINS como es en SQL y las consultas son muy sencillas.

MongoDB almacena los documentos en colecciones, que son el equivalente a las tablas en las bases de datos relacionales.

COMANDOS BÁSICOS:

```
show dbs                                            -   Muestra la base de datos.

use ('nombre de la base')                           -   Usa la base de datos que le     digamos (Si no la encuentra, la creará).

db.dropDatabase()                                   -   Borra ba lase de datos en la que nos encontremos.

db                                                  -   Muestra la base de datos en la que estamos.

db.createCollection('Nombre de la colección')       -   Crea una colección.

show collections                                    -   Muestra las colecciones de una base de datos

db.nombreCol.deleteOne({"product" : "bread"})       -   Borra un documento de la colección

db.nombreCol.deleteMany({"product" : "bottles"})    -   Elimina todos los documentos de una colección.

db.nombreCol.renameCollection('nombre')             -   Cambia el nombre de una colección.

db.nombreColeccion.drop();                          -   Elimina toda la colección.
```

A diferencia de una base de datos relacional, no hay que definir la estructura de las colecciones ya que eso a mongo no le interesa, la estructura del registro estará dada por el mismo documento que inserte.

Para insertar documentos en una colección, se puede hacer de varias maneras:

INSERTAR DOCUMENTOS DE UNO EN UNO:
```
db.nombreDeColección.insertOne (
    {
    campo: valor,
    campo: valor
    }
);                         -   Insertar un documento en una colección
```

INSERTAR VARIOS DOCUMENTOS A LA VEZ:
```
db.nombreDeColección.insertMany (
    [
        {
        campo: valor,
        campo: valor
        },
        {
        campo: valor,
        campo: valor
        },
        {
        campo: valor,
        campo: valor
        }
    ]
);                            -   Inserta varios documentos en una colección
```

Para poder trabajar en local, tenemos que tener el servicio inicializado y para ello utilizaremos el siguiente comando:

```
mongod --config /usr/local/etc/mongod.conf --fork
```