#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Sourcefile="/tmp/shell-script-logs"

if [ ! -d $Sourcefile ]
then 
    echo -e " $R Sourcedirectory : $Sourcefile is not Ava $N
fi

Files-to-delete=$(find $Sourcefile -type f -mtime +14 -name "*.log")

while IFS= read -r line
do 
    echo "Deleting file: $line"
    rm-rf $line
done <<< $Files-to-delete