-- Crear taula localitat.[x]
-- Crear taula provincia.[x]
-- Crear taula clients. [x]
-- Crear taula comandes.[x]
-- Crear taula productes.[x]
-- Crear taula productes-de-comandes.[x]
-- Crear taula categoria pizza.[x]
-- Crear taula botiga.[x]
-- Crear taula empleat.[x]


DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE provincia(
    id_provincia INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_provincia)
);

CREATE TABLE localitats(
    id_localitat INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(45) NOT NULL,
    id_provincia INT(11) NOT NULL,
    PRIMARY KEY(id_localitat),
    FOREIGN KEY(id_provincia) REFERENCES provincia (id_provincia)
);

CREATE TABLE clients(
    id_client INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(60) NOT NULL,
    cognoms VARCHAR(60) NOT NULL,
    adreça VARCHAR(100) NOT NULL,
    codi_postal VARCHAR(25) NOT NULL,
    id_localitat INT(11) NOT NULL,
    telefon VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_client),
    FOREIGN KEY(id_localitat) REFERENCES localitats (id_localitat)
);

CREATE TABLE categoria_pizzes(
    id_categoria_pizzes INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_categoria_pizzes)
);

CREATE TABLE productes(
    id_producte INT(11) NOT NULL AUTO_INCREMENT,
    tipus_producte ENUM ('pizza', 'hamburguesa', 'beguda'),
    nom VARCHAR(45) NOT NULL,
    descripcio VARCHAR(300) NOT NULL,
    imatge BLOB,
    preu DECIMAL(10,2) NOT NULL,
    id_categoria_pizzes INT(11),
    PRIMARY KEY(id_producte),
    FOREIGN KEY(id_categoria_pizzes) REFERENCES categoria_pizzes (id_categoria_pizzes)
);

CREATE TABLE botiga(
    id_botiga INT(11) NOT NULL AUTO_INCREMENT,
    adreça VARCHAR(60) NOT NULL,
    codi_postal VARCHAR(25) NOT NULL,
    id_localitat INT(11) NOT NULL,
    PRIMARY KEY(id_botiga),
    FOREIGN KEY(id_localitat) REFERENCES localitats (id_localitat)
);

CREATE TABLE empleats(
    id_empleat INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(45) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    NIF VARCHAR(45) NOT NULL,
    telefon VARCHAR(30) NOT NULL,
    treball ENUM('cuiner', 'repartidor'),
    id_botiga INT(11) NOT NULL,
    PRIMARY KEY(id_empleat),
    FOREIGN KEY(id_botiga) REFERENCES botiga (id_botiga)
);

CREATE TABLE comanda_domicili(
    id_domicili INT(11) NOT NULL AUTO_INCREMENT,
    id_repartidor INT(11) NOT NULL,
    data_i_hora TIMESTAMP,
    PRIMARY KEY(id_domicili),
    FOREIGN KEY(id_repartidor) REFERENCES empleats (id_empleat)
);

CREATE TABLE comandes(
    id_comanda INT(11) NOT NULL AUTO_INCREMENT,
    data_i_hora DATETIME,
    tipus_comanda ENUM('domicili', 'botiga') NOT NULL,
    preu DECIMAL(6,2) NOT NULL,
    id_client INT(11) NOT NULL,
    id_domicili INT(11),
    id_botiga INT(11) NOT NULL,
    id_empleat INT(11) NOT NULL,
    PRIMARY KEY(id_comanda),
    FOREIGN KEY(id_client) REFERENCES clients (id_client),
    FOREIGN KEY(id_domicili) REFERENCES comanda_domicili (id_domicili),
    FOREIGN KEY(id_botiga) REFERENCES botiga (id_botiga),
    FOREIGN KEY(id_empleat) REFERENCES empleats (id_empleat)
);

CREATE TABLE producte_demanat(
    id_producte_demanat INT(11) NOT NULL AUTO_INCREMENT,
    id_producte INT(11) NOT NULL,
    quantitat INT(11) NOT NULL,
    id_comanda INT(11) NOT NULL,
    PRIMARY KEY(id_producte_demanat),
    FOREIGN KEY(id_producte) REFERENCES productes (id_producte),
    FOREIGN KEY(id_comanda) REFERENCES comandes (id_comanda)
);

INSERT INTO provincia (nom) VALUES ('Barcelona');
INSERT INTO provincia (nom) VALUES ('Tarragona');
INSERT INTO provincia (nom) VALUES ('Lleida');
INSERT INTO provincia (nom) VALUES ('Girona');

INSERT INTO localitats (nom, id_provincia) VALUES ('Barcelona', 1);
INSERT INTO localitats (nom, id_provincia) VALUES ('Santa Coloma', 1);
INSERT INTO localitats (nom, id_provincia) VALUES ('Badalona', 1);
INSERT INTO localitats (nom, id_provincia) VALUES ('Reus', 2);
INSERT INTO localitats (nom, id_provincia) VALUES ('Cambrils', 2);
INSERT INTO localitats (nom, id_provincia) VALUES ('Vilanova de la Barca', 3);
INSERT INTO localitats (nom, id_provincia) VALUES ('Lleida', 3);
INSERT INTO localitats (nom, id_provincia) VALUES ('Girona', 4);
INSERT INTO localitats (nom, id_provincia) VALUES ('Figueres', 4);

INSERT INTO botiga (adreça, codi_postal, id_localitat) VALUES ('Carrer de Valencia, 187', '08022', 1);
INSERT INTO botiga (adreça, codi_postal, id_localitat) VALUES ('Carrer d`Olot, 12', '17600', 9);
INSERT INTO botiga (adreça, codi_postal, id_localitat) VALUES ('carrer Segria, 3', '25690', 6);
INSERT INTO botiga (adreça, codi_postal, id_localitat) VALUES ('Carrer de Torres i Bages, 21', '17190', 8);

INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Marcos', 'Fernández Lopez', '71173294-P', '+34 689213465', 'cuiner', 1);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Albert', 'Puig Ramirez', '32298567-J', '+34 699234321', 'cuiner', 4);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Vanessa', 'Díaz Gil', '31987273-W', '+34 676543678', 'cuiner', 3);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Anna', 'Gomez Lopez', '71234577-C', '+34 690867892', 'cuiner', 2);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Jordi', 'Alba Ferrer', '62265743-A', '+34 690867892', 'repartidor', 4);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Juana', 'Vidal Lopez', '71187923-I', '+34 677222182', 'repartidor', 3);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Veronica', 'Sánchez Hernandez', '71422876-P', '+34 699191817', 'repartidor', 1);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('José', 'Perez Gomez', '12178828-K', '+34 681321767', 'repartidor', 2);

INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, telefon) VALUES ('Maria Concepción', 'Nevado Gil', 'Carrer de la Vitamina, 2', '08030', 1, '+34 632175192');
INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, telefon) VALUES ('Jonathan', 'De las Heras', 'Carrer Aragó, 12, 1o 1a', '08002', 1, '+34 633282199');
INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, telefon) VALUES ('Antonio', 'Correa Vilches', 'Carrer de Met Miravitjes, 1, bj 1a', '17600', 9, '+34 679992829');
INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, telefon) VALUES ('Triana', 'Roman Zafra', 'Carrer Dipòsit, 21, 1o 1a', '25690', 6, '+34 669272182');
INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, telefon) VALUES ('Luisa', 'Bustos Anxo', 'Carrer Pau Casals, 14, 4o 1a', '43850', 5, '+34 651558628');

INSERT INTO categoria_pizzes (nom) VALUES ('Clàssica');
INSERT INTO categoria_pizzes (nom) VALUES ('Especial');
INSERT INTO categoria_pizzes (nom) VALUES ('Vegana');
INSERT INTO categoria_pizzes (nom) VALUES ('Estiu');
INSERT INTO categoria_pizzes (nom) VALUES ('Hivern');

INSERT INTO productes (tipus_producte, nom, descripcio, preu, id_categoria_pizzes) VALUES ('pizza', 'Margarita', 'Els ingredients d`aquesta pionera no fallen, i són els preferits dels autèntics amants de la pizza tradicional: salsa de tomàquet, mozzarella, alfàbrega, orenga i oli d`oliva. A què us recorden els colors d`aquests ingredients? Sí, a la bandera italiana; un sabor de bandera.', 9.99, 1);
INSERT INTO productes (tipus_producte, nom, descripcio, preu, id_categoria_pizzes) VALUES ('pizza', 'Quatre formatges', 'El formatge fontina, originari de la Vall d`Aosta; el formatge gorgonzola, natural de Milà; el formatge parmesà, originari de la ciutat de Parma; i el formatge mozzarella, nascut a Campània.', 12.99, 1);
INSERT INTO productes (tipus_producte, nom, descripcio, preu, id_categoria_pizzes) VALUES ('pizza', 'Napolitana', 'Una de les peculiaritats d`aquesta pizza, també coneguda com a romana, és la seva massa: suau, esponjosa i una mica més gruixuda que l`ortodoxa italiana, amb les vores més altes. Els seus ingredients: salsa de tomàquet, formatge mozzarella, anxoves, orenga, tàperes i oli d`oliva.', 10.99, 1);
INSERT INTO productes (tipus_producte, nom, descripcio, preu) VALUES ('hamburguesa', 'Boví amb Pernil Serrano i pinya', 'Alguns dels seus ingredients són: Carn vedella, Pernil salat llescat, Pinya natural, Formatge Gouda, Oli d`oliva verge, Sal i Pebre negre mòlt.', 10.99);
INSERT INTO productes (tipus_producte, nom, descripcio, preu) VALUES ('hamburguesa', 'Shack burger de formatge', 'Una de les hamburgueses més famoses de Nova York. L`hamburguesa clàssica de Shake Shack, en presentació individual o doble. Totes les hamburgueses d`aquest tipus són de carn de vedella i per acompanyar-la, les famoses patates fregides arrissades.', 13.99);
INSERT INTO productes (tipus_producte, nom, descripcio, preu) VALUES ('hamburguesa', 'Clàssica de vedella, formatge i bacó', 'Dins dels ingredients d`aquesta delícia trobem: Pa de motlle, Carn de vedella, Herbes provençals, Mostassa de Dijon, Pebre negre mòlt i oli d`oliva verge.', 9.99);
INSERT INTO productes (tipus_producte, nom, descripcio, preu) VALUES ('beguda', 'Aigua', 'ampolla d`aigua de mig llitre', 1.50);
INSERT INTO productes (tipus_producte, nom, descripcio, preu) VALUES ('beguda', 'Coca-Cola', 'ampolla de coca-cola de 330 mil·lilitres', 2);

INSERT INTO comandes (tipus_comanda, preu, id_client, id_botiga, id_empleat) VALUES ('botiga', 23.48, 2, 1, 1);
INSERT INTO producte_demanat (id_producte, quantitat, id_comanda) VALUES (1, 2, 1);
INSERT INTO producte_demanat (id_producte, quantitat, id_comanda) VALUES (7, 1, 1);
INSERT INTO producte_demanat (id_producte, quantitat, id_comanda) VALUES (8, 2, 1);


-- Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat

SELECT pd.quantitat, p.nom AS Producte, p.tipus_producte, l.nom AS Localitat FROM producte_demanat pd INNER JOIN productes p ON pd.id_producte_demanat = p.id_producte
INNER JOIN comandes c ON c.id_comanda = p.id_producte
INNER JOIN localitats l ON l.id_localitat = p.id_producte WHERE p.tipus_producte = 'beguda' AND l.nom = 'Barcelona';


-- Llista quantes comandes ha efectuat un determinat empleat

SELECT e.nom Empleat, COUNT(c.id_comanda) AS Comandes FROM comandes c INNER JOIN empleats e ON c.id_empleat = e.id_empleat WHERE e.nom = 'Marcos';