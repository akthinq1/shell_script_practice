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

check_root () {
    if [$USER != 0 ]
    then 
        echo "error: run with root user"
        exit 1
    else
        echo "script executing"
    fi
}

VALIDATE () {
    if [ $1 == 0 ]
    then 
        echo "$2 is successfull"
    else
        echo "$2 is fail"
    fi
}

input () {
    echo "enter inputs while excecuting script"
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