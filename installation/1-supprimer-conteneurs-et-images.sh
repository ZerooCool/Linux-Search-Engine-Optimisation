#!/bin/bash
echo "  "
echo " ${vertfonce}Arrêt des conteneurs${neutre} "
docker stop $(docker ps -a -q)
echo "  "
sleep 4s

echo "  "
echo " ${vertfonce}Suppression des conteneurs${neutre} "
docker rm $(docker ps -a -q)
echo "  "
sleep 4s

echo "  "
echo " ${vertfonce}Suppression des images${neutre} "
docker rmi $(docker images -q)
echo "  "
sleep 4s

clear
echo " Les conteneurs et les images n'existent plus "
sleep 4s
echo
echo " Conseil "
echo " Importer une nouvelle image pour utiliser Docker "
echo " Supprimer Docker si le programme n'est plus utilisé "
sleep 4s
echo
echo " Vous êtes redirigé vers le menu "
sleep 4s

# Message temporaire pouvant être retiré une fois l'ensemble des scripts stables.
echo
echo "Le processus de suppression des conteneurs et images est terminé"
echo "${rougefonce}En cas d'erreur durant l'installation, merci d'ouvrir une issue depuis GitHub${neutre}"
echo "https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/issues"
echo
sleep 4

# Charger l'image sur Docker.
# Ne pas écraser l'image de développement.
# Définir un dossier de travail.

sh 00-menu.sh
