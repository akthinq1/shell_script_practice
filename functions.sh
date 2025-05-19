#!/bin/bash

var=$1
TimeStamps=$(date)

Hello () {
    echo "Hello world! $1 $var"
    return 10
}

Hello Anil

ret=!?

print_date () {
    echo "current time and date : $TimeStamps"
}

echo "print return $ret"

print_date

echo "enter input 1 :: "
read num1

echo "enter input 2 :: "
read num2
# num1=$2 # external input
# num2=$3

Addition () {
    total=$(($num1+$num2))
    echo "$total"
}

Addition

