#!/usr/bin/env bash

psql -U postgres -d postgres -p 5432 -h 127.0.0.1 -a -f partitions.sql
