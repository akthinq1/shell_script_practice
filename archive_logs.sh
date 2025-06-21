#!/bin/bash

#$Revision:001$
#$ Sat, Jun 21, 2025 11:55:37 AM $

#variables

BASE=/home/ec2-user/logs
DAYS=10
DEPTH=1
RUN=0

#check if the directory is present or not
if[! -d $BASE]
then
    echo "directory does not exist: $BASE"
    exit 1
fi

#if archive folder is not foud create a new folder
if[! -d $BASE/archive]
then 
    mkdir $BASE/archive
fi

#find the list of files larger than 10MB

for i in 'find $BASE -maxdepth $DEPTH -type f -size +10MB`
do
    if [$RUN -eq 0]
    then
        echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive
        gzip $i || exit 1
        mv $i.gz $BASE/archive || exit 1
    fi
done
