#!/bin/bash

VALIDATE(){
    if [$1 -eq 0]
       then
             echo "$2 success...."
    else
        echo "$2 not success..."    
    fi

}

USERID=$(id -u)
#root user id will be 0
echo "user id is $USERID"
if [ $USERID -ne 0 ]
   then 
       echo "Please run this script with root priveleges"

       exit 1
fi

dnf list installed nginx

VALIDATE $? "nginx Package"

# if [ $? -ne 0 ]
# then 
#     echo "nginx is not installed, going to install it..."
#             dnf install nginx -y
#         if [ $? -ne 0 ]
#             then
#                 echo "nginx installation is not success...check it"
#         exit 1
#      else
#        echo "nginx installation is success"
#     fi             
# else
#    echo "Git is already installed, nothing to do.."   
# fi
