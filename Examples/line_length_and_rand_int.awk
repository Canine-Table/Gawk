#!/usr/bin/awk -f

BEGIN {
    for(i = 1; i <= 7; i++){
        # prints a random int from 0-100 7 times
        print "int number",i":",int(101 * rand())
    }
}
{

    # prints the line with the most characters
    if(length($0) > max) max = length($0)

    # prints the field count of the line
    # with the highest field cound
    if(NF > maxfield) maxfield = NF
    z=(number % 2 == 1 ? "False" : "True")


} END {

    {print "longest input line:",max}
    {print "most fields in a line:",maxfield}

}
