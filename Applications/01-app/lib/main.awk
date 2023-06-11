#!/usr/bin/gawk -f

function pad(n,s){
    t=""
    while (n--) t = t s
    printf "\t%*s\n",length(output),t
}

function pad_border(n,s,a,sa){
    t=""
    side=""
    while (n--) t = t s
    while(a--) side = side sa
    printf "\t%s%*s%s\n",side,length(t)-length(side),t,side
}

function in_array(value, array) {
    for (i in array) {
        if ( value == array[i]) return 1
    }
    if(begining == 0){
        begining = begining + 1
    } else {
        printf "\n\t%s is not a valid choice\n",choice
        pad(length(choice)+22,"~")
    }
    return 0
}

BEGIN{
    cOne = "1) Word Counter"
    cTwo = "2) Occurrence Counter"
    cThree = "Q) (q)uit"
    longest = 0
    FS=" "
    total=0
    begining=0
    choice = ""
    iterable = "1,2,Q"
    split(iterable, a, ",")

    while(!in_array(toupper(choice),a)){
        printf"\n\t%s\n\t%s\n\t%s\n",cOne,cTwo,cThree
        printf "\n\tEnter your choice: "
        getline choice < "/dev/tty"
    }
    begining = 0
}
{
    switch(choice) {
        case 1:
            total+=NF
            svalue = sprintf("Line Number: %-10i Words: %-10i Word Calculator: %i + %i = %i",FNR,NF,NF,total-NF,total)
            if(begining == 0){
                begining = 1
                pad(length(svalue),"_")
            }

            if(NF > 0){
                printf "\n\tLine Number: %-10i Words: %-10i Word Calculator: %i + %i = %i\n",FNR,NF,NF,total-NF,total
                pad(length(svalue),"_")
            }
            break
        case 2:
            words = 0
            for (i = 1; i <= NF; i++) {
                freq[$i]++
                if(longest < length($i)) longest = length($i)
                if(NF > words) words = NF
            }
            break
        case "Q":
        case "q":
            exit
    }

}END{

    switch(choice) {
        case 1:
            printf "\n\tTotal words: %i\n",total
            pad(length(total)+13,"_")
            break
        case 2:
            v = 0
            for (i in freq) if(freq[i] > v) v = freq[i]
            longest = longest + 6
            characters = 0
            pad_border(longest+length(v),"_",1,"_")
            for (i in freq){
                pad_border(longest+length(v)," ",1,"|")
                printf "\t| %s: %*i |\n",i,longest-length(i)+length(v)-4,freq[i]
                pad_border(longest+length(v),"_",1,"+")
                if(length($0) > characters) characters = length($0)
            }

            padder = sprintf("longest record was %i characters long.",characters)
            print "\n\tlongest record was",characters,"characters long.","\t"
            pad(length(padder),"_")

            padder = sprintf("longest record was %i words long",words)
            print "\n\tlongest record was",words,"words long","\t"
            pad(length(padder),"_")

            padder = sprintf("this document had %i unique words.",length(freq))
            print "\n\tthis document had",length(freq),"unique words."
            pad(length(padder),"_")
    }

}
