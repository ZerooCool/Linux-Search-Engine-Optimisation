#!/bin/bash
echo "  "
echo "  "

echo " ----- Démarrage de l'installation ----- "

echo "  "
echo "  "

echo " ----- Importation de l'image Docker Debian ----- "
docker pull debian
echo " ----- Importation de l'image Docker Debian terminée ----- "

echo "  "
echo "  "

echo " ----- Les commandes suivantes installent le serveur web dans le conteneur Docker ----- "
echo " 1) apt install wget"
echo " 2) wget https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/blob/master/installation/3-installer-le-serveur-dans-le-conteneur.sh"
echo " 3) sh 3-installer-le-serveur-dans-le-conteneur.sh"

echo "  "
echo "  "

echo " ----- Entrée dans le shell du conteneur Docker Debian ----- "
echo " ----- Le port 80 est mis en écoute du réseau ----- "
docker run --name Debian -p 80:80 -t -i debian /bin/bash
