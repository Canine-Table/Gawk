#!/usr/bin/bash

awk -v number="$1" 'BEGIN{
    value = (number % 2 == 1 ? "False" : "True")
    print number,"is even:",value
}'
