#!/usr/bin/awk -f

function pad_spliter(){
    output = sprintf("Line Number: %-10i Words: %-10i Word Calculator: %i + %i = %i",FNR,NF,NF,total-NF,total)
    for(j=1;j<=length(output);j++) padder = padder "_"
    print "\t"padder
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

    printf"\n\t%s\n\t%s\n\t%s\n",cOne,cTwo,cThree
    printf "\n\tEnter your choice: "
    getline choice < "/dev/tty"
}
{
    if(choice == 1){
        total+=NF
        padder=""
        if(begining == 0){
            begining = 1
            pad_spliter()
        }

        if(NF > 0){
            printf "\n\tLine Number: %-10i Words: %-10i Word Calculator: %i + %i = %i\n",FNR,NF,NF,total-NF,total
            pad_spliter()
        }
    } else if(choice == 2){
        for (i = 1; i <= NF; i++) {
            freq[$i]++
            if(longest < length($i)) {
                longest = length($i)
            }
        }
    }

}END{

    if(choice == 1){
        padding = "_____________"
        for(i=0;i<length(total);i++) padding = padding "_"
        printf "\n\tTotal words: %i\n\t%s\n",total,padding
    } else if(toupper(choice) == "Q"){
        exit
    } else if(choice == 2){
        padding = "--"
        for(k=1;k<longest;k++){
            padding = padding "-"
        }
        print "\n\t"padding"------"
        padder = length(padding)
        words = 0
        for (i in freq){
            justify = length(padding) - length(i)
            printf "\t|%-*s|",padder+4,""
            printf "\n\t| %s: %*i |\n\t%s\n",i,justify,freq[i],padding"------"
            words = words + 1
        }
        padder = sprintf("longest record was %i characters long",longest)
        padding = "-"
        for(k=1;k<length(padder);k++){
            padding = padding "-"
        }
        print "\n\tlongest record was",longest,"characters long","\n\t"padding"\n"
        padder = sprintf("this document had %i unique words",words)
        padding = "-"
        for(k=1;k<length(padder);k++){
            padding = padding "-"
        }
        print "\n\tthis document had",words,"unique words\n\t"padding,"\n"
    } else {
        invalid = choice
        padding = "~~~~~~~~~~~~~~~~~~~~~~~"
        for(i=1;i<length(invalid);i++){
            padding = padding "~"
        }
        printf "\n\t%s is not a valid choice\n\t%s\n\n",choice,padding
    }
}



