# lab2

## Поднятие базы данных

    docker compose up -d


## Подключение к базе данных

    psql -U user -d db -p 5432 -h 127.0.0.1


## Инициализация базы данных и заполнение данными

Инициализация базы данных.

    psql -U user -d db -p 5432 -h 127.0.0.1 -a -f init.sql

Заполение данных из sql.

    psql -U user -d db -p 5432 -h 127.0.0.1 -a -f values.sql

Заполение через csv.

    psql -U user -d db -p 5432 -h 127.0.0.1 -c "copy airport from STDIN with delimiter as ','" < csv/airport.csv
    psql -U user -d db -p 5432 -h 127.0.0.1 -c "copy flight (number, departure_date, arrival_date, status, airport_departure, airport_arrival) from STDIN with delimiter as ','" < csv/flight.csv
    psql -U user -d db -p 5432 -h 127.0.0.1 -c "copy account_passenger (email, password) from STDIN with delimiter as ','" < csv/account_passenger.csv


## Проверка значений

    $ psql -U user -d db -p 5432 -h 127.0.0.1
    Password for user user:
    psql (14.3, server 14.9 (Debian 14.9-1.pgdg120+1))
    Type "help" for help.

    db=# select * from airport;
     id  |          name          | country |       city
    -----+------------------------+---------+------------------
     DME | domodedovo             | Russia  | Moscow
     SVO | Sheremetyevo           | Russia  | Moscow
     LED | Pulkovo                | Russia  | Saint-Petersburg
     IKT | Airport_Irkutsk        | Russia  | Irkutsk
     VKO | Vnukovo                | Russia  | Moscow
     KUF | Kurumoch               | Russia  | Samara
     KJA | Airport_Krasnoyarsk    | Russia  | Krasnoyarsk
     OVB | Tolmachevo             | Russia  | Novosibirsk
     VVO | Knevichi               | Russia  | Vladivostok
     MRV | Airport_Mineral_Waters | Russia  | Mineral Waters
    (10 rows)


## Удаление docker контейнера

    docker compose down -v


## Изменения в базе данных

Номер рейса был изменён с integer на varchar.

Пассажиру были добавлены поля тип документа, данные документа, дата выдачи (правки из первой лабы).
