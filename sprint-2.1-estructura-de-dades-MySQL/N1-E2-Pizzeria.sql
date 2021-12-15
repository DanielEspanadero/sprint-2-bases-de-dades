-- Crear taula localitat.
-- Crear taula provincia.
-- Crear taula clients. 
-- Crear taula comandes.
-- Crear taula productes.
-- Crear taula productes-de-comandes.
-- Crear taula categoria pizza.
-- Crear taula botiga.
-- Crear taula empleat.



DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE provincia(
    id_provincia INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_provincia)
);

CREATE TABLE localitat(
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
    id_provincia INT(11) NOT NULL,
    telefon VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_client),
    FOREIGN KEY(id_localitat) REFERENCES localitat (id_localitat),
    FOREIGN KEY(id_provincia) REFERENCES provincia (id_provincia)
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
    descripcio VARCHAR(120) NOT NULL,
    imatge BLOB,
    preu DECIMAL(10,2) NOT NULL,
    id_categoria_pizzes INT(11) NOT NULL,
    PRIMARY KEY(id_producte),
    FOREIGN KEY(id_categoria_pizzes) REFERENCES categoria_pizzes (id_categoria_pizzes)
);

CREATE TABLE botiga(
    id_botiga INT(11) NOT NULL AUTO_INCREMENT,
    adreça VARCHAR(60) NOT NULL,
    codi_postal VARCHAR(25) NOT NULL,
    id_localitat INT(11) NOT NULL,
    id_provincia INT(11) NOT NULL,
    PRIMARY KEY(id_botiga),
    FOREIGN KEY(id_localitat) REFERENCES localitat (id_localitat),
    FOREIGN KEY(id_provincia) REFERENCES provincia (id_provincia)
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
    quantitat INT(11) NOT NULL,
    preu DECIMAL(6,2) NOT NULL,
    id_client INT(11) NOT NULL,
    id_domicili INT(11),
    id_producte INT(11) NOT NULL,
    id_botiga INT(11) NOT NULL,
    id_empleat INT(11) NOT NULL,
    PRIMARY KEY(id_comanda),
    FOREIGN KEY(id_client) REFERENCES clients (id_client),
    FOREIGN KEY(id_domicili) REFERENCES comanda_domicili (id_domicili),
    FOREIGN KEY(id_producte) REFERENCES productes (id_producte),
    FOREIGN KEY(id_botiga) REFERENCES botiga (id_botiga),
    FOREIGN KEY(id_empleat) REFERENCES empleats (id_empleat)
);

INSERT INTO provincia (nom) VALUES ('Barcelona');
INSERT INTO provincia (nom) VALUES ('Tarragona');
INSERT INTO provincia (nom) VALUES ('Lleida');
INSERT INTO provincia (nom) VALUES ('Girona');

INSERT INTO localitat (nom, id_provincia) VALUES ('Barcelona', 1);
INSERT INTO localitat (nom, id_provincia) VALUES ('Santa Coloma', 1);
INSERT INTO localitat (nom, id_provincia) VALUES ('Badalona', 1);
INSERT INTO localitat (nom, id_provincia) VALUES ('Reus', 2);
INSERT INTO localitat (nom, id_provincia) VALUES ('Cambrils', 2);
INSERT INTO localitat (nom, id_provincia) VALUES ('Vilanova de la Barca', 3);
INSERT INTO localitat (nom, id_provincia) VALUES ('Lleida', 3);
INSERT INTO localitat (nom, id_provincia) VALUES ('Girona', 4);
INSERT INTO localitat (nom, id_provincia) VALUES ('Figueres', 4);

INSERT INTO botiga (adreça, codi_postal, id_localitat, id_provincia) VALUES ('Carrer de Valencia, 187', '08022', 1, 1);
INSERT INTO botiga (adreça, codi_postal, id_localitat, id_provincia) VALUES ('Carrer d`Olot, 12', '17600', 9, 4);
INSERT INTO botiga (adreça, codi_postal, id_localitat, id_provincia) VALUES ('carrer Segria, 3', '25690', 6, 3);
INSERT INTO botiga (adreça, codi_postal, id_localitat, id_provincia) VALUES ('Carrer de Torres i Bages, 21', '17190', 8, 4);

INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Marcos', 'Fernández Lopez', '71173294-P', '+34 689213465', 'cuiner', 1);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Albert', 'Puig Ramirez', '32298567-J', '+34 699234321', 'cuiner', 4);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Vanessa', 'Díaz Gil', '31987273-W', '+34 676543678', 'cuiner', 3);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Anna', 'Gomez Lopez', '71234577-C', '+34 690867892', 'cuiner', 2);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Jordi', 'Alba Ferrer', '62265743-A', '+34 690867892', 'repartidor', 4);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Juana', 'Vidal Lopez', '71187923-I', '+34 677222182', 'repartidor', 3);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('Veronica', 'Sánchez Hernandez', '71422876-P', '+34 699191817', 'repartidor', 1);
INSERT INTO empleats (nom, cognoms, NIF, telefon, treball, id_botiga) VALUES ('José', 'Perez Gomez', '12178828-K', '+34 681321767', 'repartidor', 2);

INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, id_provincia, telefon) VALUES ('Maria Concepción', 'Nevado Gil', 'Carrer de la Vitamina, 2', '08030', 1, 1, '+34 632175192');
INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, id_provincia, telefon) VALUES ('Jonathan', 'De las Heras', 'Carrer Aragó, 12, 1o 1a', '08002', 1, 1, '+34 633282199');
INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, id_provincia, telefon) VALUES ('Antonio', 'Correa Vilches', 'Carrer de Met Miravitjes, 1, bj 1a', '17600', 9, 4, '+34 679992829');
INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, id_provincia, telefon) VALUES ('Triana', 'Roman Zafra', 'Carrer Dipòsit, 21, 1o 1a', '25690', 6, 3, '+34 669272182');
INSERT INTO clients (nom, cognoms, adreça, codi_postal, id_localitat, id_provincia, telefon) VALUES ('Luisa', 'Bustos Anxo', 'Carrer Pau Casals, 14, 4o 1a', '43850', 5, 2, '+34 651558628');