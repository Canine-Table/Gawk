#!/usr/bin/awk -f

function pow(x,y){
    return x ^ y
}

function abs(x){
    y = x * 1 < 0 ? -1 : 1
    return x * y
}

function randint(n) {
    srand()
    return int(1 + rand() * n)
}

function randfloat(x,y) {
    srand()
    return rand() * y - x
}

BEGIN {
    printf "\n\n%30s %s\n","Square root of 56:",sqrt(56)
    printf "%30s %s\n","7 to the power of 7:",pow(7,7)
    printf "%30s %s\n","Absolute value of -65:",abs(-65)
    printf "%30s %s\n","Sine of 50:",sin(50)
    printf "%30s %s\n","Cosine of 50:",cos(50)
    printf "%30s %s\n","Exponential of 5:",exp(5)
    printf "%30s %s\n","Arctangent of 5,5:", atan2(5,5)
    printf "%30s %s\n","Int for 3.14195:",int(3.14195)
    printf "%30s %d\n","random int between 1 and 100:",randint(100)
    printf "%30s %f\n","random float between -5 and 5:",randfloat(10,5)
    printf "%30s %s\n\n","Logarithm of 50:",log(50)

}
