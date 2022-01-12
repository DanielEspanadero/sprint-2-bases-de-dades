-- Proveidor de les ulleres. [x]
-- Marques d'ulleres. [x]
-- Clients. [x]
-- Client que ha recomanat. [x]
-- Empleat. [x]
-- Factura. [x]

DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica;

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
CREATE TABLE clients(
client_id INT(11) NOT NULL AUTO_INCREMENT,
nom VARCHAR(60) NOT NULL,
codi_postal INT(10) NOT NULL,
telefon VARCHAR(15) NOT NULL,
correu_electronic VARCHAR(45) NOT NULL,
data_registre DATE NOT NULL,
client_recomanat INT(11),
PRIMARY KEY(client_id),
FOREIGN KEY(client_recomanat) REFERENCES clients (client_id)
);
CREATE TABLE empleats(
empleat_id INT(11) NOT NULL AUTO_INCREMENT,
nom VARCHAR(60) NOT NULL,
cognom VARCHAR(60) NOT NULL,
PRIMARY KEY(empleat_id)
);
CREATE TABLE factures(
factura_id INT(11) NOT NULL AUTO_INCREMENT,
data_factura DATE,
marca VARCHAR(60) NOT NULL,
graduacio_esquerra FLOAT(6,2) NOT NULL,
graduacio_dreta FLOAT(6,2) NOT NULL,
muntura ENUM('flotant', 'pasta', 'metal·lica') NOT NULL,
color_muntura VARCHAR(45) NOT NULL,
color_vidres VARCHAR(45) NOT NULL,
import_factura DECIMAL(10,2) NOT NULL,
proveidor_id INT(11) NOT NULL,
client_id INT(11) NOT NULL,
empleat_id INT(11) NOT NULL,
PRIMARY KEY(factura_id),
FOREIGN KEY(proveidor_id) REFERENCES proveidors (proveidor_id),
FOREIGN KEY(client_id) REFERENCES clients (client_id),
FOREIGN KEY(empleat_id) REFERENCES empleats (empleat_id)
);

-- Afegir valors de prova a la taula 'empleats'. [x]

INSERT INTO empleats (nom, cognom)
VALUES ('Josep', 'Cargol Martinez');

INSERT INTO empleats (nom, cognom)
VALUES ('Fatima', 'Lopez');

INSERT INTO empleats (nom, cognom)
VALUES ('José', 'Fernández Sánchez');

-- Afegir valors de prova a la taula proveidors. [x]

INSERT INTO proveidors (nom, carrer, numero, pis, porta, ciutat, codi_postal, pais, telefon, fax, NIF)
VALUES ('Alco distribucions S.A', 'Carrer de la Glucosa', 16, 0, '', 'Barcelona', '08032', 'Espanya', '+34 687128964', '', 'A58375890');

INSERT INTO proveidors (nom, carrer, numero, pis, porta, ciutat, codi_postal, pais, telefon, fax, NIF)
VALUES ('Ecomdina Sl.', 'Calle Mayoral', 2, 11, 14, 'Malaga', '29016', 'Espanya', '+34 633322712','' , 'B02768364');


-- Afegir valors de prova a la taula clients. [x]

INSERT INTO clients (nom, codi_postal, telefon, correu_electronic, data_registre, client_recomanat)
VALUES('Margarita', '08010', '679992928', 'margarita@gmail.com', '2021-07-12', NULL);

INSERT INTO clients (nom, codi_postal, telefon, correu_electronic, data_registre, client_recomanat)
VALUES('Pedro', '08032', '632222975', 'pedro@hotmail.com', '2021-10-30', 1);

-- Afegir valors de prova a la taula factures. [x]

INSERT INTO factures (data_factura, marca, graduacio_esquerra, graduacio_dreta, muntura, color_muntura, color_vidres, import_factura, proveidor_id, client_id, empleat_id) 
VALUES ('2021-12-30', 'Gucci', 0.8, 0.3, 'pasta', 'blava', 'negres', 325.99, 1, 1, 1);
INSERT INTO factures (data_factura, marca, graduacio_esquerra, graduacio_dreta, muntura, color_muntura, color_vidres, import_factura, proveidor_id, client_id, empleat_id) 
VALUES ('2022-01-10', 'Ray-ban', 0.1, 0.4, 'pasta', 'verda', 'transparents', 425.99, 2, 1, 1);



-- Llista el total de compres d'un client.
SELECT c.nom AS Client, COUNT(f.factura_id) AS Comandes FROM clients c INNER JOIN factures f ON f.client_id = c.client_id WHERE f.client_id = 1;

-- Llista les diferents ulleres que ha venut un empleat durant un any
SELECT f.marca, e.nom AS Empleat, f.data_factura FROM factures f INNER JOIN empleats e ON e.empleat_id = f.empleat_id WHERE f.empleat_id = 1 AND f.data_factura between '2021-01-10' AND '2022-01-10';

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
SELECT pr.nom AS Proveidor, COUNT(f.factura_id) AS Vendes FROM factures f INNER JOIN proveidors pr ON pr.proveidor_id = f.proveidor_id WHERE factura_id > 0 GROUP BY pr.nom;