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