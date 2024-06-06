#!/bin/bash

VALIDATE(){
    if [ $1 -ne 0 ]
    then
     echo "ERROR : $2... is failed"
     exit 1
    else
     echo "$1... is success"
    fi
}

if [ $ID -ne 0 ]
then
 echo "ERROR: please run script with root access"
 exit 1
else
 echo "your  root user"
fi 

yum install mysql -y

VALIDATE $? "Instlling SQL"

yum install git -y

VALIDATE $? "Installing GIT"