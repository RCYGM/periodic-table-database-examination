#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ ! $1 ]]; then
  echo "Please provide an element as an argument."
  if [[ $1 =~ ^[0-9]+$ ]]; then
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM elements INNER JOIN properties USING(atomic_number) WHERE atomic_number = $1;")
  else
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM elements INNER JOIN properties USING(atomic_number) WHERE name ILIKE '$1' OR symbol ILIKE '$1';")
  fi
fi
