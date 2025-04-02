#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
  echo $($PSQL "truncate teams, games")
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # winner side
  if [[ $WINNER != winner ]]
  then
  # get team_id
    WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER' ")
  # if not found
    if [[ -z $WINNER_TEAM_ID ]]
    then
  # insert team
      INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
  # get new team_id
      if [[ $INSERT_TEAM_RESELT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $WINNER"
      fi
      WINNER_TEAM_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    else
      echo Already exist, W_team_id: $WINNER_TEAM_ID
    fi
  fi
  # opponent side
  if [[ $OPPONENT != opponent ]]
  then
  # get team_id
    OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT' ")
  # if not found
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
  # insert team
      INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT')")
  # get new team_id
      if [[ $INSERT_TEAM_RESELT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $OPPONENT"
      fi
      OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
    else
      echo Already exist, O_team_id: $OPPONENT_TEAM_ID
    fi
  fi
  # insert game record
  if [[ $YEAR != year ]]
  then
    GAME_INSERT_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $W_GOALS, $O_GOALS)")
    if [[ $GAME_INSERT_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games, $YEAR $ROUND $WINNER $OPPONENT
    fi
  fi
  #FILE_INFO=$($PSQL "select * from games full join teams on games.winner_id = teams.team_id order by games.year")
  #echo $FILE_INFO
done