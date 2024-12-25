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

for package in $@ # $@ refers to all arguments passed to it
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.."
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed..nothing to do"
    fi
done

