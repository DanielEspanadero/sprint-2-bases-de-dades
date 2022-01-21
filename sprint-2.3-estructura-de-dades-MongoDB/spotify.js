// Esborra la base de dades si existís i la crea de nou.
db = db.getSiblingDB('spotify');
db.dropDatabase();
db = db.getSiblingDB('spotify');

// Creació de col·leccions (Equivalent a taules a MySQL).
db.createCollection('usuaris');
db.createCollection('playlists');
db.createCollection('artistes');

// Inserir camps i valors a la col·lecció d'usuaris.
db.usuaris.insertMany(
    [
        {
            id: 0,
            email: 'abcd@gmail.com',
            password: '1234',
            nom_usuari: 'jaimito123',
            data_naixement: '1990-10-23',
            sexe: 'home',
            pais: 'espanya',
            codi_postal: 08032,
            rol: 'premium',
            pagament: {
                id: 0,
                targeta: {
                    numero: '1234 5678 9012 3456',
                    mes_i_any: '05/23',
                    cvv: 192
                },
                data: ISODate('2022-01-01'),
                ordre: '1234',
                total: 9.99
            }
        },
        {
            id: 1,
            email: 'josefina@gmail.com',
            password: '4321',
            nom_usuari: 'josefina1234',
            data_naixement: '1985-11-30',
            sexe: 'dona',
            pais: 'espanya',
            codi_postal: 08010,
            rol: 'premium',
            pagament: {
                id: 0,
                paypal: {
                    usuari: 'josefina@gmail.com'
                },
                data: ISODate('2022-01-01'),
                ordre: '1235',
                total: 9.99
            }
        },
        {
            id: 2,
            email: 'alberto@gmail.com',
            password: '12345678',
            nom_usuari: 'albertito',
            data_naixement: '2002-01-10',
            sexe: 'home',
            pais: 'espanya',
            codi_postal: 08014,
            rol: 'free'
        }
    ]
);

// Inserir camps i valors a la col·lecció d'artistes.
db.artistes.insertMany(
    [
        {
            id: 0,
            nom: 'Drake',
            imatge: 'https://estaticos-cdn.prensaiberica.es/clip/ca650b1b-ef0b-472a-a083-7aa700a77ee8_16-9-discover-aspect-ratio_default_1112295.jpg',
            artista_relacionat: {
                $ref: 'artistes',
                $id: 1
            },
            albums: [
                {
                    id: 0,
                    titol: 'Scorpion',
                    any_publicacio: 2018,
                    portada: 'https://img.discogs.com/pzxOpyTk5Nx8r4zDJfX1dWk-q7w=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-12800480-1542281217-8075.jpeg.jpg',
                    likes: [
                        {
                            $ref: 'usuaris',
                            $id: 0
                        },
                        {
                            $ref: 'usuaris',
                            $id: 1
                        }
                    ],
                    cançons: [
                        {
                            id: 0,
                            titol: 'Canço 1',
                            durada: '4 minuts i 30 segons',
                            reproduccions: 1927876,
                            album: {
                                $ref: 'albums',
                                $id: 0
                            },
                            likes: [
                                {
                                    $ref: 'usuaris',
                                    $id: 0
                                },
                                {
                                    $ref: 'usuaris',
                                    $id: 1
                                }
                            ]
                        },
                        {
                            id: 2,
                            titol: 'Canço 1',
                            durada: '1 minuts i 30 segons',
                            reproduccions: 1000123,
                            album: {
                                $ref: 'albums',
                                $id: 0
                            },
                            likes: [
                                {
                                    $ref: 'usuaris',
                                    $id: 0
                                },
                                {
                                    $ref: 'usuaris',
                                    $id: 1
                                }
                            ]
                        }
                    ]
                }
            ]
        },
        {
            id: 1,
            nom: 'Nicki Nicole',
            imatge: 'https://i.scdn.co/image/ab67616d0000b27319f7055ea11fba4868f7794a',
            artista_relacionat: {
                $ref: 'artistes',
                $id: 0
            },
            albums: [
                {
                    id: 1,
                    titol: 'Recuerdos',
                    any_publicacio: 2019,
                    portada: 'https://img.discogs.com/1LnpGFuMY4TCxcpG270Q7xj8v6E=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-15467542-1592012194-2117.jpeg.jpg',
                    likes: [
                        {
                            $ref: 'usuaris',
                            $id: 0
                        },
                        {
                            $ref: 'usuaris',
                            $id: 1
                        }
                    ],
                    cançons: [
                        {
                            id: 3,
                            titol: 'Canço 1',
                            durada: '2 minuts i 30 segons',
                            reproduccions: 1927876,
                            album: {
                                $ref: 'albums',
                                $id: 1
                            },
                            likes: [
                                {
                                    $ref: 'usuaris',
                                    $id: 0
                                },
                                {
                                    $ref: 'usuaris',
                                    $id: 1
                                }
                            ]
                        },
                        {
                            id: 4,
                            titol: 'Canço 2',
                            durada: '4 minuts i 30 segons',
                            reproduccions: 1927876,
                            album: {
                                $ref: 'albums',
                                $id: 1
                            },
                            likes: [
                                {
                                    $ref: 'usuaris',
                                    $id: 0
                                },
                                {
                                    $ref: 'usuaris',
                                    $id: 1
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
);

// Inserir camps i valors a la col·lecció de playlist.
db.playlists.insertMany(
    [
        {
            id: 0,
            titol: 'Cançons que m`agraden',
            camçons: [
                {
                    canço: {
                        $ref: 'cançons',
                        $id: 0
                    },
                    usuari: { // Persona que ha añadido la canción a la playlist.
                        $ref: 'usuaris',
                        $id: 0
                    }
                },
                {
                    canço: {
                        $ref: 'cançons',
                        $id: 4
                    },
                    usuari: { // Persona que ha añadido la canción a la playlist.
                        $ref: 'usuaris',
                        $id: 2
                    }
                }
            ],
            data_creacio: ISODate('2022-01-12'),
            rol: 'activa',
            usuari: { // Autor de la playlist.
                $ref: 'usuaris',
                $id: 0
            }
        }
    ]
);