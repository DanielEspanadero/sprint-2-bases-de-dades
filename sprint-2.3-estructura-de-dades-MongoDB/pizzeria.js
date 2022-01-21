// Esborra la base de dades si existís i la crea de nou.
db = db.getSiblingDB('pizzeria');
db.dropDatabase();
db = db.getSiblingDB('pizzeria');

// Creació de col·leccions (Equivalent a taules a MySQL).
db.createCollection('clients');
db.createCollection('productes');
db.createCollection('botigues');

// Inserir camps i valors a la col·lecció de clients.
db.clients.insertMany(
    [
        {
            id: 0,
            nom: 'Andrés',
            cognoms: 'Fernández Lopez',
            adreça: {
                carrer: 'Carrer de Aragó',
                numero: 283,
                pis: '4º',
                porta: 1,
                codi_postal: 08009,
                localitat: 'Barcelona',
                provincia: 'Barcelona'
            }
        },
        {
            id: 1,
            nom: 'Andrea',
            cognoms: 'Lopez Fernández',
            adreça: {
                carrer: 'Carrer de la gran Via de les corts catalanes',
                numero: 128,
                pis: '3º',
                porta: 2,
                codi_postal: 08014,
                localitat: 'Barcelona',
                provincia: 'Barcelona'
            }
        }
    ]
);

// visualitzar les dades que hem inserit a la col·lecció proveïdors.
db.clients.find().pretty();

// Inserir camps i valors a la col·lecció de botigues.
db.botigues.insertMany(
    [
        {
            id: 0,
            adreça: {
                carrer: 'Carrer de Sepulveda',
                numero: 12,
                pis: 'baix',
                porta: 0,
                codi_postal: 08018,
                localitat: 'Barcelona',
                provincia: 'Barcelona'
            },
            empleats: [{
                id: 0,
                nom: 'Antonio',
                cognoms: 'Lopez Castro',
                NIF: '71179834W',
                telefon: 679872212,
                lloc_de_treball: 'Cuiner'
            },
            {
                id: 1,
                nom: 'Carles',
                cognoms: 'Teixidor Puig',
                NIF: '12279834S',
                telefon: 632872212,
                lloc_de_treball: 'Repartidor'
            }],
            comandes: [
                {
                    id: 0,
                    data_hora: ISODate(),
                    tipus: {
                        ENUM: ['domicili', 'botiga'],
                        default: 'botiga',
                    },
                    productes: [{
                        producte_id: {
                            $ref: 'productes',
                            $id: 2
                        },
                        quantitat: 2,
                        preu: 21.98
                    },
                    {
                        producte_id: {
                            $ref: 'productes',
                            $id: 6
                        },
                        quantitat: 1,
                        preu: 1.5
                    },
                    {
                        producte_id: {
                            ref: 'productes',
                            $id: 7
                        },
                        quantitat: 1,
                        preu: 2
                    }]
                }
            ]

        },
        {
            id: 1,
            adreça: {
                carrer: 'Carrer de Arago',
                numero: 289,
                pis: 'baix',
                porta: 0,
                codi_postal: 08012,
                localitat: 'Barcelona',
                provincia: 'Barcelona'
            },
            empleats: [{
                id: 0,
                nom: 'Maria',
                cognoms: 'Jimenez Calvo',
                NIF: '71379834B',
                telefon: 633870912,
                lloc_de_treball: 'Cuiner'
            },
            {
                id: 1,
                nom: 'José',
                cognoms: 'Fernández Martínez',
                NIF: '71079864P',
                telefon: 659992982,
                lloc_de_treball: 'Repartidor'
            }],
            comandes: [
                {
                    id: 1,
                    data_hora: ISODate(),
                    tipus: {
                        ENUM: ['domicili', 'botiga'],
                        default: 'botiga',
                    },
                    productes: [{
                        producte_id: 5,
                        quantitat: 1,
                        preu: 9.99
                    },
                    {
                        producte_id: 6,
                        quantitat: 1,
                        preu: 1.5
                    }]
                }
            ]
        }
    ]
);

// visualitzar les dades que hem inserit a la col·lecció proveïdors.
db.botigues.find().pretty();

// Inserir camps i valors a la col·lecció de productes.
db.productes.insertMany(
    [
        {
            id: 0,
            nom: 'Margarita',
            tipus: 'Pizza',
            descripcio: 'Els ingredients d`aquesta pionera no fallen, i són els preferits dels autèntics amants de la pizza tradicional: salsa de tomàquet, mozzarella, alfàbrega, orenga i oli d`oliva. A què us recorden els colors d`aquests ingredients? Sí, a la bandera italiana; un sabor de bandera.',
            imatge: 'https://hacermasapizza.com/img/pizza-margarita-573.jpg',
            preu: 9.99
        },
        {
            id: 1,
            nom: 'Quatre formatges',
            tipus: 'Pizza',
            descripcio: 'El formatge fontina, originari de la Vall d`Aosta; el formatge gorgonzola, natural de Milà; el formatge parmesà, originari de la ciutat de Parma; i el formatge mozzarella, nascut a Campània.',
            imatge: 'https://www.recetin.com/wp-content/uploads/2012/01/pizza_cuatro_quesos.jpg',
            preu: 12.99
        },
        {
            id: 2,
            nom: 'Napolitana',
            tipus: 'Pizza',
            descripcio: 'Una de les peculiaritats d`aquesta pizza, també coneguda com a romana, és la seva massa: suau, esponjosa i una mica més gruixuda que l`ortodoxa italiana, amb les vores més altes. Els seus ingredients: salsa de tomàquet, formatge mozzarella, anxoves, orenga, tàperes i oli d`oliva.',
            imatge: 'https://www.cocinayvino.com/wp-content/uploads/2018/08/pizza-napolitana-2-e1534286138178-1200x675.jpg',
            preu: 10.99
        },
        {
            id: 3,
            nom: 'Boví amb Pernil Serrano i pinya',
            tipus: 'Hamburguesa',
            descripcio: 'Alguns dels seus ingredients són: Carn vedella, Pernil salat llescat, Pinya natural, Formatge Gouda, Oli d`oliva verge, Sal i Pebre negre mòlt.',
            imatge: 'https://siempremujer.com/imgs/images/image-61841.jpg',
            preu: 10.99
        },
        {
            id: 4,
            nom: 'Shack burger de formatge',
            tipus: 'Hamburguesa',
            descripcio: 'Una de les hamburgueses més famoses de Nova York. L`hamburguesa clàssica de Shake Shack, en presentació individual o doble. Totes les hamburgueses d`aquest tipus són de carn de vedella i per acompanyar-la, les famoses patates fregides arrissades.',
            imatge: 'https://www.dondeir.com/wp-content/uploads/2020/04/shack-burger-3.jpg',
            preu: 13.99
        },
        {
            id: 5,
            nom: 'Clàssica de vedella, formatge i bacó',
            tipus: 'Hamburguesa',
            descripcio: 'Dins dels ingredients d`aquesta delícia trobem: Pa de motlle, Carn de vedella, Herbes provençals, Mostassa de Dijon, Pebre negre mòlt i oli d`oliva verge.',
            imatge: 'https://media-cdn.tripadvisor.com/media/photo-s/1b/98/68/d3/bacon-cheese-burguer.jpg',
            preu: 9.99
        },
        {
            id: 6,
            nom: 'Aigua',
            tipus: 'Beguda',
            descripcio: 'ampolla d`aigua de mig llitre',
            imatge: 'https://elfornet.com/media/catalog/product/cache/728587fcd73f36684dd4a1c3c4b36cfb/a/g/agua_sin_gas_01.jpg',
            preu: 1.5
        },
        {
            id: 7,
            nom: 'Coca-Cola',
            tipus: 'Beguda',
            descripcio: 'ampolla d`coca-cola de 330 mil·lilitres',
            imatge: 'https://sc04.alicdn.com/kf/U709118c16a9547dfaaf7c9dbf542a8f58.jpeg',
            preu: 2
        }
    ]
);

db.productes.find().pretty();