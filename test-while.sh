#!/bin/bash

count=1

while [ "$count" -le 3 ]
do
    echo "Compteur : $count"
    count=$((count + 1))
done

