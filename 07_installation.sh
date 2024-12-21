#!/bin/bash

USERID=(id -u)
#root user id will be 0
if [ $USERID -et 0 ]
   then 
       echo " "Please run this script with root priveleges"

       exit 1
fi
       