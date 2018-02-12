#!/bin/bash
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/00-ascii.sh
clear # Clear the screen.
cat 00-ascii.sh
sleep 4
rm 00-ascii.sh

echo " ################################## "
echo " #          Choix du menu         # "
echo " #    Installation automatique    # " 
echo " ################################## "
sleep 4
echo
echo " Cet assistant installe, configure ou supprime vos paquets automatiquement. "
sleep 4
echo
echo " [1] Installer Docker "
echo " [2] Supprimer les conteneurs et les images de Docker "
echo " [3] Supprimer Docker "
echo " [4] Importer l'image Docker de Debian "
echo " [5] Exit "
echo
echo "Choisir une option pour continuer :"

read person
case "$person" in

# "1" | "un" | "UN" | "Un" valeurs acceptées pour lancer ce menu.
  "1" | "un" | "UN" | "Un" )
  echo
  echo " Installer Docker "
  sleep 4

cd /home/
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/1-installer-docker.sh
sh 1-installer-docker.sh
cd /home/
rm 1-installer-docker.sh
sleep 4
  ;;
# Double points virgule pour fermer l'option 1.

# "2" | "deux" | "DEUX" | "Deux" valeurs acceptées pour lancer ce menu.
  "2" | "deux" | "DEUX" | "Deux" )
  echo
  echo " Supprimer les conteneurs et les images de Docker "
  sleep 4

cd /home/
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/1-supprimer-conteneurs-et-images.sh
sh 1-supprimer-conteneurs-et-images.sh
cd /home/
rm 1-supprimer-conteneurs-et-images.sh
sleep 4
  ;;
# Double points virgule pour fermer l'option 2.

# "3" | "trois" | "TROIS" | "Trois" valeurs acceptées pour lancer ce menu.
  "3" | "trois" | "TROIS" | "Trois" )
  echo
  echo " Supprimer Docker "
  sleep 4

cd /home/
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/1-supprimer-docker.sh
sh 1-supprimer-docker.sh
cd /home/
rm 1-supprimer-docker.sh
sleep 4
  ;;
# Double points virgule pour fermer l'option 3.

# "4" | "quatre" | "QUATRE" | "Quatre" valeurs acceptées pour lancer ce menu.
  "4" | "quatre" | "QUATRE" | "Quatre" )
  echo
  echo " Importer l'image Docker de Debian "
  sleep 4

cd /home/
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/2-importer-image-debian.sh
sh 2-importer-image-debian.sh
cd /home/
rm 2-importer-image-debian.sh
sleep 4
  ;;
# Double points virgule pour fermer l'option 4.

# "5" | "cinq" | "CINQ" | "Cinq" valeurs acceptées pour lancer ce menu.
  "5" | "cinq" | "CINQ" | "Cinq" )
  echo
  echo " EXIT "
  echo " L'assistant pour une installation automatique va s'arrêter. "
  echo " Utiliser la commande sh 00-menu.sh pour relancer l'assistant. "
  sleep 4
  exit
  ;;
# Double points virgule pour fermer l'option 5.

          * )
  # Réponse par défaut.
  echo "Ce choix n'est pas disponible."
  sleep 2
  echo
  echo "Merci d'utiliser uniquement les options du menu."
  sleep 3
  sh 00-menu.sh
  ;;

esac
exit 0