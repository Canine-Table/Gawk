#!/usr/bin/awk -f

# This program prints a nice, friendly message :D

BEGIN {
    {print "Don\47t Panic! This is just",ARGV[0]"."}
    {print "single quote: <\47>"}
    {print "double quote: <\42>"}
    {print "backspace: <\10>"}
    {print "tab: <\11>"}
    {print "exclamation mark: <\41>"}
    {print "hash: <\43>"}
    {print "money: <\44>"}
    {print "modulus: <\45>"}
    {print "and: <\46>"}
    {print "left parenthesis: <\50>"}
    {print "right parenthesis: <\51>"}
    {print "star: <\52>"}
    {print "plus: <\53>"}
    {print "comma: <\54>"}
    {print "minus: <\55>"}
    {print "dot: <\56>"}
    {print "forward slash: <\57>"}
    {print "semicolon: <\72>"}
    {print "colon: <\73>"}
    {print "less than: <\74>"}
    {print "equal: <\75>"}
    {print "greater than: <\76>"}
    {print "question: <\77>"}
    {print variable}
}

