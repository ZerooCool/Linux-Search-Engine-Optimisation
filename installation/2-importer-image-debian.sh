#!/bin/bash
# Script pour importer l'image Docker de Debian sur la machine virtuelle SEO.

# Message de chargement pour l'image Docker.
read -p "Importer l'image Docker Debian." -t 5
read -p "Passer à l'étape suivante en appuyant sur une touche." -t 5

# Importer l'image Docker de Debian.
read -p "Appuyer sur une touche pour importer l'image docker de debian."
docker pull debian
echo "Importation de l'image Docker Debian terminé."

read -p "Continuer l'installation avec les commandes suivantes depuis le conteneur Docker." -t 5
echo "apt install wget"
echo "wget https://www.github.com LE SCRIPT D'INSTALLATION DU SERVEUR."
echo "sh script.sh"

# Démarrer Debian et entrer dans le shell. Le port 80 est mis en écoute du réseau.
read -p "Appuyer sur une touche pour démarrer Debian et entrer dans le shell. Le port 80 est mis en écoute du réseau."
docker run --name Debian -p 80:80 -t -i debian /bin/bash
