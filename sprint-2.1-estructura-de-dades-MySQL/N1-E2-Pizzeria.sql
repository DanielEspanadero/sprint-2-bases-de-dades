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
    codi_postal INT(10) NOT NULL,
    id_localitat INT(11) NOT NULL,
    id_provincia INT(11) NOT NULL,
    telefon VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_client),
    FOREIGN KEY(id_localitat) REFERENCES localitat (id_localitat),
    FOREIGN KEY(id_provincia) REFERENCES provincia (id_provincia)
);

CREATE TABLE domicili(
    id_domicili INT(11) NOT NULL AUTO_INCREMENT,
    nom_repartidor VARCHAR(45) NOT NULL,
    data_i_hora TIMESTAMP,
    PRIMARY KEY(id_domicili)
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
    PRIMARY KEY(id_comanda),
    FOREIGN KEY(id_client) REFERENCES clients (id_client),
    FOREIGN KEY(id_domicili) REFERENCES domicili (id_domicili),
    FOREIGN KEY(id_producte) REFERENCES producte (id_producte),
    FOREIGN KEY(id_botiga) REFERENCES botiga (id_botiga)
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
    codi_postal INT(10) NOT NULL,
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
    id_botiga INT(11),
    PRIMARY KEY(id_empleat),
    FOREIGN KEY(id_botiga) botiga (id_botiga)
);
