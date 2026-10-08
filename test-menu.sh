#!/bin/bash

while true
do
    echo "1) Afficher"
    echo "2) Tester"
    echo "3) Quitter"

    read -p "Choix : " choice

    case "$choice" in
        1)
            echo "Tu as choisi 1"
            ;;
        2)
            echo "Tu as choisi 2"
            ;;
        3)
            echo "Au revoir"
            break
            ;;
        *)
            echo "Choix invalide"
            ;;
    esac
done
