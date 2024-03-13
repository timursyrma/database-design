CREATE VIEW passenger_view AS
SELECT
    t1.id,
    t1.first_name,
    t1.last_name,
    t1.date_of_birth,
    t1.data_document,
    t1.date_of_issue,
    t1.type_document,
    t2.email,
    t2.password
FROM passenger AS t1
LEFT JOIN account_passenger as t2 ON t1.account_passenger_id = t2.id;
