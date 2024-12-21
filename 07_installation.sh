#!/bin/bash
# USERID=$(id -u)
# #root user id will be 0
# echo "user id is $USERID"
# if [ $USERID -ne 0 ]
#    then 
#        echo "Please run this script with root priveleges"

#        exit 1
# fi

# dnf list installed ngnix

# if [ $? -ne 0 ]
#     then 
#     echo "the nginx is not installed, going to install...."
#             dnf install ngnix -y 
# else 
#     if [ $? -ne 0 ]
#        echo "ngnix is not installed please check...."
#        exit 1
#     else
#     echo "Git is already installed, nothing to do.."
# fi

USERID=$(id -u)
#echo "User ID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root priveleges"
    exit 1
fi

dnf list installed git # Just checking whether installed or not

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y # here installing
    if [ $? -ne 0 ]
    then
        echo "Git installation is not success...check it"
        exit 1
    else
        echo "Git installation is success"
    fi
else
    echo "Git is already installed, nothing to do.."
fi



