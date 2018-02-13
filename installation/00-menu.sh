#!/bin/bash

# Clear the screen.
clear

# Créer le dossier installeur si il n'existe pas.
# ~/installeur est toujours inexistant du fait d'un chemin relatif donc toujours recréé. Utiliser -h ne change rien.
if [ -d "/home/seo/installeur" ]; then
 echo " Le dossier ~/installeur existe déjà "
 sleep 3
else
 echo " Le dossier ~/installeur va être créé "
 sleep 3
 mkdir ~/installeur
fi

# Clear the screen.
clear

# Charger le fichier ~/installeur/00-menu.sh si il n'existe pas.
cd ~/installeur
if [ -f "00-menu.sh" ]; then
 echo " Le fichier 00-menu.sh existe déjà. "
 sleep 3
 # On lance le nouveau script de menu une fois et on arrête à la fin du script.
 # Permet d'éviter de continuer sur le script menu utilisé, qui peut être obsolète.
 sh ~/installeur/00-menu.sh
exit

else
 echo " Le fichier 00-menu.sh n'existe pas et va être créé dans le dossier installeur "
 sleep 3
 # Mise à jour de la dernière version de 00-menu.sh à charger depuis Github.
 wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/00-menu.sh
 # Lancer le menu à jour qui vient d'être chargé.
 sh ~/installeur/00-menu.sh
 # On crée le nouveau script et on lance le nouveau script de menu une fois et on arrête à la fin du script.
 # Permet d'éviter de continuer sur le script menu utilisé, qui peut être obsolète.
 exit
fi


# PROBLEME Lorsque le dernier menu à jour est chargé, puis, arrêté, l'ancien se relance, le dossier ~/installeur n'existe plus, donc, le fichier ascii n'est pas chargé.
# Faire un test conditionnel ??? Pour éviter la redondance !!!
# MAX=2
# for X in $(seq 1 $MAX) ; do
# commande
# done
# => exit a réglé le doublon.

# test -d => teste l'existence d'un dossier (un fichier de type "d" )
# test -f => teste l'existence d'un fichier (fichier de type "-" )
# test -L => teste l'existence d'un lien symbolique (fichier de type "l" )
# test -s => teste l'existence d'un socket (fichier de type "s" )
# test -b => teste l'existence d'un fichier I/O en mode bloc (fichier de type "b" )
# test -c => teste l'existence d'un fichier I/O en mode caractère (fichier de type "c" )
# test -e => teste l'existence d'un fichier quel que soit son  
# type mais ne fonctionne qu'en bash. Pour faire pareil en "sh" (vieux Unix), il faut faire "ls -d <fichier> 1>/dev/null 2>&1"
# Petit danger => "test -d" sur un lien symbolique vers un dossier renvoie "vrai" (le test s'applique sur la cible du lien et non sur le lien lui-même).
# Si on veut tester que le fichier est un vrai répertoire, il faut faire un test de ce type # test -d dossier -a ! -L dossier


# Charger l'image ascii depuis Github.
cd ~/installeur
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/00-ascii.sh

# Clear the screen.
clear

# Afficher l'image ascii.
cat ~/installeur/00-ascii.sh

# Supprimer le fichier de l'image ascii.
rm ~/installeur/00-ascii.sh
sleep 4

#
# TODO
# Installer sudo sur l'hôte !
# Donner les droits sudoers à l'utilisateur seo (mdp : UtilisateurSEO)
#

gris='\e[1;30m' rougefonce='\e[0;31m' vertfonce='\e[0;32m' vertclair='\e[1;32m' jaune='\e[1;33m' bleufonce='\e[0;34m' bleuclair='\e[1;34m' grisclair='\e[0;37m' blanc='\e[1;37m' neutre='\e[0;m'

echo " ################################## "
echo " #              ${bleuclair}Menu${neutre}              # "
echo " #    ${bleuclair}Installation automatique${neutre}    # " 
echo " ################################## "
sleep 4
echo
echo " L'assistant vous accompagne dans vos différents choix : "
echo " ${vertfonce}Installations${neutre}, ${vertfonce}configurations${neutre}, ${vertclair}tests${neutre} ou ${gris}suppressions${neutre}. "
sleep 4
echo
echo " ${vertfonce}[1] Installer Docker${neutre} "
echo " ${gris}[2] Supprimer les conteneurs et les images de Docker${neutre} "
echo " ${gris}[3] Supprimer Docker${neutre} "
echo " ${vertfonce}[4] Importer l'image Docker de Debian${neutre} "
echo " ${vertfonce}[5] Entrer dans le shell de l'image et installer le serveur web local${neutre} "
echo " ${vertclair}[6] Tester le serveur web local${neutre} "
echo " ${vertclair}[7] Importer et installer Joomla!${neutre} "
echo " [8] Exit "
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
# S'identifier en root pour arrêter les conteneurs, les supprimer, supprimer les images.
  echo
  echo " Saisir le mot de passe root : OptimisationSEO "
  sleep 1
su -c '

  echo
  echo " Lancement de la suppression des conteneurs et images de Docker "
  echo
  sleep 4

cd /home/
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/1-supprimer-conteneurs-et-images.sh
sh 1-supprimer-conteneurs-et-images.sh
cd /home/
rm 1-supprimer-conteneurs-et-images.sh
sleep 4

'
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
  echo " Installer le serveur web local dans l'image debian de Docker "
  sleep 4

cd /home/
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/3-installer-le-serveur-dans-le-conteneur.sh
sh 3-installer-le-serveur-dans-le-conteneur.sh
cd /home/
rm 3-installer-le-serveur-dans-le-conteneur.sh
  sleep 4
  ;;
# Double points virgule pour fermer l'option 5.

# "6" | "six" | "SIX" | "Six" valeurs acceptées pour lancer ce menu.
  "6" | "six" | "SIX" | "Six" )
  echo
  echo " Importer les scripts pour tester le serveur "
  sleep 4

cd /home/
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/4-hello.sh
sh 4-hello.sh
cd /home/
rm 4-hello.sh
  sleep 4
  ;;
# Double points virgule pour fermer l'option 6.

# "7" | "sept" | "SEPT" | "Sept" valeurs acceptées pour lancer ce menu.
  "7" | "sept" | "SEPT" | "Sept" )
  echo
  echo " Importer et installer Joomla! "
  sleep 4

cd /home/
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/4-installer-joomla.sh
sh 4-installer-joomla.sh
cd /home/
rm 4-installer-joomla.sh
  sleep 4
  ;;
# Double points virgule pour fermer l'option 7.

# "8" | "huit" | "HUIT" | "Huit" | "exit" | "EXIT" | "Exit" valeurs acceptées pour lancer ce menu.
  "8" | "huit" | "HUIT" | "Huit" | "exit" | "EXIT" | "Exit" )
  echo
  echo "${rougefonce}L'assistant va s'arrêter${neutre}"
  echo "Utiliser la commande ${vertfonce}sh 00-menu.sh${neutre} pour relancer l'assistant."
  sleep 4

# Message temporaire pouvant être retiré une fois l'ensemble des scripts stables.
  echo
  echo "${rougefonce}En cas d'erreur durant l'installation, merci d'ouvrir une issue depuis GitHub${neutre}"
  echo "https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/issues"
  echo
  sleep 4

# Supprimer le dossier installeur à la fin de l'installation.
cd ~/
rm -R installeur
echo " Le dossier installeur a été supprimé "
sleep 4

  exit;
  ;;
# Double points virgule pour fermer l'option 8.

          * )
  # Réponse par défaut.
  echo "${rougefonce}Ce choix n'est pas disponible${neutre}"
  sleep 2
#  echo
  echo "${rougefonce}Merci d'utiliser uniquement les options du menu${neutre}"
  sleep 3
  sh ~/installeur/00-menu.sh
  ;;

esac
exit 0

# TODO
# Faire revenir chaque action de script sur ce menu.

# TODO
# Retour erreur après chaque action. Exemple :
# apt clean
# if [ "$?" = "0" ] ; then
# echo "Les paquets présents dans /var/cache/apt/archives ont été supprimés."
# else
# echo "Les paquets présents dans /var/cache/apt/archives n'ont pas été supprimés."
# fi

# TODO
# sleep 4
# Faciliter la lecture de l'installation.

# clear
# Faciliter la lecture de l'écran.

# Ajouter des couleurs.
