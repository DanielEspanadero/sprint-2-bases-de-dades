// Esborra la base de dades si existís i la crea de nou.
db = db.getSiblingDB('youtube');
db.dropDatabase();
db = db.getSiblingDB('youtube');

// Creació de col·leccions (Equivalent a taules a MySQL).
db.createCollection('usuaris');

// Inserir camps i valors a la col·lecció de etiquetes.
db.usuaris.insertMany(
    [
        {
            id: 0,
            email: 'maria@gmail.com',
            contrasenya: '1234',
            nom_usuari: 'Maria123',
            data_naixement: '1992-23-07',
            sexe: 'Dona',
            pais: 'Espanya',
            codi_postal: 08032,
            canal: {
                id: 0,
                nom: 'Hater one',
                descripcio: 'Aquest es un canal molt agradable',
                creacio: ISODate(),
                suscriptors: [
                    {
                        $ref: 'usuaris',
                        $id: 1
                    },
                    {
                        $ref: 'usuaris',
                        $id: 2
                    }
                ]
            }
        },
        {
            id: 1,
            email: 'aitor@gmail.com',
            contrasenya: '1234',
            nom_usuari: 'Aitor123',
            data_naixement: '1990-09-11',
            sexe: 'Home',
            pais: 'Espanya',
            codi_postal: 08012,
            canal: {
                id: 1,
                nom: 'El canal de Aitor',
                descripcio: 'El millor canal de YouTube del mon',
                creacio: ISODate(),
                suscriptors: [
                    {
                        $ref: 'usuaris',
                        $id: 0
                    },
                    {
                        $ref: 'usuaris',
                        $id: 2
                    }
                ],
                playlists: [
                    {
                        id: 0,
                        nom: 'Els meus videos',
                        data_creacio: ISODate(),
                        estat: 'Privada'
                    }
                ],
                videos: [
                    {
                        id: 1,
                        títol: 'Qui es l`Aitor',
                        descripció: 'Aquest es un video de presentació del canal',
                        grandària: '428mb',
                        nom_arxiu: 'MVI7986',
                        durada: '3 minuts i 13 segons',
                        miniatura: 'https://i.ytimg.com/vi/olQwfDjYAqA/maxresdefault.jpg',
                        reproduccions: 245,
                        likes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: 2,
                                    data: ISODate()
                                }
                            }
                        ],
                        dislikes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: 0,
                                    data: ISODate()
                                }
                            }
                        ],
                        estat: 'Public',
                        etiquetes: [
                            {
                                $ref: 'etiquetes',
                                $id: 0
                            }
                        ],
                        playlists: {
                            $ref: 'playlists',
                            $id: 0
                        },
                        data_pujada: ISODate(),
                        etiquetes: [
                            {
                                id: 0,
                                nom: 'Vlogs',
                                data_creacio: ISODate(),
                                estat: 'Privada',
                                usuari_id: {
                                    $ref: 'usuaris',
                                    $id: 2
                                }
                            }
                        ],
                        comentaris: [
                            {
                                id: 0,
                                text: 'Bon video Aitor, pasa`t pel meu canal per saludar al meu gos',
                                data_i_hora: ISODate(),
                                likes: [
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 1,
                                            data: ISODate()
                                        }
                                    }
                                ],
                                dislikes: [
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 0,
                                            data: ISODate()
                                        }
                                    }
                                ]
                            }
                        ]
                    }

                ]
            }
        },
        {
            id: 2,
            email: 'anna@gmail.com',
            contrasenya: '1234',
            nom_usuari: 'Annyta',
            data_naixement: '1989-11-21',
            sexe: 'Dona',
            pais: 'Espanya',
            codi_postal: 08030,
            canal: {
                id: 2,
                nom: 'La vida del meu gos',
                descripcio: 'En aquest canal us aniré contant la vida del meu gos, Rocky',
                creacio: ISODate(),
                suscriptors: [
                    {
                        $ref: 'usuaris',
                        $id: 0
                    },
                    {
                        $ref: 'usuaris',
                        $id: 1
                    }
                ],
                playlists: [
                    {
                        id: 1,
                        nom: 'Bachata',
                        data_creacio: ISODate(),
                        estat: 'Publica'
                    }
                ],
                videos: [
                    {
                        id: 0,
                        títol: 'El meu gos es lleva del seu llit',
                        descripció: 'Així es el despertar del meu gos pels matins',
                        grandària: '1.2gb',
                        nom_arxiu: 'Rocky llevant-se del llit',
                        durada: '15 minuts, 30 segons',
                        miniatura: 'http://2.bp.blogspot.com/-4J6Cm2KtqnA/UxiTVtAXKGI/AAAAAAAABAo/Z9LZUs8swhw/w1200-h630-p-k-no-nu/image.jpg',
                        reproduccions: 128,
                        likes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: 1,
                                    data: ISODate()
                                }
                            }
                        ],
                        dislikes: [
                            {
                                usuari: {
                                    $ref: 'usuaris',
                                    $id: 2,
                                    data: ISODate()
                                }
                            }
                        ],
                        estat: 'Public',
                        etiquetes: [
                            {
                                $ref: 'etiquetes',
                                $id: 0
                            },
                            {
                                $ref: 'etiquetes',
                                $id: 4
                            }
                        ],
                        playlists: {
                            $ref: 'playlist',
                            $id: 2
                        },
                        data_pujada: ISODate(),
                        etiquetes: [
                            {
                                id: 0,
                                nom: 'Mascotes',
                                data_creacio: ISODate(),
                                estat: 'Privada',
                                usuari_id: {
                                    $ref: 'usuaris',
                                    $id: 2
                                }
                            }
                        ],
                        comentaris: [
                            {
                                id: 1,
                                text: 'Hola Anna, m`agrada molt la teva mascota, jo també tinc un goset, estic pendent de les aventures d`en Rocky',
                                data_i_hora: ISODate(),
                                likes: [
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 2,
                                            data: ISODate()
                                        }
                                    },
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 1,
                                            data: ISODate()
                                        }
                                    }
                                ],
                                dislikes: [
                                    {
                                        usuari: {
                                            $ref: 'usuaris',
                                            $id: 0,
                                            data: ISODate()
                                        }
                                    }
                                ],
                                video_id: {
                                    $ref: 'videos',
                                    $id: 0
                                },
                                usuari_id: {
                                    $ref: 'usuaris',
                                    $id: 1
                                }
                            }
                        ]
                    }
                ]
            }
        }
    ]
);
