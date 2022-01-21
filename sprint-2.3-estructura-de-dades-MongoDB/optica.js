// Esborra la base de dades si existís i la crea de nou.
db = db.getSiblingDB('optica');
db.dropDatabase();
db = db.getSiblingDB('optica');

// Creació de col·leccions (Equivalent a taules a MySQL).
db.createCollection('proveidors');
db.createCollection('clients');

// Inserir camps i valors a la col·lecció de proveïdors.
db.proveidors.insertMany(
    [
        {
            id: 0,
            nom: 'Alco distribucions S.A',
            adreça: {
                carrer: 'Carrer de la Glucosa',
                numero: 16,
                pis: 0,
                porta: ' ',
                ciutat: 'Barcelona',
                codi_postal: 08032,
                pais: 'Espanya'
            },
            telefon: '+34 687128964',
            fax: '',
            NIF: 'A58375890'
        },
        {
            id: 1,
            nom: 'Ecomdina S.L.',
            adreça: {
                carrer: 'Calle Mayoral',
                numero: 2,
                pis: 11,
                porta: 14,
                ciutat: 'Malaga',
                codi_postal: 29016,
                pais: 'Espanya'
            },
            telefon: '+34 633322712',
            fax: ' ',
            NIF: 'B02768364'
        },
    ]
);

// visualitzar les dades que hem inserit a la col·lecció proveïdors.
db.proveidors.find().pretty();

// Inserir camps i valors a la col·lecció de clients.
db.clients.insertMany(
    [
        {
            id: 0,
            nom: 'Margarita',
            adreça_postal: '08010',
            telefon: '+34 679992928',
            correu_electronic: 'margarita@gmail.com',
            data_registre: '2021-07-12',
            ulleres:
            {
                marca: 'Rayban',
                graduacio: {
                    vidre_esquerre: {
                        graduacio: 0.8,
                        color: 'negro'
                    },
                    vidre_dret: {
                        graduacio: 0.3,
                        color: 'negro'
                    }
                },
                muntura: {
                    ENUM: ['flotant', 'pasta', 'metàl·lica'],
                    default: 'pasta'
                },
                color_muntura: 'verda',
                preu: 320.99,
                proveidor: {
                    $ref: 'Proveidors',
                    $id: 0
                },
                empleat: {
                    cod_emp: 1,
                    name: 'Sara'
                }
            }
        },
        {
            id: 1,
            nom: 'Pedro',
            adreça_postal: '08032',
            telefon: '+34 632222975',
            correu_electronic: 'pedro@hotmail.com',
            data_registre: '2021-10-30',
            client_recomanat: {
                $ref: 'clients',
                $id: 0
            },
            ulleres:
            {
                marca: 'Gucci',
                graduacio: {
                    vidre_esquerre: {
                        graduacio: 0.1,
                        color: 'trasparent'
                    },
                    vidre_dret: {
                        graduacio: 0.5,
                        color: 'trasparent'
                    }
                },
                muntura: {
                    ENUM: ['flotant', 'pasta', 'metàl·lica'],
                    default: 'pasta'
                },
                color_muntura: 'verda',
                preu: 525.95,
                proveidor: {
                    $ref: 'Proveidors',
                    $id: 1
                },
                empleat: {
                    cod_emp: 2,
                    name: 'Leonardo'
                }
            }
        }
    ]
);

// visualitzar les dades que hem inserit a la col·lecció clients.
db.clients.find().pretty();
