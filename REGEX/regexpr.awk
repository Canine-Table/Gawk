#!/usr/bin/awk -f

/li/ {print $2} # print the second field if that line if that line constains 'li'
{if($1 ~ /J/) print}
{if($1 !~ /J/) print}
# abc* = abccccccccccccc
# (abc)* = abcabcabcabcabc
# [abc] a or b or c
# [^abc] not a and not b and not c
# fe?d = fd, fed
# wh{3}y = whhhy
# wh{3,5}y = whhhy, whhhhhy, whhhhhy
# wh{2,}y = whhy,whhhy,whhhhywhhhhhy and so on
# [d\]] = d or ]
# [.ch.] = collating symbol
# [[=e=]] = equivalents class






