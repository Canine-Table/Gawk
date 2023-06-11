#!/usr/bin/awk -f

BEGIN{
    printf "%#X\n", 255
    printf "%.2f\n", 3.14159
    printf "%+5d\n", 42
    printf "\f"
    printf "%c\n", 65
    printf "%*s\n", width, "Hello"
}
