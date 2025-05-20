#!/bin/bash

#list of variables requires
red="\e[32m"

#check root access or not
check_root_access=$(id -u)

if [ $check_root_access -ne 0 ]
then
    echo "Error:: run the script with root access"
    exit 1
else
    echo "script is running... no issues"
fi

validate () {
    echo $1
    echo $2
    if [ $1 -eq 0 ]
    then
        echo "installing $2 is success"
    else
        echo "installing $2 is failure"
        exit 1
    fi
}

install_pack () {
    for package in $@
    do
        dnf list installed $package
        if [ $? -ne 0]
        then
            dnf install $package -y
            validate $? "$package"
            echo "package was installing"
        else
            echo "nothig to do"
        fi
    done            
}

install_pack 