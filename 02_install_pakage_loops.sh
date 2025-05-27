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


# #!/bin/bash

# USERID=$(id -u)
# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"
# LOGS_FOLDER="/var/log/shellscript-logs"
# SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
# LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
# PACKAGES=("mysql" "python" "nginx" "httpd")

# mkdir -p $LOGS_FOLDER
# echo "Script started executing at: $(date)" | tee -a $LOG_FILE

# if [ $USERID -ne 0 ]
# then
#     echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
#     exit 1 #give other than 0 upto 127
# else
#     echo "You are running with root access" | tee -a $LOG_FILE
# fi

# # validate functions takes input as exit status, what command they tried to install
# VALIDATE(){
#     if [ $1 -eq 0 ]
#     then
#         echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
#     else
#         echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
#         exit 1
#     fi
# }

# #for package in ${PACKAGES[@]}
# for package in $@
# do
#     dnf list installed $package &>>$LOG_FILE
#     if [ $? -ne 0 ]
#     then
#         echo "$package is not installed... going to install it" | tee -a $LOG_FILE
#         dnf install $package -y &>>$LOG_FILE
#         VALIDATE $? "$package"
#     else
#         echo -e "Nothing to do $package... $Y already installed $N" | tee -a $LOG_FILE
#     fi
# done
