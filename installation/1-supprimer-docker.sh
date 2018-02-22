#!/bin/bash
# Ce script doit être lancer à partir du fichier 00-menu.sh
# Passage en sudoers avec l'utilisateur seo pour les tâches administratives

########### Variables # Exportées

###########
########### Support sur Github.
reset
echo
echo "${rougefonce}En cas d'erreur durant l'installation, merci d'ouvrir une issue depuis Github${neutre}"
echo "https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/issues"
echo
sleep 2
###########
###########

###########
########### Localiser le chemin d'installation de l'utilisateur courant.
Dossier_Installeur_Utilisateur=$(readlink -f ~/installeur)
echo " Dossier installeur utilisé : $Dossier_Installeur_Utilisateur"
# Affiche : /home/seo/installeur
sleep 2
###########
###########

###########
########### Vérifier si le dossier d'installation existe, sinon, le créer.
ABS_PATH_INSTALLEUR=$(readlink -e $Dossier_Installeur_Utilisateur)
if [ -d "$ABS_PATH_INSTALLEUR" ]; then
 echo " Initialisation - Le dossier d'installation existe "
 sleep 2
# Logs.txt
echo "$jour - $heure : Initialisation - Le dossier d'installation existe." >> logs.txt
else
 echo " Le dossier d'installation n'existe pas "
 echo " Lancer le menu 00-menu.sh pour initialiser le programme "
 sleep 4
# Logs.txt
echo "$jour - $heure : Le dossier d'installation n'existe pas. Lancer le menu 00-menu.sh pour initialiser le programme. EXIT. " >> logs.txt

# Mise à jour de la dernière version de 00-menu.sh à charger depuis Github.
 mkdir ~/installeur
 echo
 curl https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/00-menu.sh > ~/installeur/00-menu.sh
 # Logs.txt
 echo "$jour - $heure : Chargement - Le fichier du menu n'existe pas. Il va être téléchargé et exécuté." >> logs.txt
 # Lancer le menu à jour qui vient d'être chargé.
 sh ~/installeur/00-menu.sh

exit
fi
###########
###########

echo
echo " S'identifier maintenant en sudoers pour continuer la suppression de Docker"
echo " Utiliser le mot de passe de l'utilisateur sudoers seo : UtilisateurSEO"
sleep 2

sudo apt purge docker-engine docker-compose
if [ "$?" = "0" ] ; then
echo
echo " Les paquets de Docker ne sont plus installés"
# Logs.txt
echo "$jour - $heure : Les paquets de Docker ne sont plus installés." >> logs.txt
else
echo
echo " Les paquets de Docker n'ont pas été supprimés"
# Logs.txt
echo "$jour - $heure : Les paquets de Docker n'ont pas été supprimés." >> logs.txt
fi
sleep 2


sudo apt autoremove
if [ "$?" = "0" ] ; then
echo
echo "Les paquets qui ne sont plus nécessaires ont été supprimés"
# Logs.txt
echo "$jour - $heure : Les paquets qui ne sont plus nécessaires ont été supprimés." >> logs.txt
else
echo
echo "Les paquets qui ne sont plus nécessaires n'ont pas été supprimé"
# Logs.txt
echo "$jour - $heure : Les paquets qui ne sont plus nécessaires n'ont pas été supprimés." >> logs.txt
fi
sleep 2


# Vérifier si le dossier /var/lib/docker existe, si oui, le supprimer.
VAR_LIB_DOCKER=$(readlink -e /var/lib/docker)
if [ -d "$VAR_LIB_DOCKER" ]; then
echo
 echo " Le dossier /var/lib/docker existe. Il va être supprimé. "
 sleep 2
sudo rm -rf /var/lib/docker
if [ "$?" = "0" ] ; then
echo
echo "Le dossier /var/lib/docker a été supprimé"
# Logs.txt
echo "$jour - $heure : Le dossier /var/lib/docker a été supprimé." >> logs.txt
else
echo
echo "Le dossier /var/lib/docker n'a pas été supprimé correctement"
# Logs.txt
echo "$jour - $heure : Le dossier /var/lib/docker n'a pas été supprimé correctement." >> logs.txt
fi
sleep 2

else
echo
 echo " Le dossier /var/lib/docker n'existe pas. Il a déjà été supprimé. "
 sleep 2
fi


# Supprimer la source du dépôt Docker
if [ -f "/etc/apt/sources.list.d/docker.list" ]; then
echo
echo " Le fichier de dépôt de Docker existe "
sleep 2

sudo rm /etc/apt/sources.list.d/docker.list
if [ "$?" = "0" ] ; then
echo
echo "Le dépôt ajouté pour Docker a été supprimé"
# Logs.txt
echo "$jour - $heure : Le dépôt ajouté pour Docker a été supprimé." >> logs.txt
else
echo
echo "Le dépôt ajouté pour Docker n'a pas été supprimé correctement"
# Logs.txt
echo "$jour - $heure : Le dépôt ajouté pour Docker n'a pas été supprimé correctement." >> logs.txt
fi
sleep 2

else
echo
echo " Le dépôt ajouté pour Docker a déjà été supprimé "
# Logs.txt
echo "$jour - $heure : Le dépôt ajouté pour Docker a déjà été supprimé." >> logs.txt
sleep 2
fi


sudo apt-key del 2C52609D
if [ "$?" = "0" ] ; then
echo
# Un bogue semble toujours retourner OK ! A signaler à l'équipe Debian.
echo "La clé de dépôt ajoutée pour Docker, si elle existait, a été supprimée"
# Logs.txt
echo "$jour - $heure : La clé de dépôt ajoutée pour Docker, si elle existait, a été supprimée." >> logs.txt
else
echo
echo "La clé de dépôt ajoutée pour Docker n'a pas été supprimée"
# Logs.txt
echo "$jour - $heure : La clé de dépôt ajoutée pour Docker n'a pas été supprimée." >> logs.txt
fi
sleep 2

sudo apt clean
if [ "$?" = "0" ] ; then
echo
echo "Les paquets présents dans /var/cache/apt/archives ont été supprimés"
# Logs.txt
echo "$jour - $heure : Les paquets présents dans /var/cache/apt/archives ont été supprimés." >> logs.txt
else
echo
echo "Les paquets présents dans /var/cache/apt/archives n'ont pas été supprimés"
# Logs.txt
echo "$jour - $heure : Les paquets présents dans /var/cache/apt/archives n'ont pas été supprimés." >> logs.txt
fi
sleep 2


echo
echo
echo "Le processus de suppression de Docker est terminé"
# Logs.txt
echo "$jour - $heure : Le processus de suppression de Docker est terminé." >> logs.txt
sleep 2

# echo "Fin du script et retour à la fin de l'exécution du menu."
echo "$jour - $heure : Retour au menu." >> logs.txt
echo "Retour au menu"
sleep 2
