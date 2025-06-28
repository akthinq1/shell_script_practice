#!/bin/bash

USER_ID=$(id -u)
RED="e\[31m"
GREEN="e\[32m"
YEELOW="e\[33m"
RESET="e\[0m"

mkdir -p $LOGS_FOLDER
SOURCE_DIRECTORY=/home/ec2-user/app-logs
LOGS_FOLDER="var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGs_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

if [ $USER_ID -ne 0 ]
then
    echo -e "$RED ERROR:: run the script with root access $RESET" | tee -a $LOG_FILE
    exit 1 #exit status for error
else
    echo -e "$GREEN script is running.... no issues $RESET" | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is... $Green successfully $RESET" | tee -a $LOG_FILE
    else
        echo -e "$2 is... $RED failure $RESET" | tee -a $LOG_FILE
        exit 1
    fi
}
FILES_TO_DELETE=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS=read -r filepath
do
    echo "deleting older files => $filepath"
    rm -rf $filepath
done <<< $filepath #to loop the string output we provide a input to filepath

echo "script executed successfully"