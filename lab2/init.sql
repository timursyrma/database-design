CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE airport (
  id VARCHAR(3) PRIMARY KEY,
  name TEXT,
  country TEXT,
  city TEXT
);

CREATE TABLE flight (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  number TEXT,
  departure_date TIMESTAMP WITH TIME ZONE,
  arrival_date TIMESTAMP WITH TIME ZONE,
  status TEXT,
  airport_departure VARCHAR(3),
  airport_arrival VARCHAR(3)
);

CREATE TABLE plane (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  model TEXT,
  manufacturer TEXT,
  number_of_seats INTEGER,
  flight_id uuid
);

CREATE TABLE place (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  number VARCHAR(10),
  class TEXT,
  plane_id uuid,
  passenger_id uuid
);

CREATE TABLE passenger (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  first_name TEXT,
  last_name TEXT,
  date_of_birth DATE,
  data_document TEXT,
  date_of_issue DATE,
  type_document TEXT,
  account_passenger_id uuid
);

CREATE TABLE luggage (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  weight TEXT,
  flight_id uuid,
  passenger_id uuid
);

CREATE TABLE ticket (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  number TEXT,
  flight_id uuid,
  place_id uuid,
  passenger_id uuid
);

CREATE TABLE flight_attendant (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  first_name TEXT,
  last_name TEXT,
  flight_id uuid
);

CREATE TABLE pilot (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  first_name TEXT,
  last_name TEXT,
  flight_id uuid
);

CREATE TABLE account_passenger (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  email TEXT,
  password TEXT
);

ALTER TABLE flight ADD FOREIGN KEY (airport_departure) REFERENCES airport(id);
ALTER TABLE flight ADD FOREIGN KEY (airport_arrival) REFERENCES airport(id);
ALTER TABLE plane ADD FOREIGN KEY (flight_id) REFERENCES flight(id);
ALTER TABLE place ADD FOREIGN KEY (plane_id) REFERENCES plane(id);
ALTER TABLE place ADD FOREIGN KEY (passenger_id) REFERENCES passenger(id);
ALTER TABLE passenger ADD FOREIGN KEY (account_passenger_id) REFERENCES account_passenger(id);
ALTER TABLE luggage ADD FOREIGN KEY (flight_id) REFERENCES flight(id);
ALTER TABLE luggage ADD FOREIGN KEY (passenger_id) REFERENCES passenger(id);
ALTER TABLE ticket ADD FOREIGN KEY (flight_id) REFERENCES flight(id);
ALTER TABLE ticket ADD FOREIGN KEY (place_id) REFERENCES place(id);
ALTER TABLE ticket ADD FOREIGN KEY (passenger_id) REFERENCES passenger(id);
ALTER TABLE flight_attendant ADD FOREIGN KEY (flight_id) REFERENCES flight(id);
ALTER TABLE pilot ADD FOREIGN KEY (flight_id) REFERENCES flight(id);
