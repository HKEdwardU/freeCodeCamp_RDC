#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "select user_id from user_list where user_name = '$USERNAME'");
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ADD_NEW_USER=$($PSQL "insert into user_list(user_name) values ('$USERNAME');")
  USER_ID=$($PSQL "select user_id from user_list where user_name = '$USERNAME'")
else
  SELECT_USER_RESULT=$($PSQL "select count(*), min(num_of_guess) from game_log where user_id = $USER_ID;")
  echo "$SELECT_USER_RESULT" | while read GAME_COUNT BAR MIN_GUESS
  do
    if [[ "$GAME_COUNT" == 0 ]]
    then
      echo -e "\nWelcome back, $USERNAME! You have played 0 games, and your best game took 0 guesses."
    else
      echo -e "\nWelcome back, $USERNAME! You have played $GAME_COUNT games, and your best game took $MIN_GUESS guesses."
    fi
  done
fi
ANS_NUMBER=$((1 + $RANDOM % 1000))
INSERT_NEW_GAME=$($PSQL "insert into game_log(user_id, ans_number) values ($USER_ID, $ANS_NUMBER);")
echo -e "\nGuess the secret number between 1 and 1000:"
USER_ANSWER=0
NUM_OF_GUESS=0
while [[ "$USER_ANSWER" != "$ANS_NUMBER" ]]
do
  read USER_ANSWER
  ((NUM_OF_GUESS++))
  if [[ ! "$USER_ANSWER" =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ "$USER_ANSWER" -gt "$ANS_NUMBER" ]]
    then
      echo "It's lower than that, guess again:"
    fi
    if [[ "$USER_ANSWER" -lt "$ANS_NUMBER" ]]
    then
      echo "It's higher than that, guess again:"
    else
      break
    fi
  fi
done
echo "You guessed it in $NUM_OF_GUESS tries. The secret number was $ANS_NUMBER. Nice job!"
GAME_ID=$($PSQL "select game_id from game_log where user_id = $USER_ID order by game_id desc limit 1")
GAME_END_RESULT=$($PSQL "update game_log set num_of_guess = $NUM_OF_GUESS where game_id = $GAME_ID")