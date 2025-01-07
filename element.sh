#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ ! $1 ]]; then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]; then
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM elements INNER JOIN properties USING(atomic_number) WHERE atomic_number = $1;")
  else
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM elements INNER JOIN properties USING(atomic_number) WHERE name ILIKE '$1' OR symbol ILIKE '$1';")
  fi
  if [[ -z $ELEMENT_DATA ]]; then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_DATA" | while IFS='|' read ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS; do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
fi
