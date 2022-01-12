DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;
USE spotify;
CREATE TABLE usuaris(
    usuari_id INT(11) NOT NULL AUTO_INCREMENT,
    email VARCHAR(45) NOT NULL,
    contrasenya VARCHAR(20) NOT NULL,
    nom_usuari VARCHAR(20) NOT NULL,
    data_naixement DATE NOT NULL,
    sexe ENUM('masculí', 'femení') NOT NULL,
    pais VARCHAR(30) NOT NULL,
    codi_postal INT(11) NOT NULL,
    PRIMARY KEY(usuari_id)
);
CREATE TABLE suscripcions_premium(
    suscripcio_premium_id INT(11) NOT NULL AUTO_INCREMENT,
    data_inici_suscripcio DATE NOT NULL,
    data_renovacio_servei DATE NOT NULL,
    forma_pagament ENUM('targeta', 'paypal'),
    data_pagament DATETIME NOT NULL,
    total_pagaments DECIMAL(10,2) NOT NULL,
    id_usuari INT(11) NOT NULL,
    PRIMARY KEY(suscripcio_premium_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id)
);
CREATE TABLE targetes(
    targeta_id INT(11) NOT NULL AUTO_INCREMENT,
    id_suscripcio_premium INT(11) NOT NULL,
    nombre_targeta INT(16) NOT NULL,
    mes_i_any DATE NOT NULL,
    codi_seguretat INT(3) NOT NULL,
    PRIMARY KEY(targeta_id),
    FOREIGN KEY(id_suscripcio_premium) REFERENCES suscripcions_premium (suscripcio_premium_id)
);
CREATE TABLE paypal(
    paypal_id INT(11) NOT NULL AUTO_INCREMENT,
    id_suscripcio_premium INT(11) NOT NULL,
    nom_usuari_paypal VARCHAR(30) NOT NULL,
    PRIMARY KEY(paypal_id),
    FOREIGN KEY(id_suscripcio_premium) REFERENCES suscripcions_premium (suscripcio_premium_id)
);
CREATE TABLE playlist_activa(
    playlist_id INT(11) NOT NULL AUTO_INCREMENT,
    id_usuari INT(11) NOT NULL,
    titol VARCHAR(20) NOT NULL,
    nombre_cançons INT(3) NOT NULL,
    data_creacio TIMESTAMP,
    PRIMARY KEY(playlist_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id)
);
CREATE TABLE playlist_esborrada(
    playlist_esborrada_id INT(11) NOT NULL AUTO_INCREMENT,
    id_playlist INT(11) NOT NULL,
    data_eliminacio TIMESTAMP,
    PRIMARY KEY(playlist_esborrada_id),
    FOREIGN KEY(id_playlist) REFERENCES playlist_activa (playlist_id)
);
CREATE TABLE artistes(
    artista_id INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(20) NOT NULL,
    imatge BLOB NOT NULL,
    PRIMARY KEY(artista_id)
);
CREATE TABLE albums(
    album_id INT(11) NOT NULL AUTO_INCREMENT,
    titol VARCHAR(25) NOT NULL,
    any_publicacio TINYINT(4) NOT NULL,
    portada BLOB NOT NULL,
    id_artista INT(11) NOT NULL,
    PRIMARY KEY(album_id),
    FOREIGN KEY(id_artista) REFERENCES artistes (artista_id)
);
CREATE TABLE cançons(
    canço_id INT(11) NOT NULL AUTO_INCREMENT,
    titol VARCHAR(25) NOT NULL,
    durada VARCHAR(10) NOT NULL,
    nombre_reproduccions INT(30) NOT NULL,
    id_album INT(11) NOT NULL,
    PRIMARY KEY(canço_id),
    FOREIGN KEY(id_album) REFERENCES albums (album_id)
);
CREATE TABLE cançons_afegides(
    canço_afegida_id INT(11) NOT NULL AUTO_INCREMENT,
    id_playlist INT(11) NOT NULL,
    id_usuari INT(11) NOT NULL,
    data_afegiment TIMESTAMP NOT NULL,
    id_canço INT(11) NOT NULL,
    PRIMARY KEY(canço_afegida_id),
    FOREIGN KEY(id_playlist) REFERENCES playlist_activa (playlist_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id),
    FOREIGN KEY(id_canço) REFERENCES cançons (canço_id)
);
CREATE TABLE artista_relacionat(
    artista_relacionat_id INT(11) NOT NULL AUTO_INCREMENT,
    id_artista_1 INT(11) NOT NULL,
    id_artista_2 INT(11) NOT NULL,
    PRIMARY KEY(artista_relacionat_id),
    FOREIGN KEY(id_artista_1) REFERENCES artistes (artista_id),
    FOREIGN KEY(id_artista_2) REFERENCES artistes (artista_id)
);
CREATE TABLE albums_favorits(
    album_favorit_id INT(11) NOT NULL AUTO_INCREMENT,
    id_usuari INT(11) NOT NULL,
    id_album INT(11) NOT NULL,
    PRIMARY KEY(album_favorit_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id),
    FOREIGN KEY(id_album) REFERENCES albums (album_id)
);
CREATE TABLE cançons_favorites(
    canço_favorita_id INT(11) NOT NULL AUTO_INCREMENT,
    id_usuari INT(11) NOT NULL,
    id_canço INT(11) NOT NULL,
    PRIMARY KEY(canço_favorita_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id),
    FOREIGN KEY(id_canço) REFERENCES cançons (canço_id)
);