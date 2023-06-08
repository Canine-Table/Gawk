#!/usr/bin/bash

ls -l | awk -v get_date="$1" '$6 == get_date {x += $5} END {

    {print "total bytes for",get_date":",x}
    {print "total kilobytes for",get_date":",x / 1024}

}'
