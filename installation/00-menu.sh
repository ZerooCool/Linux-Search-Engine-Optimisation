#!/bin/bash

###########
########### Effacer l'écran du terminal.
reset
###########
###########

###########
########### Variables
# Jour et heure.
jour=$(date +%d-%m-%Y)
heure=$(date +%H:%M:%S)
# Couleurs.
gris='\e[1;30m' rougefonce='\e[0;31m' vertfonce='\e[0;32m' vertclair='\e[1;32m' jaune='\e[1;33m' bleufonce='\e[0;34m' bleuclair='\e[1;34m' grisclair='\e[0;37m' blanc='\e[1;37m' neutre='\e[0;m'
###########
###########

###########
########### Vérifier si le dossier d'installation existe, sinon, le créer.
ABS_PATH_INSTALLEUR=$(readlink -e ~/installeur)
if [ -d "$ABS_PATH_INSTALLEUR" ]; then
 echo " Démarrage - Le dossier d'installation existe "
 sleep 3
# Logs.txt
cd ~/installeur
echo "$jour - $heure : Démarrage - Le dossier d'installation existe." >> logs.txt
else
 echo " Chargement - Le dossier d'installation n'existe pas et va être créé "
 sleep 3
 mkdir ~/installeur
# Logs.txt
cd ~/installeur
echo "$jour - $heure : Chargement - Le dossier d'installation n'existe pas et va être créé." >> logs.txt
fi
###########
###########

###########
########### Charger le fichier 00-menu.sh si il n'existe pas.
cd ~/installeur
if [ -f "00-menu.sh" ]; then
 echo " Démarrage - Le fichier du menu existe "
 sleep 3
# Logs.txt
cd ~/installeur
echo "$jour - $heure : Démarrage - Le fichier du menu existe." >> logs.txt

# Vérifier si le fichier 00-menu.sh est à jour.
# Variables dates pour connaître la durée d'existance du fichier 00-menu.sh
 Date_Modif_Fichier=`perl -e '($atime,$mtime,$ctime)=(stat($ARGV[0]))[8..10];print "$mtime\n";' ~/installeur/00-menu.sh `
 Date_Du_Jour=`date -u '+%s'`
 Duree_De_Vie=`expr $Date_Du_Jour - $Date_Modif_Fichier`
# echo " Date du jour - Date de modification du fichier : $Duree_De_Vie secondes. "
 Duree_De_Vie=`expr $Duree_De_Vie / 60`
 echo
 echo " Le fichier 00-menu.sh existe depuis $Duree_De_Vie minute(s) "
 # Logs.txt
 echo "$jour - $heure : Le fichier 00-menu.sh existe depuis $Duree_De_Vie minute(s)." >> logs.txt
 sleep 3
 
 # Le fichier doit avoir une existance de moins de 1 minute, sinon, il est remis à jour.
 if [ $Duree_De_Vie -gt 1 ]; then
 echo " Le fichier n'est pas considéré à jour avec $Duree_De_Vie minutes d'existance "
 # Logs.txt
 echo "$jour - $heure : Le fichier n'est pas considéré à jour avec $Duree_De_Vie minutes d'existance." >> logs.txt

 # Suppression du menu présent dans le dossier d'installation.
 rm 00-menu.sh
 echo " Suppression du fichier 00-menu.sh pour charger la version en ligne "
 # Logs.txt
 echo "$jour - $heure : Suppression du fichier 00-menu.sh pour charger la version en ligne." >> logs.txt
 sleep 3

 # Mise à jour de la dernière version de 00-menu.sh à charger depuis Github.
 curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/00-menu.sh
 echo " Le fichier 00-menu.sh est à jour "
 # Logs.txt
 echo "$jour - $heure : Le fichier 00-menu.sh a été chargé depuis Github." >> logs.txt
 sleep 3

 # Création de la variable $MenuValide pour lancer un test par la suite.
MenuValide=PasAJour

 else
 echo " Le fichier est à jour avec moins de $Duree_De_Vie minute d'existance "
 # Logs.txt
 echo "$jour - $heure : Le fichier est à jour avec moins de $Duree_De_Vie minute d'existance." >> logs.txt
 sleep 3

MenuValide=AJour
 fi


else
 echo " Chargement - Le fichier du menu n'existe pas et va être créé et exécuté "
 sleep 3
 # Mise à jour de la dernière version de 00-menu.sh à charger depuis Github.
 curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/00-menu.sh > ~/installeur/00-menu.sh
 # Logs.txt
 echo "$jour - $heure : Chargement - Le fichier du menu n'existe pas et va être créé et exécuté." >> logs.txt
 # Lancer le menu à jour qui vient d'être chargé.
 sh ~/installeur/00-menu.sh
 # Lorsque le dernier menu à jour est chargé, puis, arrêté depuis les choix disponibles, l'appel initial pouvant venir de ce fichier 00-menu.sh en local continue son exécution.
 # Le dossier ~/installeur n'existant plus, supprimé à la fin de l'exécution du nouveau script de 00-menu.sh téléchargé et à jour, le fichier ascii ne peut se charger.
 # Pour empêcher la reprise de la fin du menu ci-dessous, arrêter ici la lecture du script avec exit.
 exit
fi
###########
###########

###########
########### Recharger vers la version téléchargée.
echo
echo "  Démarrage - Le fichier du menu existe et est à jour "
sleep 3
 # L'étape MenuValide PasAJour a été effectuée, le fichier 00-menu.sh a été téléchargé.
 # Relancer le script 00-menu.sh
 if [ $MenuValide = PasAJour ]; then
echo
echo " Redémarrage de la dernière version du fichier 00-menu.sh "
sleep 3
sh ~/installeur/00-menu.sh
exit
 # L'étape MenuValide AJour a été effectuée, le fichier 00-menu.sh continue de charger.
 # Le script ne se relance pas.
else
echo
echo " _________________________________________________________ "
sleep 3
# sh ~/installeur/00-menu.sh
# exit
fi
###########
###########

###########
########### Charger l'image ascii depuis Github.
cd ~/installeur
if [ -f "00-ascii.sh" ]; then
rm 00-ascii.sh
curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/00-ascii.sh > ~/installeur/00-ascii.sh
else
curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/00-ascii.sh > ~/installeur/00-ascii.sh
fi

reset
# Afficher l'image ascii.
cat ~/installeur/00-ascii.sh
sleep 4
# Supprimer le fichier de l'image ascii.
rm ~/installeur/00-ascii.sh
# Logs.txt
cd ~/installeur
echo "$jour - $heure : Chargement de l'image ascii." >> logs.txt
echo "$jour - $heure : Effacer l'écran du terminal." >> logs.txt
echo "$jour - $heure : Afficher l'image ascii." >> logs.txt
echo "$jour - $heure : Supprimer le fichier de l'image ascii." >> logs.txt
###########
###########

###########
########### Affichage du menu
echo " ################################## "
echo " #              ${bleuclair}Menu${neutre}              # "
echo " #    ${bleuclair}Installation automatique${neutre}    # " 
echo " ################################## "
sleep 4
reset
echo " ################################## "
echo " #              ${bleuclair}Menu${neutre}              # "
echo " #    ${bleuclair}Installation automatique${neutre}    # " 
echo " ################################## "
echo
echo " L'assistant vous accompagne dans vos différents choix "
echo " ${vertfonce}Installer${neutre} - ${vertfonce}Configurer${neutre} - ${vertclair}Tester${neutre} - ${gris}Supprimmer${neutre} "
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
echo " [Logs] Consulter les logs de l'installation "
echo
echo "Choisir une option pour continuer :"

# Logs.txt
echo "$jour - $heure : Le menu est affiché en attente du choix." >> logs.txt
###########
###########

read person
case "$person" in

###########
########### "1" | "un" | "UN" | "Un" valeurs acceptées pour lancer ce menu.
  "1" | "un" | "UN" | "Un" )
  echo
  echo " Installer Docker "
  sleep 4

cd ~/installeur
curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/1-installer-docker.sh > ~/installeur/1-installer-docker.sh

# Logs.txt
cd ~/installeur
echo "$jour - $heure : Chargement du script d'installation pour Docker." >> logs.txt

sh 1-installer-docker.sh

# Logs.txt
cd ~/installeur
echo "$jour - $heure : Lancement du script d'installation pour Docker." >> logs.txt

cd ~/installeur
rm 1-installer-docker.sh

# Logs.txt
cd ~/installeur
echo "$jour - $heure : Suppression du script d'installation pour Docker." >> logs.txt

sleep 4
  ;;
########### Double points virgule pour fermer l'option 1.
###########

###########
########### "2" | "deux" | "DEUX" | "Deux" valeurs acceptées pour lancer ce menu.
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
curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/1-supprimer-conteneurs-et-images.sh > ~/installeur/1-supprimer-conteneurs-et-images.sh
sh 1-supprimer-conteneurs-et-images.sh
cd /home/
rm 1-supprimer-conteneurs-et-images.sh
sleep 4
'
  ;;
########### Double points virgule pour fermer l'option 2.
###########

###########
########### "3" | "trois" | "TROIS" | "Trois" valeurs acceptées pour lancer ce menu.
  "3" | "trois" | "TROIS" | "Trois" )
  echo
  echo " Supprimer Docker "
  sleep 4

cd /home/
curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/1-supprimer-docker.sh > ~/installeur/1-supprimer-docker.sh
sh 1-supprimer-docker.sh
cd /home/
rm 1-supprimer-docker.sh
sleep 4
  ;;
########### Double points virgule pour fermer l'option 3.
###########

###########
########### "4" | "quatre" | "QUATRE" | "Quatre" valeurs acceptées pour lancer ce menu.
  "4" | "quatre" | "QUATRE" | "Quatre" )
  echo
  echo " Importer l'image Docker de Debian "
  sleep 4

cd /home/
curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/2-importer-image-debian.sh > ~/installeur/2-importer-image-debian.sh
sh 2-importer-image-debian.sh
cd /home/
rm 2-importer-image-debian.sh
sleep 4
  ;;
########### Double points virgule pour fermer l'option 4.
###########

########### "5" | "cinq" | "CINQ" | "Cinq" valeurs acceptées pour lancer ce menu.
###########
  "5" | "cinq" | "CINQ" | "Cinq" )
  echo
  echo " Installer le serveur web local dans l'image debian de Docker "
  sleep 4

cd /home/
curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/3-installer-le-serveur-dans-le-conteneur.sh > ~/installeur/3-installer-le-serveur-dans-le-conteneur.sh
sh 3-installer-le-serveur-dans-le-conteneur.sh
cd /home/
rm 3-installer-le-serveur-dans-le-conteneur.sh
  sleep 4
  ;;
########### Double points virgule pour fermer l'option 5.
###########

###########
########### "6" | "six" | "SIX" | "Six" valeurs acceptées pour lancer ce menu.
  "6" | "six" | "SIX" | "Six" )
  echo
  echo " Importer les scripts pour tester le serveur "
  sleep 4

cd /home/
curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/4-hello.sh > ~/installeur/4-hello.sh
sh 4-hello.sh
cd /home/
rm 4-hello.sh
  sleep 4
  ;;
########### Double points virgule pour fermer l'option 6.
###########

###########
########### "7" | "sept" | "SEPT" | "Sept" valeurs acceptées pour lancer ce menu.
  "7" | "sept" | "SEPT" | "Sept" )
  echo
  echo " Importer et installer Joomla! "
  sleep 4

cd /home/
curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/4-installer-joomla.sh > ~/installeur/4-installer-joomla.sh
sh 4-installer-joomla.sh
cd /home/
rm 4-installer-joomla.sh
  sleep 4
  ;;
########### Double points virgule pour fermer l'option 7.
###########

###########
########### "8" | "huit" | "HUIT" | "Huit" | "exit" | "EXIT" | "Exit" valeurs acceptées pour lancer ce menu.
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

  exit;
  ;;
########### Double points virgule pour fermer l'option 8.
###########

###########
########### "ls" valeur acceptée pour voir ls.
  "logs" | "Logs" | "LOGS" | "log" | "Log" | "LOG" )
pwd
ls
cat logs.txt
sleep 5
~/installeur/00-menu.sh
  ;;
########### Double points virgule pour fermer l'option ls.
###########

          * )
  # Réponse par défaut.
  echo "${rougefonce}Ce choix n'est pas disponible${neutre}"
  sleep 2
#  echo
  echo "${rougefonce}Merci d'utiliser uniquement les options du menu${neutre}"
  sleep 3
  sh 00-menu.sh
  ;;

esac
exit 0
