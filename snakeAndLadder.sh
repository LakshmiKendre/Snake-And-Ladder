#!/bin/bash

echo "Welcome to Snake & Ladder"

START_POSITION=0

dieRoll(){
randomCheck=$((RANDOM%6 + 1))
echo $randomCheck
}

dieRoll
