#!/bin/bash
echo "enter the number"

read -s NUMBER

echo "entered number is $NUMBER"

if [ $NUMBER -gt 20 ]
then 
    echo "$NUMBER is not greater than the 20"
else
    scho "$NUMBER is greater than 20"
fi