DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube;

CREATE TABLE usuaris(
    usuari_id INT(11) NOT NULL AUTO_INCREMENT,
    email VARCHAR(45) NOT NULL,
    contrasenya VARCHAR(45) NOT NULL,
    data_naixement DATE,
    nom_usuari VARCHAR(20) NOT NULL,
    descripcio_canal VARCHAR(300),
    data_de_creacio TIMESTAMP,
    sexe ENUM('masculi', 'femeni'),
    pais VARCHAR(45),
    codi_postal INT(11),
    PRIMARY KEY(usuari_id)
);

CREATE TABLE videos(
    video_id INT(11) NOT NULL AUTO_INCREMENT,
    titol VARCHAR(45) NOT NULL,
    descripcio VARCHAR(300) NOT NULL,
    grandaria VARCHAR(20) NOT NULL,
    nom_archiu VARCHAR(45) NOT NULL,
    durada VARCHAR(20) NOT NULL,
    thumnail BLOB,
    nombre_reproduccions INT(30) NOT NULL,
    nombre_likes INT(20) NOT NULL,
    nombre_dislikes INT(20) NOT NULL,
    estat_video ENUM('public', 'ocult', 'privat'),
    data_publicacio DATETIME,
    id_usuari INT(11) NOT NULL,
    PRIMARY KEY(video_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id)
);

CREATE TABLE etiquetes(
    etiqueta_id INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(30),
    PRIMARY KEY(etiqueta_id)
);

CREATE TABLE asignacio_etiquetes(
    asignacio_etiquetes_id INT(11) NOT NULL AUTO_INCREMENT,
    id_etiqueta INT(11) NOT NULL,
    id_video INT(11) NOT NULL,
    PRIMARY KEY(asignacio_etiquetes_id),
    FOREIGN KEY(id_etiqueta) REFERENCES etiquetes (etiqueta_id),
    FOREIGN KEY(id_video) REFERENCES videos (video_id)
);

CREATE TABLE suscripcio(
    suscripcio_id INT(11) NOT NULL AUTO_INCREMENT,
    id_usuari INT(11) NOT NULL,
    PRIMARY KEY(suscripcio_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id)
);

CREATE TABLE like_dislike_video(
    like_dislike_video_id INT(11) NOT NULL AUTO_INCREMENT,
    id_usuari INT(11) NOT NULL,
    id_video INT(11) NOT NULL,
    like_dislike ENUM('like','dislike'),
    data_hora TIMESTAMP,
    PRIMARY KEY(like_dislike_video_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id),
    FOREIGN KEY(id_video) REFERENCES videos (video_id)
);

CREATE TABLE playlist(
    playlist_id INT(11) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL,
    data_creacio TIMESTAMP,
    estat ENUM('publica', 'privada'),
    id_usuari INT(11) NOT NULL,
    PRIMARY KEY(playlist_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id)
);

CREATE TABLE videos_playlist(
    videos_playlist_id INT(11) NOT NULL AUTO_INCREMENT,
    id_playlist INT(11) NOT NULL,
    id_video INT(11) NOT NULL,
    PRIMARY KEY(videos_playlist_id),
    FOREIGN KEY(id_playlist) REFERENCES playlist (playlist_id),
    FOREIGN KEY(id_video) REFERENCES videos (video_id)
);

CREATE TABLE comentaris(
    comentari_id INT(11) NOT NULL AUTO_INCREMENT,
    text_comentari VARCHAR(300) NOT NULL,
    data_hora TIMESTAMP,
    id_usuari INT(11) NOT NULL,
    id_video INT(11) NOT NULL,
    PRIMARY KEY(comentari_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris (usuari_id),
    FOREIGN KEY(id_video) REFERENCES videos (video_id)
);

CREATE TABLE like_dislike_comentari(
    like_dislike_comentari_id INT(11) NOT NULL AUTO_INCREMENT,
    id_comentari INT(11) NOT NULL,
    id_usuari INT(11) NOT NULL,
    PRIMARY KEY(like_dislike_comentari_id),
    FOREIGN KEY(id_comentari) REFERENCES comentaris (comentari_id),
    FOREIGN KEY (id_usuari) REFERENCES usuaris (usuari_id)
);