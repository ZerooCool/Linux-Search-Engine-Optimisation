#!/bin/bash
echo "  "
echo "  "

echo " Installer Docker sur Debian Stretch 9 "

echo "  "

echo " Ajout du dépôt dans /etc/apt/sources.list.d/docker.list "
echo "deb https://apt.dockerproject.org/repo debian-stretch main" > /etc/apt/sources.list.d/docker.list

# echo "  "

echo " Si l'ajout de la clé n'est pas acceptée il manque peut être le paquet dirmngr. "
echo " Installation du paquet dirmngr avec la commande : apt install dirmngr "
apt install dirmngr

echo "  "

echo " Ajout de la clé "
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "  "

echo " Mise à jour des dépôts "
apt update

echo "  "

echo " Installation de docker et de docker-compose "
apt install docker-engine docker-compose

echo "  "

echo " Démarrer Docker "
systemctl start docker
