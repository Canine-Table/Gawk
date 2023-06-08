#!/usr/bin/bash

awk -v hi="Hello World" 'BEGIN {
    {print "\42"hi"\42"}
}'
