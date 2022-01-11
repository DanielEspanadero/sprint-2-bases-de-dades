# Expresiones regulares en MongoDB

Se utilizan con el comando $regex:
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

