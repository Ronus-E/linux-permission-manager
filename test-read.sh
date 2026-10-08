#!/bin/bash
echo "1) Afficher les informations"
echo "2) Modifier les permissions"
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
       echo "Tu as choisi 3"
       ;;
    *)
       echo "Choix invalide"
       ;;
esac
