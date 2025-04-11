#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"
# if there is a arg input
if [[ $1 ]]
then
  # if number
  if [[ $1 =~ ^[0-9]+$ ]];
  then 
    SELECT_ELEMENT_RESULT=$($PSQL "select p.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius from properties p left join elements e using(atomic_number) left join types t using(type_id) where p.atomic_number = $1 order by atomic_number;")
  # if word
  else
    # if symbol
    if [[  ${#1} < 3 ]]
    then
      SELECT_ELEMENT_RESULT=$($PSQL "select p.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius from properties p left join elements e using(atomic_number) left join types t using(type_id) where e.symbol = '$1' order by atomic_number;")
    # if name
    else
      SELECT_ELEMENT_RESULT=$($PSQL "select p.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius from properties p left join elements e using(atomic_number) left join types t using(type_id) where e.name = '$1' order by atomic_number;")
    fi
  fi
  echo "$SELECT_ELEMENT_RESULT" | while read A_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR A_MASS BAR M_P_C BAR B_P_C
  do
    if [[ -z $SELECT_ELEMENT_RESULT ]]
    then
      echo "I could not find that element in the database."
    else
      echo "The element with atomic number $A_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $A_MASS amu. $NAME has a melting point of $M_P_C celsius and a boiling point of $B_P_C celsius."
      #The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
    fi
  done
# if not
else
  echo "Please provide an element as an argument."
fi