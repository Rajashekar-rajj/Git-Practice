#!/bin/bash
LOGS_FOLDER="/var/log/shall-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) #echo "11_redirector.sh | cut -d "." -f1" --> $0 ->11_redirectors(name modified)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
#root user id will be 0
echo "user id is $USERID"
if [ $USERID -ne 0 ]
   then 
       echo -e "$R Please run this script with root priveleges $N" -a $LOG_FILE

       exit 1
fi

VALIDATE(){
    if [$1 -eq 0]
       then
             echo -e "$G $2 success.... $N" | tee -a $LOG_FILE
             exit 1
    else
        echo "$R $2 not success... $G" | tee -a $LOG_FILE
    fi

}
USAGE(){
    echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1 package2 ..."
    exit 1
}

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@ # $@ refers to all arguments passed to it
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed..nothing to do $N" | tee -a $LOG_FILE
    fi
done