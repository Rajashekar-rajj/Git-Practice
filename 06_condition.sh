#!/bin/bash
echo "enter the number"

read -s $NUM

if [ $NUM -gt 20 ]
then 
    echo "$NUM is not greater than the 20"
else
    scho "$NUM is greater than 20"