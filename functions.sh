#!/bin/bash

var=$1

Hello () {
    echo "Hello world! $1 $var"
    return 10
}

Hello Anil

ret=!?

echo "print return $ret"