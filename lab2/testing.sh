#!/usr/bin/env bash

psql -U user -d db -p 5432 -h 127.0.0.1 -a -f init.sql
psql -U user -d db -p 5432 -h 127.0.0.1 -a -f values.sql

psql -U user -d db -p 5432 -h 127.0.0.1 -c "copy airport from STDIN with delimiter as ','" < csv/airport.csv
psql -U user -d db -p 5432 -h 127.0.0.1 -c "copy flight (number, departure_date, arrival_date, status, airport_departure, airport_arrival) from STDIN with delimiter as ','" < csv/flight.csv
psql -U user -d db -p 5432 -h 127.0.0.1 -c "copy account_passenger (email, password) from STDIN with delimiter as ','" < csv/account_passenger.csv
