#!/usr/bin/env bash

function Color()
    {
        local WEIGHT="$1"
        declare -u WEIGHT
        case $WEIGHT in
            0|R|REGULAR) WEIGHT=0;;
            1|B|BOLD) WEIGHT=1;;
            2|L|LIGHTER) WEIGHT=2;;
            3|I|ITALIC) WEIGHT=3;;
            4|U|UNDERLINE) WEIGHT=4;;
            5|K|BLINK) WEIGHT=5;;
            7|H|HIGHTLIGHT) WEIGHT=7;;
            8|T|TRANSPARENT) WEIGHT=8;;
            9|S|STRIKE) WEIGHT=9;;
            *) WEIGHT=10;;
        esac

        local FG="$2"
        declare -u FG
        case $FG in
            0|BL|BLACK) FG=30;;
            1|R|RED) FG=31;;
            2|G|GREEN) FG=32;;
            3|Y|YELLOW) FG=33;;
            4|B|BLUE) FG=34;;
            5|P|PURPLE) FG=35;;
            6|T|TEAL) FG=36;;
            7|W|WHITE) FG=37;;
            8|LGR|LGRAY) FG=91;;
            9|LR|LRED) FG=91;;
            10|LG|LGREEN) FG=92;;
            11|LY|LYELLOW) FG=93;;
            12|LB|LBLUE) FG=94;;
            13|LP|LPURPLE) FG=95;;
            14|LT|LTEAL) FG=96;;
            15|LW|LWHITE) FG=97;;
            16|DEF|DEFAULT) FG=98;;
            *) FG=98;;
        esac

        local BG="$3"
        declare -u BG
        case $BG in
            0|BL|BLACK) echo -e "\033[${WEIGHT}:${FG}:40m${@:4}\033[m";;
            1|R|RED) echo -e "\033[${WEIGHT};${FG}:41m${@:4}\033[m";;
            2|G|GREEN) echo -e "\033[${WEIGHT};${FG}:42m${@:4}\033[m";;
            3|Y|YELLOW) echo -e "\033[${WEIGHT};${FG}:43m${@:4}\033[m";;
            4|B|BLUE) echo -e "\033[${WEIGHT};${FG}:44m${@:4}\033[m";;
            5|P|PURPLE) echo -e "\033[${WEIGHT};${FG}:45m${@:4}\033[m";;
            6|T|TEAL) echo -e "\033[${WEIGHT};${FG}:46m${@:4}\033[m";;
            7|W|WHITE) echo -e "\033[${WEIGHT};${FG}:47m${@:4}\033[m";;
            8|LGR|LGRAY) echo -e "\033[${WEIGHT};${FG}:100m${@:4}\033[m";;
            9|LR|LRED) echo -e "\033[${WEIGHT};${FG}:101m${@:4}\033[m";;
            10|LG|LGREEN) echo -e "\033[${WEIGHT};${FG}:102m${@:4}\033[m";;
            11|LY|LYELLOW) echo -e "\033[${WEIGHT};${FG}:103m${@:4}\033[m";;
            12|LB|LBLUE) echo -e "\033[${WEIGHT};${FG}:104m${@:4}\033[m";;
            13|LP|LPURPLE) echo -e "\033[${WEIGHT};${FG}:105m${@:4}\033[m";;
            14|LT|LTEAL) echo -e "\033[${WEIGHT};${FG}:106m${@:4}\033[m";;
            15|LW|LWHITE) echo -e "\033[${WEIGHT};${FG}:107m${@:4}\033[m";;
            16|DEF|DEFAULT) echo -e "\033[${WEIGHT};${FG}:108m${@:4}\033[m";;
            *) echo -e "\033[${WEIGHT};${FG}:108m${@:4}\033[m";;
        esac

        unset WEIGHT FG BG
    }
