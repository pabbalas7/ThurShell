#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started excetued $TIMESTAMP" &>>$LOGFILE
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "ERROR:: $2 ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $ID ne 0 ]
then 
  echo -e $R ERROR:: Please run this script with root access $N 
  exit 1
else
  echo -e "You are root user"
fi

yum install mysql &>>$LOGFILE

VALIDATE $? "Installing mysql"

yum install git &>>$LOGFILE

VALIDATE $? "Installing git"


