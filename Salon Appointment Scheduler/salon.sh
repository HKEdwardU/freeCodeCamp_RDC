#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo "Welcome to My Salon, how can I help you?"
  fi

  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED
  
  case $SERVICE_ID_SELECTED in
  1) APPOINTMENT 1 ;;
  2) APPOINTMENT 2 ;;
  3) APPOINTMENT 3 ;;
  4) APPOINTMENT 4 ;;
  5) APPOINTMENT 5 ;;
  *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac

}

APPOINTMENT() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(name, phone) values ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  fi

  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
  SERVICE_NAME=$($PSQL "select name from services where service_id = $1")

  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  SERVICE_INSERT_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values ($CUSTOMER_ID, $1, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
