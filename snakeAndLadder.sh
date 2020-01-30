#!/bin/bash -x

echo "Welcome to Snake & Ladder"

START_POSITION=0
playerPosition=0

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
echo $playerPosition
}

checkSnakeOrLadder 

