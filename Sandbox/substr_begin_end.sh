#!/usr/bin/bash

echo h,e,l,l,o  | awk '{
    n = split($0, a, ",")
    print length(a)
    for (i = 1; i <= n; i++) {
        print a[i]
    }
    print "The array has", n, "elements"
}'

