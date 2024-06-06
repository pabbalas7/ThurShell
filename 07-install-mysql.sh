#!/bin/bash
ID=$(id -u)

if [ $ID -ne 0 ]
then
 echo "ERROR: please run script with root access"
 exit 1
else
 echo "your  root user"
fi 

yum install mysql -y

if [ $? -ne 0 ]
then
 echo "installing mysql is failed"
else
 echo "installing mysql i success"
fi

yum install git -y

if [ $? -ne 0 ]
then
 echo "installing git is failed"
else
 echo "installing git i success"
fi
