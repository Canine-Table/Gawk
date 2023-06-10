#!/usr/bin/env bash
# FILENAME = current inputfile
# FNR = current record number being read of current inputfile
# NR = current record number being read of all inputfiles
# RS = Record separator character (default is \n)
# NF = number of fields.
# RT = RT == RS when at the end of the a record

# Field Spliting methods = FS, FIELDWIDTHS, FPAT

# $1 = $1   this forces awk/gawk to recreate the record
# getline

# -F\\\\ = \
# FS="\\.." = .?
# FS="\.." = ..
# FS == regexp
# FS == ""

#- int(n): returns the integer part of n
#- log(n): returns the natural logarithm of n
#- sqrt(n): returns the square root of n
#- sin(n): returns the sine of n (in radians)
#- cos(n): returns the cosine of n (in radians)
#- index(s1, s2): returns the position of the first occurrence of s2 in s1
#- length(s): returns the length of s¹
#- substr(s, p, n): returns a substring of s starting from position p with length n
#- split(s, a, fs): splits s into array a using fs as the separator
#- match(s, r): returns the position of the first match of regular expression r in s
#- gsub(r, t, s): replaces all matches of regular expression r with t in s
#- printf(fmt, expr...): prints formatted output according to fmt and expr
#- getline(var): reads a line from the standard input and assigns it to var
#- close(file): closes an open file or pipe identified by file
#- systime(): returns the current time as the number of seconds since 1970-01-01 00:00:00 UTC
#- strftime(fmt, ts): returns a formatted date and time string according to fmt and ts
#- and(x, y): returns the bitwise AND of x and y
#- or(x, y): returns the bitwise OR of x and y
#- xor(x, y): returns the bitwise XOR of x and y
#- typeof(x): returns a string indicating the type of x
#- asort(a): sorts array a in ascending order and returns the number of elements sorted
#- asorti(a): sorts array a by index in ascending order and returns the number of elements sorted
#- gensub(r, t, h, s): replaces h-th match of regular expression r with t in s and returns the result

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
    echo Hello World | gawk '{len = length($i); $0 = substr($0,2,len -2)}{print $0}' # returns 'ello Worl'
    gawk 'BEGIN{ FPAT="([^,]+)|(\"[^\"]+\")" } {

        print "\nNF =",NF
        print "FS Type:",PROCINFO["FS"],"\n"
        for(i=1;i<=NF;i++){

            if(substr($i,1,1) == "\""){

                len = length($i)
                $i = substr($i,2,len - 2)

            }

            printf("$%d = <%s>\n",i,$i)
        }
    }

    ' lib/the_csv_comma_problem.txt

    echo "22 + 20, The answer is 42" | gawk '{n = patsplit($0, a, /[0-9]+/); for (i=1; i<=n; i++) print a[i]}'
    echo "ABCD075BCD156300544E0001000900125349544520494" | awk -v FIELDWIDTHS="4 6 5 4 9 2 2 13" '{for (i=1; i<=NF; i++) print $i}'
    echo "ABCD075BCD156300544E0001000900125349544520494" | awk -v FIELDWIDTHS="4 *" '{print $1; print $2}'
    echo "ABCD075BCD156300544E0001000900125349544520494" | awk -v FIELDWIDTHS="-4 5 5 5 5 5" '{for (i=1; i<=NF; i++) print $i}'
    echo "ABCD075BCD156300544E0001000900125349544520494" | awk 'BEGIN {n=3; len=length($0); for (i=1; i<=len/n; i++) FIELDWIDTHS=FIELDWIDTHS n " "} {for (i=1; i<=NF; i++) print $i}'
    echo "1 2 3 4 5" | awk '{split($0, a); print len(a)}'
    for (i=1; i<=len/n; i++) FIELDWIDTHS=FIELDWIDTHS n " "
    echo "1 2 3 4 5" | awk '{split($0, a); print length(a)}'
    echo 69 | gawk '{print sqrt($0)}'
    echo '9 9' | awk '{$0 = $1 ** $2};{print $0}'
    echo '9 9' | awk '{$0 = $1 ^ $2};{print $0}'
    echo -4 |gawk '{val = ($0 * 1 < 0 ? -1 : 1)};{print $0 * val}' # returns absolute value
} # get_gawk




