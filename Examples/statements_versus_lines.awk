#!/usr/bin/awk -f

# gawk ignores newline after any of the following symbols
# , { ? : || && do else

/12/ {print $0}
/21/ {print $0}
