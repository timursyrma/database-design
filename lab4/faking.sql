SELECT anon.init();

CREATE MATERIALIZED VIEW faking AS
SELECT
  id,
  anon.fake_email() AS email,
  anon.lorem_ipsum( characters := LENGTH(account_passenger.password)) AS password
FROM account_passenger;
