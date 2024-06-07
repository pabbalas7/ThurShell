#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started  exceted $TIMESTAMP &>>LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "ERROR:: $2 ... $R Eailed $N "
        exit 1
    else
        echo -e "$2 .. $G  success $N "
    fi
}

if [ $ID -ne 0 ]
then 
  echo -e $R ERROR:: Please run this script with root access $N 
  exit 1
else
  echo -e "You are root user"
fi

for package in $@
do
    yum list installed $package &>> $LOGFILE #check installed or not
    if [ $? -ne 0 ] #if not installed
    then
        yum install $package -y &>> $LOGFILE # install the package
        VALIDATE $? "Installation of $package" # validate
    else
        echo -e "$package is already installed ... $Y SKIPPING $N"
    fi
done