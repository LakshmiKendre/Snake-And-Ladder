#!/bin/bash

echo "Welcome to Snake & Ladder"

# Declaring Dictionary/Associate Array
declare -A Game

# Declaring CONSTANTS
START_POSITION=0
WIN_POSITION=100

# Declaring variables
playerPosition=0
currentPosition1=0
currentPosition2=0
diceCount=0
player=2

# function to roll die by player
dieRoll(){
randomCheck=$((RANDOM%6 + 1))
echo $randomCheck
}

# Check for options After every move(Snake/Ladder/No-Play)
checkSnakeOrLadder(){
NO_PLAY=0
SNAKE=1
LADDER=2

dieValue=$(dieRoll)
option=$((RANDOM%3))

	case $option in
	$NO_PLAY)
		playerPosition=$playerPosition
		;;
	$SNAKE)
		playerPosition=$(($playerPosition - $dieValue))
		;;
	$LADDER)
		playerPosition=$(($playerPosition + $dieValue))
		;;
	esac
}

# Function to playb game till player reaches Winning position(100)
playTillReachWinPosition(){
while (( playerPosition<WIN_POSITION ))
do
	playerTurn
	checkSnakeOrLadder
	if (( playerPosition<START_POSITION ))
	then
		playerPosition=$START_POSITION
	elif (( playerPosition > WIN_POSITION ))
	then
		playerPosition=$((playerPosition-dieValue))
	fi
	((diceCount++))

	gameForTwoPlayer
	echo "Dice Count=$diceCount  Player$player=${Game[Player$player]}"

	if (( ${Game[Player$player]}==$WIN_POSITION ))
	then
		echo "Player$player won game"
		break
	fi
done
}

#function to Switch player turn
playerTurn(){
	if (( player==2 ))
	then
		player=1
	else
		player=2
	fi
}

#function to play game for two users
gameForTwoPlayer(){
	if (( $player == 1 ))
	then
		currentPosition1=$playerPosition
		Game[Player$player]=$currentPosition1
		playerPosition=$currentPosition2
	else
		currentPosition2=$playerPosition
		Game[Player$player]=$currentPosition2
		playerPosition=$currentPosition1
	fi
}

playTillReachWinPosition
