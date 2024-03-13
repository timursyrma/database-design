#!/usr/bin/env bash

psql -U user -d db -p 5432 -h 127.0.0.1 -a -f account_passenger.sql
psql -U user -d db -p 5432 -h 127.0.0.1 -a -f airport.sql
