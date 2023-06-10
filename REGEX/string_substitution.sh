#!/usr/bin/env bash

# /regexpr constant/
# "string literal"

echo 'aaaabcd' | awk '{sub(/a+/, "<A>"); print}' # substitution
echo 'D43F 6401 4536 9C51 D786  DDEA 76F1 A20F F987 672F' | awk '{gsub(/ /, "")} {print}'
echo "1234567890" | awk 'BEGIN {digits_regex = "[[:digit:]]+"}; $0 ~ digits_regex {print}' # convert a string to a number
echo "a b c d e f" | awk '{gsub(/\s/, ""); print $0}' # deletes all spaces with
echo ")*dfshgffg&d@#^!g)68301" | awk '{gsub(/\W/, ""); print }' # prints only alnum characters
echo ")*dfshgffg&d@#^!g)68301" | awk '{gsub(/\w/, ""); print }' # prints only non alnum characters
echo "stowaway" | awk '/\<stow/ {print}' # </ matches all words that match stow at the start of the string
echo "stowaway" | awk '/away\>/ {print}' # \> matches all words that end in away at the end of the string
echo "getter getting gagol" | awk '/go?\y/ {print}' # if the last 2 letters of a word are 'go'+0 or 1 charachers the line will print
echo "getter going getting " | awk '/\ygo/ {print}' # if the first 2 letters of a word are 'go' line will print
echo "getter gone getting " | awk '/\ygo(ne)?\y/ {print}' # if the string has 'go' or 'gone' line will print
echo "getter gone getting " | awk '/\ygo(ne)?\y/ {print}' # if the string has 'go' or 'gone' line will print
echo "crate " | awk '/\Brat\B/ {print}' # if rat is in a word with at least a character on both sides which cant be a space the line will print
echo "before" | awk '/\Brat\B/ {print toupper($0)}'
echo "something" | awk '{print toupper($0)}'
echo "SOMETHING" | awk '{print tolower($0)}'
echo "SoMEtHiNg" | awk '{IGNORECASE=1; if($0 ~ /something/ ) print tolower($0)}'
echo "SoMEtHiNg" | awk 'IGNORECASE=0 tolower($0) ~ /something/ {print toupper($0)}'
# echo "SoMEtHiNg" | awk 'IGNORECASE=0 && /SoMEtHiNg/ {print $0}'
echo "SoMEtHiNg" | awk 'IGNORECASE=1 || /something/ {print $0}'
