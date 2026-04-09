#!/usr/bin/env bash

string=$1
length=${#string}
index=0
reversed=""
while (( index < length )); 
    do reversed="${string:index++:1}$reversed"; 
done;
echo "$reversed"