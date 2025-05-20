#!bin/bash

# check super/root user or not
#hint -> if root user "id -u == 0"

check_user=$(id -u)

if [ $check_user -ne 0 ]
then
    echo "error:: pleae run the cmd with root access"
    exit 1 #status for failue # exit status other than 0 upto 127
else
    echo "script running with root access"
fi

#create a validate function for success or failure the cmd

validate(){
    if [ $1 -eq 0 ]
    then
        echo "Installing the $2 is ... success"
    else
        echo "Installing the $2 is ... failure"
        exit 1
    fi
}

echo -e "`\e[1m`\e[32m enter packege name \e[0m"

read module

dnf list installed $module
if [ $? -ne 0 ]
then
    echo "$module is not installed... installing now"

    dnf install $module -y
    #validate installed or not
    validate $? "nginx"
else
    echo "$module is already installed.... Nothing to do"
fi

