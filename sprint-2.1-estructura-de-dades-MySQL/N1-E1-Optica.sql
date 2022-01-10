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
CREATE TABLE ulleres(
ulleres_id INT(11) NOT NULL AUTO_INCREMENT,
marca VARCHAR(60) NOT NULL,
graduacio_esquerra FLOAT(6,2) NOT NULL,
graduacio_dreta FLOAT(6,2) NOT NULL,
muntura ENUM('flotant', 'pasta', 'metal·lica') NOT NULL,
color_muntura VARCHAR(45) NOT NULL,
color_vidres VARCHAR(45) NOT NULL,
preu DECIMAL(10,2) NOT NULL,
proveidor_id INT(11) NOT NULL,
PRIMARY KEY(ulleres_id),
FOREIGN KEY(proveidor_id) REFERENCES proveidors (proveidor_id)
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
import_factura DECIMAL(10,2) NOT NULL,
proveidor_id INT(11) NOT NULL,
ulleres_id INT(11) NOT NULL,
client_id INT(11) NOT NULL,
empleat_id INT(11) NOT NULL,
PRIMARY KEY(factura_id),
FOREIGN KEY(proveidor_id) REFERENCES proveidors (proveidor_id),
FOREIGN KEY(ulleres_id) REFERENCES ulleres (ulleres_id),
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

-- Afegir valors de prova a la taula ulleres. [x]

INSERT INTO ulleres (marca, graduacio_esquerra, graduacio_dreta, muntura, color_muntura, color_vidres, preu, proveidor_id)
VALUES ('Rayban', 0.8, 0.3, 'pasta', 'verda', 'negro', 320.99, 2);

INSERT INTO ulleres (marca, graduacio_esquerra, graduacio_dreta, muntura, color_muntura, color_vidres, preu, proveidor_id)
VALUES ('Gucci', 0.1, 0.5, 'flotant', 'verde', 'transparents', 525.95, 1);

-- Afegir valors de prova a la taula clients. [x]

INSERT INTO clients (nom, codi_postal, telefon, correu_electronic, data_registre, client_recomanat)
VALUES('Margarita', '08010', '679992928', 'margarita@gmail.com', '2021-07-12', NULL);

INSERT INTO clients (nom, codi_postal, telefon, correu_electronic, data_registre, client_recomanat)
VALUES('Pedro', '08032', '632222975', 'pedro@hotmail.com', '2021-10-30', 1);

-- Afegir valors de prova a la taula factures. [x]

INSERT INTO factures (data_factura, import_factura, proveidor_id, ulleres_id, client_id, empleat_id)
VALUES ('2021-07-12', 627.25, 2, 1, 1, 2);
INSERT INTO factures (data_factura, import_factura, proveidor_id, ulleres_id, client_id, empleat_id)
VALUES ('2021-09-01', 525.95, 1, 1, 1, 1);
INSERT INTO factures (data_factura, import_factura, proveidor_id, ulleres_id, client_id, empleat_id)
VALUES ('2021-09-02', 320.99, 1, 1, 2, 1);
INSERT INTO factures (data_factura, import_factura, proveidor_id, ulleres_id, client_id, empleat_id)
VALUES ('2021-09-03', 320.99, 1, 1, 2, 1);

-- Llista el total de factures d'un client en un període determinat.

SELECT c.nom, f.* FROM clients c INNER JOIN factures f ON f.client_id = c.client_id WHERE c.nom = 'Margarita' AND f.data_factura BETWEEN '2021-07-12' AND '2021-12-31';

-- Llista els diferents models d'ulleres que ha venut un empleat durant un any.

SELECT e.nom AS empleat, f.data_factura, u.ulleres_id FROM empleats e INNER JOIN factures f ON e.empleat_id = f.empleat_id INNER JOIN ulleres u ON e.empleat_id = u.ulleres_id WHERE e.empleat_id = 1 AND f.data_factura between '2020-01-01' AND '2021-12-31';

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.

SELECT p.nom AS Proveidor, COUNT(p.ulleres_id) AS Ventas FROM proveidors p INNER JOIN ulleres u ON u.ulleres_id = p.proveidor_id GROUP BY p.nom;