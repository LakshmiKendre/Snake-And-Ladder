#!/bin/bash

echo "Welcome to Snake & Ladder"

declare -A Game

START_POSITION=0
WIN_POSITION=100

playerPosition=0
diceCount=0

dieRoll(){
randomCheck=$((RANDOM%6 + 1))
echo $randomCheck
}

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
playTillReachWinPosition(){
while (( playerPosition<WIN_POSITION ))
do
	checkSnakeOrLadder
	if (( playerPosition<START_POSITION ))
	then
		playerPosition=$START_POSITION
	elif (( playerPosition > WIN_POSITION ))
	then
		playerPosition=$((playerPosition-dieValue))
	fi
	Game[$diceCount]=$playerPosition
	echo "Dice Count= $diceCount" "Player position=${Game[$diceCount]}"
	((diceCount++))
done
} 

playTillReachWinPosition


