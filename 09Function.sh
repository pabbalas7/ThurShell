#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 ... FAILED"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
 echo "ERROR: Please run scripit witn root acces"
 exit 1
else
 echo "your rooot user"
fi

yum install mysql -y

VALIDATE $? "Installing MySQL"

yum install git -y

VALIDATE $? "Installing GIT"