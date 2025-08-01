#!/bin/bash

# requirements
# souceDirectory
# destinationDirectory
# days
# root user or not
# find logs
# zip logs
# delete logs

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:14}
USER=$(id -u)
R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"

LOGS_FOLDER="/var/logs/app-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

# create log folder
mkdir -p $LOGS_FOLDER

check_root () {
    if [ $USER != 0 ]
    then 
        echo "error: run with root user"
        exit 1
    else
        echo "script executing"
        echo
    fi
}

VALIDATE () {
    if [ $1 == 0 ]
    then 
        echo "$2 is successfull"
        echo
    else
        echo "$2 is fail"
        echo
    fi
}

input () {
    echo "enter inputs while excecuting script"
    echo
    echo "ex: sudo sh scriptname source dest days"
    exit 1
}

# validate root user
check_root

# validate number of arguments
if [ $# -lt 2 ]
then
    input
fi

# validate source dir and desti dir

if [ ! -d $SOURCE_DIR ]
then
    echo "source directory $SOURE_DIR not available... please check"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo "desti directory $DEST_DIR not available... please check"
    exit 1
fi