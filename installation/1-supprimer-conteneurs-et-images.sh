#!/bin/bash
echo "  "
echo " ----- Arrêt des conteneurs ----- "
docker stop $(docker ps -a -q)
sleep 4s
echo "  "
echo " ----- Suppression des conteneurs ----- "
docker rm $(docker ps -a -q)
sleep 4s
echo "  "
echo " ----- Suppression des images ----- "
docker rmi $(docker images -q)
echo "  "
sleep 4s
clear
echo " ----- Les conteneurs et les images n'existent plus ----- "
sleep 4s
echo " ----- Importer une nouvelle image pour utiliser Docker ----- "
sleep 4s
echo "  "
echo " ----- Conseil ----- "
sleep 4s
echo " ----- Pour importer une nouvelle image Docker ----- "
sleep 4s
echo " ----- Lancer la commande suivante dans le terminal ----- "
sleep 4s
echo "  "
echo " sh 2-importer-image-debian.sh "
sleep 4s
echo "  "
echo " ----- Vous ne voulez pas importer une nouvelle image Docker Debian ? ----- "
sleep 4s
echo " ----- Vous avez terminé et pouvez quitter le terminal ! ----- "
sleep 4s
