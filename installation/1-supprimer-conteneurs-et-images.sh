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
echo
echo " ----- Conseil ----- "
echo " ----- Importer une nouvelle image pour utiliser Docker ----- "
sleep 4s
echo
echo " ----- Vous êtes redirigé vers le menu ----- "
sleep 4s

# Message temporaire pouvant être retiré une fois l'ensemble des scripts stables.
echo
echo "Le processus de suppression des conteneurs et images est terminé"
echo "En cas d'erreur durant l'installation, merci d'ouvrir une issue depuis GitHub."
echo "https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/issues"
sleep 4

sh 2-importer-image-debian.sh
