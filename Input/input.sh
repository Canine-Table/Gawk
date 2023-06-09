#!/usr/bin/env bash
# FILENAME = current inputfile
# FNR = current record number being read of current inputfile
# NR = current record number being read of all inputfiles
# RS = Record separator character (default is \n)
# NF = number of fields.
# RT = RT == RS when at the end of the a record

# $1 = $1   this forces awk/gawk to recreate the record
# getline

# -F\\\\ = \
# FS="\\.." = .?
# FS="\.." = ..
# FS == regexp
# FS == ""

function multiply(){
    for i in $(seq 1 $1); do
        echo $i | gawk '{$1=$0; $2 = $0; $3 = $0*$0};{print $1,"*",$2,"=",$3}'
    done
} # multiply $1

function get_gawk(){
    gawk 'BEGIN{RS="u"};{print $0}' lib/mail-list.txt
    gawk '{print} RS="([[:upper:]])"' lib/mail-list.txt
    gawk --posix 'BEGIN{RS = "u"}; {print NF}' lib/mail-list.txt
    gawk 'BEGIN{RS="(\n|[[:upper:]])"};{print "Record =",$0,"and RT = [",RT,"]"}' lib/mail-list.txt
    gawk 'BEGIN{RS="\0"};{print}' lib/mail-list.txt
    gawk '{printf "%-14s %s\n",$1,$NF}' lib/mail-list.txt
    gawk '/li/ {printf "%-14s %-14s %i\n",$1,$NF,NR}' lib/mail-list.txt
    gawk '{print $NR}' lib/mail-list.txt
    gawk '{print $(2*2)}' lib/mail-list.txt
    gawk '{print $(NF-2),$NF,NF}' lib/mail-list.txt
    gawk '{FS=" "; OFS=":";  $99="Hello World" }; {printf "%-14s %14s\n","Field count: "NF,$0}' lib/mail-list.txt
    gawk '{printf "\n%-10s %s\n%s\n","NF = "NF,"Value = "$NF,"Record = "$0} NF=3 {printf "\n%-10s %s\n%s\n","NF = "NF,"Value = "$NF,"Record = "$0}' lib/mail-list.txt
    echo 'xxAA xxBBxx C' | gawk -F '(^+x)|( +)' '{for(i=1;i<=NF;i++) printf "--> %s <--\n",$i}'
    echo a b | gawk 'BEGIN{ FS="\0"};{
        for(i=1;i<=NF;i++) printf "Field %s is %s.",i,$i
    }'

gawk 'BEGIN{FIELDWIDTHS="10 20 30"
};{print substr($1,1,3),substr($1,2,4),substr($3,1,2)}' <<EOF
John Smith 1234567890
Alice Cooper 0987654321
Bob Jones 1112223333
EOF

    gawk -F: '$5 == ""' /etc/passwd
    gawk -F'\n' '$5 == ""' lib/mail-list.txt # when you do this $1 is the same as $0
    sed 1q /etc/passwd | gawk -F: '{print $1}'
    echo 'aCa' | gawk 'IGNORECASE=1 {FS="[c]";print $0}'
} # get_gawk


