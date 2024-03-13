# lab6

## Поднятие базы данных

    docker compose up -d


## Подключение к базе данных

    docker exec -it mongo_itmo
    mongosh --username mongo --password mongo


## Создание коллекций и заполнение данными

account_passenger

    const user1 = db.account_passenger.insertOne({
        _id: '1',
        email: 'email1@mail.ru',
        password: 'password1',
    }).insertedId;

    const user2 = db.account_passenger.insertOne({
        _id: '2',
        email: 'email2@mail.ru',
        password: 'password2',
    }).insertedId;

    const user3 = db.account_passenger.insertOne({
        _id: '3',
        email: 'email3@mail.ru',
        password: 'password3',
    }).insertedId;

airport

    db.airport.insertMany([
        {
            _id: 'DME',
            name: 'domodedovo',
            country: 'Russia',
            city: 'Moscow',
        },
        {
            _id: 'SVO',
            name: 'Sheremetyevo',
            country: 'Russia',
            city: 'Moscow',
        },
        {
            _id: 'LED',
            name: 'Pulkovo',
            country: 'Russia',
            city: 'Saint-Petersburg',
        }
    ]);

passenger

    db.passenger.insertMany([
        {
            _id: '1',
            first_name: 'John',
            last_name: 'Doe',
            date_of_birth: '2002-10-10',
            data_document: '1234 654321',
            date_of_issue: '2018-10-19',
            type_document: 'Passport',
            account_passenger_id: user1,
        },
        {
            _id: '2',
            first_name: 'Jane',
            last_name: 'Smith',
            date_of_birth: '2002-10-10',
            data_document: '1234 654321',
            date_of_issue: '2018-10-19',
            type_document: 'Passport',
            account_passenger_id: user2,
        },
        {
            _id: '3',
            first_name: 'Michael',
            last_name: 'Johnson',
            date_of_birth: '2002-10-10',
            data_document: '1234 654321',
            date_of_issue: '2018-10-19',
            type_document: 'Passport',
            account_passenger_id: user3,
        }
    ]);


## Создание индексов

    db.airport.createIndex(
        {
            _id: 'text',
            name: 'text',
        },
        { name: 'airportTextSearch', weights: { _id: 2, name: 1 } }
    );


queryPlanner

    db.airport.explain().find({
        $text: { $search: 'domodedovo' }
    });


## Создание представления

Добавление поля email и password

    db.createView(
        'passenger_view',
        'passenger',
        [
            {
                $lookup: {
                    from: 'account_passenger',
                    localField: '_id',
                    foreignField: '_id',
                    as: 'account_passenger'
                }
            },
            { $project: { "account_passenger._id": 0 } }
        ]
    );

Просмотр

    db.passenger_view.find({});

## Удаление docker контейнера

    docker compose down -v
