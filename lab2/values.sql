INSERT INTO airport (id, name, country, city)
VALUES ('DME', 'domodedovo', 'Russia', 'Moscow'),
       ('SVO', 'Sheremetyevo', 'Russia', 'Moscow'),
       ('LED', 'Pulkovo', 'Russia', 'Saint-Petersburg'),
       ('IKT', 'Airport_Irkutsk', 'Russia', 'Irkutsk'),
       ('VKO', 'Vnukovo', 'Russia', 'Moscow');

INSERT INTO flight (number, departure_date, arrival_date, status, airport_departure, airport_arrival)
VALUES ('FV 6029', (SELECT NOW()), (SELECT NOW()), 'Scheduled', 'IKT', 'DME'),
       ('DP 893', (SELECT NOW()), (SELECT NOW()), 'Delayed', 'DME', 'LED'),
       ('FV 6086', (SELECT NOW()), (SELECT NOW()), 'Cancelled', 'LED', 'VKO'),
       ('FV 6357', (SELECT NOW()), (SELECT NOW()), 'Completed', 'SVO', 'IKT'),
       ('5N 597', (SELECT NOW()), (SELECT NOW()), 'Scheduled', 'LED', 'DME');

INSERT INTO plane (model, manufacturer, number_of_seats, flight_id)
VALUES ('A319', 'Antonov', 100,              (SELECT id FROM flight WHERE number = 'FV 6029')),
       ('SU95', 'Airbus', 150,               (SELECT id FROM flight WHERE number = 'DP 893')),
       ('A21N', 'Boeing', 200,               (SELECT id FROM flight WHERE number = 'FV 6086')),
       ('B738', 'Bombardier Aerospace', 250, (SELECT id FROM flight WHERE number = 'FV 6357')),
       ('A320', 'Boeing', 300,               (SELECT id FROM flight WHERE number = '5N 597'));

INSERT INTO account_passenger (email, password)
VALUES ('john.doe@example.com', 'password1'),
       ('jane.smith@example.com', 'password2'),
       ('michael.johnson@example.com', 'password3'),
       ('emily.brown@example.com', 'password4'),
       ('david.miller@example.com', 'password5');

INSERT INTO passenger (first_name, last_name, date_of_birth, data_document, date_of_issue, type_document, account_passenger_id)
VALUES ('John', 'Doe', '2004-10-19', '1234 654321', '2018-10-19', 'Passport', (SELECT id FROM account_passenger WHERE email = 'john.doe@example.com')),
       ('Jane', 'Smith', '2004-10-19', '1234 654322', '2018-10-19', 'Passport', (SELECT id FROM account_passenger WHERE email = 'jane.smith@example.com')),
       ('Michael', 'Johnson', '2004-10-19', '1234 654323', '2018-10-19', 'Passport', (SELECT id FROM account_passenger WHERE email = 'michael.johnson@example.com')),
       ('Emily', 'Brown', '2004-10-19', '1234 654324', '2018-10-19', 'Passport', (SELECT id FROM account_passenger WHERE email = 'emily.brown@example.com')),
       ('David', 'Miller', '2004-10-19', '1234 654325', '2018-10-19', 'Passport', (SELECT id FROM account_passenger WHERE email = 'david.miller@example.com'));

INSERT INTO place (number, class, plane_id, passenger_id)
VALUES ('1A', 'Economy', (SELECT id FROM plane WHERE model = 'A319'),     (SELECT id FROM passenger WHERE last_name = 'Doe')),
       ('2B', 'Business', (SELECT id FROM plane WHERE model = 'SU95'),    (SELECT id FROM passenger WHERE last_name = 'Smith')),
       ('3C', 'First Class', (SELECT id FROM plane WHERE model = 'A21N'), (SELECT id FROM passenger WHERE last_name = 'Johnson')),
       ('4D', 'Economy', (SELECT id FROM plane WHERE model = 'B738'),     (SELECT id FROM passenger WHERE last_name = 'Brown')),
       ('5E', 'Business', (SELECT id FROM plane WHERE model = 'A320'),    (SELECT id FROM passenger WHERE last_name = 'Miller'));

INSERT INTO luggage (weight, flight_id, passenger_id)
VALUES ('10kg', (SELECT id FROM flight WHERE number = 'FV 6029'), (SELECT id FROM passenger WHERE last_name = 'Doe')),
       ('15kg', (SELECT id FROM flight WHERE number = 'DP 893'),  (SELECT id FROM passenger WHERE last_name = 'Smith')),
       ('20kg', (SELECT id FROM flight WHERE number = 'FV 6086'), (SELECT id FROM passenger WHERE last_name = 'Johnson')),
       ('25kg', (SELECT id FROM flight WHERE number = 'FV 6357'), (SELECT id FROM passenger WHERE last_name = 'Brown')),
       ('30kg', (SELECT id FROM flight WHERE number = '5N 597'),  (SELECT id FROM passenger WHERE last_name = 'Miller'));

INSERT INTO ticket (number, flight_id, place_id, passenger_id)
VALUES ('T123', (SELECT id FROM flight WHERE number = 'FV 6029'), (SELECT id FROM place WHERE number = '1A'), (SELECT id FROM passenger WHERE last_name = 'Doe')),
       ('T456', (SELECT id FROM flight WHERE number = 'DP 893'),  (SELECT id FROM place WHERE number = '2B'), (SELECT id FROM passenger WHERE last_name = 'Smith')),
       ('T789', (SELECT id FROM flight WHERE number = 'FV 6086'), (SELECT id FROM place WHERE number = '3C'), (SELECT id FROM passenger WHERE last_name = 'Johnson')),
       ('T101', (SELECT id FROM flight WHERE number = 'FV 6357'), (SELECT id FROM place WHERE number = '4D'), (SELECT id FROM passenger WHERE last_name = 'Brown')),
       ('T112', (SELECT id FROM flight WHERE number = '5N 597'),  (SELECT id FROM place WHERE number = '5E'), (SELECT id FROM passenger WHERE last_name = 'Miller'));

INSERT INTO flight_attendant (first_name, last_name)
VALUES ('Amy', 'Johnson'),
       ('Brian', 'Smith'),
       ('Catherine', 'Brown'),
       ('Daniel', 'Miller'),
       ('Emma', 'Davis');

INSERT INTO pilot (first_name, last_name)
VALUES ('Frank', 'Wilson'),
       ('Grace', 'Taylor'),
       ('Henry', 'Anderson'),
       ('Isabella', 'Thomas'),
       ('Jack', 'White');
