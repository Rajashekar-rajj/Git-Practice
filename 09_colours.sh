#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
#root user id will be 0
echo "user id is $USERID"
if [ $USERID -ne 0 ]
   then 
       echo -e "$R Please run this script with root priveleges $N"

       exit 1
fi

VALIDATE(){
    if [$1 -eq 0]
       then
             echo -e "$G $2 success.... $N"
             exit 1
    else
        echo "$R $2 not success... $G"    
    fi

}

dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed, going to install it..."
            dnf install nginx -y
       VALIDATE $? "nginx installed"
else
   echo -e "$G Nginx is already installed, nothing to do.. $N"   
fi
