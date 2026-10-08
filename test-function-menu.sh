#!/bin/bash

show_message() {
    echo "Bonjour depuis la fonction"
}

test_message() {
    echo "Fonction de test"
}

show_info() {
    echo "$file"
    echo " $(stat -c "%A" "$file")"
}


file="notes.txt"
while true
do
read -p "Choix: " choice
   case "$choice" in
         1)
           read -p "Fichier: " file
                if [ -f "$file" ]; then
                   show_info
                else
                   echo "Error : file does not exist"
                fi
           ;;
         2)
           test_message
           ;;
         3)
           break
           ;;
         *)
           echo "Choix invalide"
           ;;
   esac
done
