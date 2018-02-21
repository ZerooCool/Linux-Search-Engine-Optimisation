#!/bin/bash

# Doit être logué en root.

echo "  "
echo " Installation de Docker sur Debian Stretch 9 "
sleep 4s
# Logs.txt
cd ~/installeur
echo "$jour - $heure : Installation de Docker sur Debian Stretch 9." >> logs.txt

# todo

echo "  "
echo " ----- Ajout du dépôt dans /etc/apt/sources.list.d/docker.list ----- "
echo "deb https://apt.dockerproject.org/repo debian-stretch main" > /etc/apt/sources.list.d/docker.list
sleep 4s

echo "  "
echo " ----- Installation du paquet dirmngr pour ajouter la clé ----- "
apt install dirmngr
sleep 4s
echo " ----- Le paquet dirmngr a été installé ----- "
sleep 4s

echo "  "
echo " ----- Ajout de la clé ----- "
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sleep 4s
echo " ----- La clé a été ajoutée ----- "
sleep 4s

echo "  "
echo " ----- Mise à jour des dépôts ----- "
apt update
sleep 4s
echo " ----- Mise à jour des dépôts terminée ----- "
sleep 4s

echo "  "
echo " ----- Installation de docker et de docker-compose ----- "
apt install docker-engine docker-compose
sleep 4s
echo " ----- Installation de docker et de docker-compose terminée ----- "
sleep 4s

echo "  "
echo " ----- Démarrage de Docker ----- "
systemctl start docker
sleep 4s
echo " ----- Démarrage de Docker terminé ----- "
sleep 4s
clear

echo "  "
echo " ----- Docker a été installé et démarré ----- "
sleep 4s
echo "  "
echo " ----- Conseil ----- "
sleep 4s
echo " ----- Supprimer les conteneurs et images pour commencer proprement ----- "
sleep 4s
echo " ----- Lancer la commande suivante dans le terminal ----- "
sleep 4s
echo "  "
echo " sh 1-supprimer-conteneurs-et-images.sh "
sleep 4s
echo "  "
echo " ----- Vous ne voulez pas supprimer de conteneurs ou images ? ----- "
sleep 4s
echo " ----- Vous avez terminé et pouvez quitter le terminal ! ----- "
sleep 4s
echo "  "
echo " ----- Conseil ----- "
sleep 4s
echo " ----- Vous pouvez aussi importer une image Docker Debian ----- "
sleep 4s
echo " ----- Lancer la commande suivante dans le terminal ----- "
sleep 4s
echo "  "
echo " sh 2-importer-image-debian.sh "
sleep 4s
