# Linux Permission Manager

## Description

Linux Permission Manager est un outil en Bash permettant de consulter et de modifier les permissions des fichiers sous Linux.

Ce projet a été réalisé dans le but d'apprendre et de pratiquer les bases de Linux et de Bash, notamment :

* la navigation dans le système de fichiers ;
* la création et la manipulation de fichiers et dossiers ;
* les permissions Linux ;
* l'utilisation de `chmod` ;
* l'utilisation de `stat` ;
* les variables Bash ;
* les arguments d'un script ;
* les conditions ;
* les fonctions ;
* les boucles ;
* les menus interactifs ;
* la gestion des erreurs ;
* les codes de retour.

Le programme peut être utilisé de deux manières :

1. avec un menu interactif ;
2. directement avec des arguments dans le terminal.

---

## Sommaire

* [Description](#description)
* [Objectifs du projet](#objectifs-du-projet)
* [Fonctionnalités](#fonctionnalités)
* [Prérequis](#prérequis)
* [Installation](#installation)
* [Utilisation](#utilisation)
* [Mode interactif](#mode-interactif)
* [Mode avec arguments](#mode-avec-arguments)
* [Comprendre les permissions Linux](#comprendre-les-permissions-linux)
* [Permissions supportées](#permissions-supportées)
* [Informations affichées](#informations-affichées)
* [Gestion des erreurs](#gestion-des-erreurs)
* [Tests](#tests)
* [Structure du projet](#structure-du-projet)
* [Fonctionnement du script](#fonctionnement-du-script)
* [Commandes Linux utilisées](#commandes-linux-utilisées)
* [Concepts Bash utilisés](#concepts-bash-utilisés)
* [Exemples](#exemples)
* [Limites actuelles](#limites-actuelles)
* [Améliorations possibles](#améliorations-possibles)
* [Objectif pédagogique](#objectif-pédagogique)
* [Statut du projet](#statut-du-projet)
* [Auteur](#auteur)

---

# Objectifs du projet

L'objectif principal est de créer un petit outil pratique tout en apprenant les fondamentaux de Linux et de Bash.

Le projet permet notamment de comprendre :

* comment Linux gère les permissions ;
* comment lire les permissions d'un fichier ;
* comment modifier les permissions ;
* comment vérifier qu'un chemin correspond à un fichier ;
* comment créer des fonctions Bash ;
* comment récupérer des arguments ;
* comment demander une information à l'utilisateur ;
* comment créer un menu ;
* comment utiliser des conditions ;
* comment utiliser des boucles ;
* comment gérer les erreurs proprement.

---

# Fonctionnalités

Linux Permission Manager permet de :

* afficher les permissions symboliques d'un fichier ;
* afficher les permissions numériques ;
* afficher le propriétaire du fichier ;
* afficher le groupe du fichier ;
* vérifier qu'un fichier existe ;
* détecter si un chemin correspond à un dossier ;
* vérifier qu'une permission est autorisée ;
* modifier les permissions avec `chmod` ;
* utiliser un menu interactif ;
* utiliser des arguments directement dans le terminal ;
* gérer les erreurs de saisie ;
* afficher le résultat de la modification.

---

# Prérequis

Pour utiliser ce projet, il faut :

* un système Linux ;
* Bash ;
* les commandes `chmod` et `stat`.

Bash est généralement installé par défaut sur les distributions Linux.

Le projet peut être utilisé sur différentes distributions Linux, notamment :

* Debian ;
* Ubuntu ;
* Kali Linux ;
* Linux Mint ;
* Fedora ;
* Arch Linux ;
* et d'autres distributions disposant de Bash.

---

# Installation

## 1. Entrer dans le dossier du projet

Depuis le terminal :

```bash
cd ~/linux-permission-manager
```

---

## 2. Vérifier les fichiers

Utiliser :

```bash
ls
```

Le projet contient notamment :

```text
examples
perm-manager.sh
test-function-menu.sh
test-read.sh
test-menu.sh
test-while.sh
notes.txt
README.md
```

---

## 3. Rendre le programme exécutable

Utiliser :

```bash
chmod +x perm-manager.sh
```

Le `+x` ajoute le droit d'exécution au script.

Le programme peut ensuite être lancé avec :

```bash
./perm-manager.sh
```

---

## 4. Vérifier la syntaxe du script

Avant d'exécuter le programme, il est recommandé de vérifier sa syntaxe :

```bash
bash -n perm-manager.sh
```

Cette commande analyse le script sans l'exécuter.

Si aucune erreur n'est affichée, la syntaxe Bash est correcte.

---

# Utilisation

Le programme possède deux modes :

```text
Mode 1 : interactif
Mode 2 : avec arguments
```

---

# Mode interactif

Pour lancer le mode interactif :

```bash
./perm-manager.sh
```

Lorsque aucun argument n'est fourni, le programme affiche un menu :

```text
=== Linux Permission Manager ===

1) Show file information
2) Change permissions
3) Exit

Choice:
```

---

## Option 1 : afficher les informations

Choisir :

```text
1
```

Le programme demande ensuite le fichier :

```text
File:
```

Exemple :

```text
File: notes.txt
```

Le programme affiche alors :

```text
Permissions: -rw-r--r--
Numeric permissions: 644
Owner: ghostroot
Group: ghostroot
```

Les informations affichées sont :

* les permissions symboliques ;
* les permissions numériques ;
* le propriétaire ;
* le groupe.

---

## Option 2 : modifier les permissions

Choisir :

```text
2
```

Le programme demande le fichier :

```text
File:
```

Exemple :

```text
File: notes.txt
```

Puis il demande la permission :

```text
Permission:
```

Exemple :

```text
Permission: 755
```

Si la permission est autorisée, le programme exécute `chmod`.

Résultat :

```text
Permission 755 applied successfully.
```

---

## Option 3 : quitter

Choisir :

```text
3
```

Le programme affiche :

```text
Exiting...
```

Puis il quitte le menu.

---

# Mode avec arguments

Le programme peut également être exécuté directement avec deux arguments.

La syntaxe est :

```bash
./perm-manager.sh <file> <permission>
```

Exemple :

```bash
./perm-manager.sh notes.txt 644
```

Dans cet exemple :

```text
notes.txt
```

est le fichier à traiter.

Et :

```text
644
```

est la permission demandée.

Le programme effectue plusieurs vérifications avant de modifier le fichier.

---

# Vérifications effectuées

Lorsque le programme reçoit :

```bash
./perm-manager.sh notes.txt 755
```

il vérifie notamment :

1. que le fichier existe ;
2. que le chemin correspond bien à un fichier ;
3. que la permission est autorisée ;
4. que `chmod` peut effectuer la modification.

Après la modification, le programme affiche la nouvelle permission numérique.

---

# Comprendre les permissions Linux

Sous Linux, les permissions déterminent les opérations qu'un utilisateur peut effectuer sur un fichier.

Les trois permissions principales sont :

```text
r = read
w = write
x = execute
```

En français :

```text
r = lecture
w = écriture
x = exécution
```

Les permissions sont appliquées à trois catégories :

```text
user
group
others
```

C'est-à-dire :

```text
user   = propriétaire
group  = groupe
others = autres utilisateurs
```

---

# Valeurs numériques

Chaque permission possède une valeur numérique :

| Permission | Signification | Valeur |
| ---------- | ------------- | ------ |
| `r`        | lecture       | `4`    |
| `w`        | écriture      | `2`    |
| `x`        | exécution     | `1`    |

Les valeurs sont additionnées pour obtenir une permission numérique.

Par exemple :

```text
r + w
4 + 2
= 6
```

Donc :

```text
rw-
```

correspond à :

```text
6
```

---

# Exemple avec 644

La permission :

```text
644
```

est composée de trois chiffres :

```text
6 4 4
```

Le premier chiffre correspond au propriétaire.

Le deuxième correspond au groupe.

Le troisième correspond aux autres.

Donc :

```text
6 = rw-
4 = r--
4 = r--
```

Ce qui donne :

```text
-rw-r--r--
```

---

# Permissions supportées

Le programme accepte actuellement cinq permissions :

```text
600
640
644
700
755
```

---

## Permission 600

```text
600
```

Correspond à :

```text
rw-------
```

Le propriétaire peut :

* lire ;
* écrire.

Le groupe n'a aucun droit.

Les autres utilisateurs n'ont aucun droit.

---

## Permission 640

```text
640
```

Correspond à :

```text
rw-r-----
```

Le propriétaire peut :

* lire ;
* écrire.

Le groupe peut :

* lire.

Les autres n'ont aucun droit.

---

## Permission 644

```text
644
```

Correspond à :

```text
rw-r--r--
```

Le propriétaire peut :

* lire ;
* écrire.

Le groupe peut :

* lire.

Les autres peuvent :

* lire.

---

## Permission 700

```text
700
```

Correspond à :

```text
rwx------
```

Le propriétaire peut :

* lire ;
* écrire ;
* exécuter.

Le groupe n'a aucun droit.

Les autres n'ont aucun droit.

---

## Permission 755

```text
755
```

Correspond à :

```text
rwxr-xr-x
```

Le propriétaire peut :

* lire ;
* écrire ;
* exécuter.

Le groupe peut :

* lire ;
* exécuter.

Les autres peuvent :

* lire ;
* exécuter.

---

# Informations affichées

Le programme utilise la commande `stat` pour obtenir les informations du fichier.

---

## Permissions symboliques

Commande :

```bash
stat -c "%A" notes.txt
```

Exemple :

```text
-rw-r--r--
```

`%A` permet d'obtenir les permissions sous forme symbolique.

---

## Permissions numériques

Commande :

```bash
stat -c "%a" notes.txt
```

Exemple :

```text
644
```

`%a` permet d'obtenir les permissions sous forme numérique.

---

## Propriétaire

Commande :

```bash
stat -c "%U" notes.txt
```

Exemple :

```text
ghostroot
```

`%U` permet d'obtenir le nom du propriétaire.

---

## Groupe

Commande :

```bash
stat -c "%G" notes.txt
```

Exemple :

```text
ghostroot
```

`%G` permet d'obtenir le nom du groupe.

---

# Gestion des erreurs

Le programme vérifie les erreurs avant d'effectuer les opérations.

---

## Fichier inexistant

Commande :

```bash
./perm-manager.sh fichier-inexistant.txt 644
```

Résultat :

```text
Error: File does not exist.
```

---

## Chemin correspondant à un dossier

Commande :

```bash
./perm-manager.sh . 644
```

Résultat :

```text
Error: Path is a directory.
```

---

## Permission invalide

Commande :

```bash
./perm-manager.sh notes.txt 999
```

Résultat :

```text
Error: Invalid permission.
Allowed permissions: 600, 640, 644, 700, 755
```

---

## Permission manquante

Commande :

```bash
./perm-manager.sh notes.txt
```

Résultat :

```text
Error: No permission specified.
Usage: ./perm-manager.sh <file> <permission>
```

---

## Choix invalide dans le menu

Si l'utilisateur saisit par exemple :

```text
9
```

le programme affiche :

```text
Error: Invalid choice.
```

---

# Tests

Plusieurs tests ont été réalisés afin de vérifier le fonctionnement du programme.

---

## Vérification syntaxique

```bash
bash -n perm-manager.sh
```

Cette commande permet de détecter les erreurs de syntaxe Bash sans exécuter le programme.

---

## Test avec une permission valide

```bash
./perm-manager.sh notes.txt 644
```

---

## Test avec une permission invalide

```bash
./perm-manager.sh notes.txt 999
```

---

## Test avec un fichier inexistant

```bash
./perm-manager.sh fichier-inexistant.txt 644
```

---

## Test avec un dossier

```bash
./perm-manager.sh . 644
```

---

## Vérification après modification

Après avoir modifié une permission, utiliser :

```bash
stat -c "%a" notes.txt
```

Exemple :

```text
755
```

---

# Structure du projet

```text
linux-permission-manager/
│
├── examples/
│
├── perm-manager.sh
│
├── test-function-menu.sh
├── test-read.sh
├── test-menu.sh
├── test-while.sh
│
├── notes.txt
└── README.md
```

---

## `perm-manager.sh`

C'est le script principal du projet.

Il contient :

* les fonctions ;
* la vérification des fichiers ;
* la vérification des permissions ;
* la modification des permissions ;
* le menu interactif ;
* le mode avec arguments ;
* la gestion des erreurs.

---

## `examples/`

Ce dossier contient les éléments utilisés comme exemples dans le cadre du projet.

---

## `test-function-menu.sh`

Ce fichier sert à pratiquer et tester les fonctions Bash avec un menu.

---

## `test-read.sh`

Ce fichier sert à pratiquer la commande `read` et la récupération des saisies utilisateur.

---

## `test-menu.sh`

Ce fichier sert à pratiquer la création d'un menu avec `case`.

---

## `test-while.sh`

Ce fichier sert à pratiquer les boucles `while`.

---

## `notes.txt`

Ce fichier contient les notes d'apprentissage Linux et Bash utilisées pendant la réalisation du projet.

---

## `README.md`

Ce fichier contient la documentation du projet.

---

# Fonctionnement du script

Le script principal est organisé en plusieurs fonctions.

---

## Fonction `show_info`

Cette fonction affiche les informations du fichier :

```bash
show_info() {
    local file="$1"

    echo "Permissions: $(stat -c "%A" "$file")"
    echo "Numeric permissions: $(stat -c "%a" "$file")"
    echo "Owner: $(stat -c "%U" "$file")"
    echo "Group: $(stat -c "%G" "$file")"
}
```

Elle utilise :

* `local` pour créer une variable locale ;
* `$1` pour récupérer le premier argument de la fonction ;
* `stat` pour récupérer les informations ;
* `$(...)` pour récupérer le résultat d'une commande ;
* `echo` pour afficher les informations.

---

## Fonction `is_valid_permission`

Cette fonction vérifie si la permission demandée est autorisée.

Elle utilise `case` :

```bash
case "$permission" in
    600|640|644|700|755)
        return 0
        ;;
    *)
        return 1
        ;;
esac
```

Si la permission est valide :

```bash
return 0
```

est exécuté.

Si elle est invalide :

```bash
return 1
```

est exécuté.

---

## Fonction `apply_permission`

Cette fonction applique la permission au fichier :

```bash
chmod "$permission" "$file"
```

Elle vérifie ensuite si la commande `chmod` a réussi.

---

## Fonction `check_file`

Cette fonction vérifie le chemin fourni.

Elle utilise :

```bash
[ -f "$file" ]
```

pour vérifier s'il s'agit d'un fichier.

Elle utilise :

```bash
[ -d "$file" ]
```

pour vérifier s'il s'agit d'un dossier.

---

## Fonction `menu`

Cette fonction contient le menu interactif.

Elle utilise une boucle :

```bash
while true
do
    ...
done
```

La boucle continue jusqu'à ce que l'utilisateur choisisse l'option `3`.

La commande :

```bash
break
```

permet de sortir de la boucle.

---

# Mode sans argument

Le script commence par vérifier si aucun premier argument n'a été fourni :

```bash
if [ -z "$1" ]; then
    menu
    exit 0
fi
```

Si `$1` est vide, le programme lance le menu interactif.

---

# Mode avec arguments

Si `$1` existe, le programme passe en mode avec arguments.

Il vérifie ensuite que `$2` existe :

```bash
if [ -z "$2" ]; then
    echo "Error: No permission specified."
    ...
fi
```

Dans ce projet :

```text
$1 = fichier
$2 = permission
```

---

# Commandes Linux utilisées

Le projet permet de pratiquer plusieurs commandes Linux importantes.

| Commande  | Fonction                               |
| --------- | -------------------------------------- |
| `pwd`     | afficher le répertoire courant         |
| `ls`      | afficher les fichiers et dossiers      |
| `cd`      | changer de répertoire                  |
| `touch`   | créer un fichier                       |
| `mkdir`   | créer un dossier                       |
| `cat`     | afficher le contenu d'un fichier       |
| `less`    | lire un fichier page par page          |
| `rm`      | supprimer un fichier                   |
| `chmod`   | modifier les permissions               |
| `stat`    | afficher les informations d'un fichier |
| `head`    | afficher le début d'un fichier         |
| `sed`     | afficher ou modifier du texte          |
| `bash -n` | vérifier la syntaxe Bash               |

---

# Concepts Bash utilisés

Le projet utilise plusieurs concepts fondamentaux de Bash.

## Shebang

Le script commence par :

```bash
#!/bin/bash
```

Cette ligne indique que le script doit être interprété avec Bash.

---

## Commentaires

Les commentaires commencent par :

```bash
#
```

Exemple :

```bash
# Display file information
```

Ils servent à expliquer le code et ne sont pas exécutés.

---

## Variables

Exemple :

```bash
file="$1"
```

Une variable permet de stocker une valeur.

---

## Arguments

Le script utilise :

```bash
$1
$2
```

`$1` représente le premier argument.

`$2` représente le deuxième argument.

Exemple :

```bash
./perm-manager.sh notes.txt 644
```

Dans ce cas :

```text
$1 = notes.txt
$2 = 644
```

---

## `read`

La commande `read` permet de demander une information à l'utilisateur.

Exemple :

```bash
read -p "Choice: " choice
```

La saisie est stockée dans la variable `choice`.

---

## Conditions

Le projet utilise :

```bash
if
elif
else
fi
```

Les conditions permettent au programme de prendre des décisions.

---

## Fonctions

Le projet utilise plusieurs fonctions :

```bash
show_info
is_valid_permission
apply_permission
check_file
menu
```

Les fonctions permettent d'organiser le code et d'éviter de répéter les mêmes instructions.

---

## `case`

Le projet utilise `case` pour gérer les choix du menu et vérifier les permissions.

Exemple :

```bash
case "$choice" in
    1)
        ...
        ;;
    2)
        ...
        ;;
    3)
        ...
        ;;
    *)
        ...
        ;;
esac
```

---

## `while`

Le menu utilise une boucle :

```bash
while true
do
    ...
done
```

Elle permet de réafficher le menu tant que l'utilisateur ne choisit pas de quitter.

---

## `break`

```bash
break
```

permet de sortir immédiatement d'une boucle.

---

## `continue`

```bash
continue
```

permet de passer directement à l'itération suivante de la boucle.

---

## Codes de retour

Le projet utilise :

```text
0 = succès
1 = erreur
```

Une fonction peut retourner un résultat avec :

```bash
return 0
```

ou :

```bash
return 1
```

Le script peut également se terminer avec :

```bash
exit 0
```

ou :

```bash
exit 1
```

---

# Exemples complets

## Exemple 1 : lancer le menu

```bash
./perm-manager.sh
```

Puis :

```text
Choice: 1
File: notes.txt
```

Le programme affiche les informations du fichier.

---

## Exemple 2 : modifier une permission

```bash
./perm-manager.sh notes.txt 755
```

Le programme affiche les informations actuelles, applique `755`, puis affiche la nouvelle permission.

---

## Exemple 3 : remettre la permission 644

```bash
./perm-manager.sh notes.txt 644
```

---

## Exemple 4 : vérifier la permission

```bash
stat -c "%a" notes.txt
```

Résultat attendu :

```text
644
```

si la permission a bien été configurée à `644`.

---

# Limites actuelles

Le projet est volontairement simple.

Actuellement :

* seules cinq permissions sont acceptées ;
* un seul fichier est traité à la fois ;
* le programme ne modifie pas le propriétaire ;
* le programme ne modifie pas le groupe ;
* il n'y a pas de gestion avancée des utilisateurs ;
* il n'y a pas de traitement récursif de plusieurs fichiers ou dossiers.

Ces limites permettent de conserver un projet adapté à l'apprentissage des bases de Linux et Bash.

---

# Améliorations possibles

Des fonctionnalités pourraient être ajoutées dans une future version :

* accepter davantage de permissions ;
* permettre de traiter plusieurs fichiers ;
* ajouter une option `--help` ;
* ajouter une option `--version` ;
* demander une confirmation avant une modification ;
* améliorer les tests automatiques ;
* afficher davantage d'informations avec `stat` ;
* permettre une gestion plus avancée des permissions ;
* ajouter une journalisation des opérations.

---

# Objectif pédagogique

Ce projet sert avant tout de projet pratique pour apprendre Linux et Bash.

Les notions étudiées sont notamment :

```text
Linux
│
├── Navigation
│   ├── pwd
│   ├── ls
│   └── cd
│
├── Fichiers et dossiers
│   ├── touch
│   ├── mkdir
│   ├── cat
│   ├── less
│   └── rm
│
├── Permissions
│   ├── r
│   ├── w
│   ├── x
│   ├── chmod
│   └── stat
│
└── Bash
    ├── variables
    ├── arguments
    ├── read
    ├── if
    ├── fonctions
    ├── case
    ├── while
    ├── return
    ├── break
    └── continue
```

Le projet permet donc de mettre en pratique plusieurs notions dans un seul programme concret.

---

# Statut du projet

**Version : 1.0**

Le projet est actuellement fonctionnel.

Il permet de consulter et de modifier les permissions d'un fichier avec les permissions autorisées :

```text
600
640
644
700
755
```

Le projet peut être amélioré ultérieurement avec de nouvelles fonctionnalités.

---

# Auteur

**Ronus-E**

Projet personnel d'apprentissage de Linux et Bash.
