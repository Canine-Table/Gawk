#!/bin/bash
awk '{ for (i = 1; i <= NF; i++) { freq[$i]++ } } END { for (i in freq) { print i ":\t" freq[i] } }' "$1"

