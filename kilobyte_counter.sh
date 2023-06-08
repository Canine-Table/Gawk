#!/usr/bin/bash

ls -l $1 | awk '{

    {x += $5}

} END {

    {print "total kilobytes:",x / 1024}

}'
