#!/bin/bash
# Ce script doit être lancer à partir du fichier 00-menu.sh
# Passage en sudoers avec l'utilisateur seo pour les tâches administratives

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
########### Support sur Github.
echo
echo "${rougefonce}En cas d'erreur durant l'installation, merci d'ouvrir une issue depuis Github${neutre}"
echo "https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/issues"
echo
sleep 4
###########
###########

Dossier_Installeur_Utilisateur=$(readlink -f ~/installeur)
echo $Dossier_Installeur_Utilisateur
# Affiche : /home/seo/installeur
sleep 4


# Support sur Github.
echo
echo "${rougefonce}En cas d'erreur durant l'installation, merci d'ouvrir une issue depuis Github${neutre}"
echo "https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/issues"
echo
sleep 4

###########
########### Vérifier si le dossier d'installation existe, sinon, le créer.
ABS_PATH_INSTALLEUR=$(readlink -e $Dossier_Installeur_Utilisateur)
if [ -d "$ABS_PATH_INSTALLEUR" ]; then
 echo " Initialisation - Le dossier d'installation existe "
 sleep 3
# Logs.txt
echo "$jour - $heure : Initialisation - Le dossier d'installation existe." >> logs.txt
else
 echo " Le dossier d'installation n'existe pas. Lancer le menu 00-menu.sh pour initialiser le programme "
 sleep 3
# Logs.txt
echo "$jour - $heure : Le dossier d'installation n'existe pas. Lancer le menu 00-menu.sh pour initialiser le programme." >> logs.txt
fi
###########
###########

echo "S'identifier maintenant en sudoers pour continuer la suppression de Docker"
echo "Utiliser le mot de passe de l'utilisateur sudoers seo : UtilisateurSEO"
sleep 1

sudo apt purge docker-engine docker-compose
if [ "$?" = "0" ] ; then
echo "Les paquets de Docker ne sont plus installés"
# Logs.txt
echo "$jour - $heure : Les paquets de Docker ne sont plus installés." >> logs.txt
else
echo "Les paquets de Docker n'ont pas été supprimés"
# Logs.txt
echo "$jour - $heure : Les paquets de Docker n'ont pas été supprimés." >> logs.txt
fi
sleep 4


sudo apt autoremove
if [ "$?" = "0" ] ; then
echo "Les paquets qui ne sont plus nécessaires ont été supprimés"
# Logs.txt
echo "$jour - $heure : Les paquets qui ne sont plus nécessaires ont été supprimés." >> logs.txt
else
echo "Les paquets qui ne sont plus nécessaires n'ont pas été supprimé"
# Logs.txt
echo "$jour - $heure : Les paquets qui ne sont plus nécessaires n'ont pas été supprimés." >> logs.txt
fi
sleep 4


# Vérifier si le dossier /var/lib/docker existe, si oui, le supprimer.
VAR_LIB_DOCKER=$(readlink -e /var/lib/docker)
if [ -d "$VAR_LIB_DOCKER" ]; then
 echo " Le dossier /var/lib/docker existe. Il va être supprimé. "
 sleep 3
sudo rm -rf /var/lib/docker
if [ "$?" = "0" ] ; then
echo "Le dossier /var/lib/docker a été supprimé"
# Logs.txt
echo "$jour - $heure : Le dossier /var/lib/docker a été supprimé." >> logs.txt
else
echo "Le dossier /var/lib/docker n'a pas été supprimé correctement"
# Logs.txt
echo "$jour - $heure : Le dossier /var/lib/docker n'a pas été supprimé correctement." >> logs.txt
fi
sleep 4

else
 echo " Le dossier /var/lib/docker n'existe pas. Il a déjà été supprimé. "
 sleep 3
fi


# Supprimer la source du dépôt Docker
if [ -f "menu.sh" ]; then
echo " Le fichier du menu existe "
sleep 3

sudo rm /etc/apt/sources.list.d/docker.list
if [ "$?" = "0" ] ; then
echo "Le dépôt ajouté pour Docker a été supprimé"
# Logs.txt
echo "$jour - $heure : Le dépôt ajouté pour Docker a été supprimé." >> logs.txt
else
echo "Le dépôt ajouté pour Docker n'a pas été supprimé correctement"
# Logs.txt
echo "$jour - $heure : Le dépôt ajouté pour Docker n'a pas été supprimé correctement." >> logs.txt
fi
sleep 4

else
echo " Le dépôt ajouté pour Docker a déjà été supprimé "
# Logs.txt
echo "$jour - $heure : Le dépôt ajouté pour Docker a déjà été supprimé." >> logs.txt
sleep 3
fi


sudo apt-key del 2C52609D
if [ "$?" = "0" ] ; then
echo "La clé de dépôt ajoutée pour Docker, si elle existait, a été supprimée"
# Logs.txt
echo "$jour - $heure : La clé de dépôt ajoutée pour Docker, si elle existait, a été supprimée." >> logs.txt
else
echo "La clé de dépôt ajoutée pour Docker n'a pas été supprimée"
# Logs.txt
echo "$jour - $heure : La clé de dépôt ajoutée pour Docker n'a pas été supprimée." >> logs.txt
fi
sleep 4

sudo apt clean
if [ "$?" = "0" ] ; then
echo "Les paquets présents dans /var/cache/apt/archives ont été supprimés"
# Logs.txt
echo "$jour - $heure : Les paquets présents dans /var/cache/apt/archives ont été supprimés." >> logs.txt
else
echo "Les paquets présents dans /var/cache/apt/archives n'ont pas été supprimés"
# Logs.txt
echo "$jour - $heure : Les paquets présents dans /var/cache/apt/archives n'ont pas été supprimés." >> logs.txt
fi
sleep 4


echo
echo "Le processus de suppression de Docker est terminé"
# Logs.txt
echo "$jour - $heure : Le processus de suppression de Docker est terminé." >> logs.txt
sleep 2

echo "Fin du script et retour à la fin de l'exécution du menu."
sleep 4
# Revenir sur le menu.
# Logs.txt
# echo "$jour - $heure : Revenir sur le menu." >> logs.txt
# sh $Dossier_Installeur_Utilisateur/00-menu.sh
