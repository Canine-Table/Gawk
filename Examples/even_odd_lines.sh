#!/usr/bin/bash

awk -v even_or_odd="$1" '{

    if(even_or_odd == 1) {
        {print "even:",NR % 2 == 0}

    } else if(even_or_odd == 0) {
        {print "odd:",NR % 2 == 1}

    } else {print "invalid input"}

} END {
    {print "line count:",NR}
}' ${@:2}
