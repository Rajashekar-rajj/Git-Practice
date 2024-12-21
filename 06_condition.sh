#!/bin/bash
echo "enter the number"

read -s NUMBER

echo "entered number is $NUMBER"

if [ $NUMBER -gt 20 ] #gt, lt, eq, -ne, -ge, -le
then
    echo "Given number is greater than 20"
else
    echo "Given number is less than 20"
fi