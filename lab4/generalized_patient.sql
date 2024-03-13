CREATE MATERIALIZED VIEW generalized_patient AS
SELECT
  'REDACTED'::TEXT AS id,
  first_name,
  'REDACTED'::TEXT AS last_name,
  anon.generalize_daterange(date_of_birth,'decade') AS date_of_birth,
  'REDACTED'::TEXT AS data_document,
  anon.generalize_daterange(date_of_issue,'decade') AS date_of_issue,
  type_document,
  account_passenger_id
FROM passenger;
