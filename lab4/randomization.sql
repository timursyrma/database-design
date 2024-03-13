CREATE MATERIALIZED VIEW randomization AS
SELECT
  id,
  first_name,
  last_name,
  anon.random_date() AS date_of_birth,
  anon.random_date() AS date_of_issue,
  account_passenger_id
FROM passenger;
