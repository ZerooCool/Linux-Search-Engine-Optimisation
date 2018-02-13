# README
## Les scripts sont tous installés sur Debian Stretch 9.

00-ascii.sh - Affiche une image ascii.
00-menu.sh - Lance le menu d'installation.

1-installer-docker.sh - Installer Docker.
1-supprimer-conteneurs-et-images.sh - Supprimer les conteneurs et images de Docker.
1-supprimer-docker.sh - Supprimer le paquet Docker sur le système hôte.

2 - Importer l'image Docker de Debian.

3 - Installer le serveur local dans le conteneur Docker de Debian.

4 - Installer le dossier hello et les scripts pour tester le serveur.
4 - Télécharger l'archive de Joomla et installer Joomla!

#################################################

# README
## Liste à faire.

# Chaque script terminé doit revenir sur le menu qui propose le choix de sortir avec exit.

# Ajouter les logs à l'étape 2 du menu... et sur les autres scripts...

# Faciliter la lecture de l'installation avec sleep x et reset

# Ajouter des couleurs.


# Mettre en place le retour erreur après chaque action.
# Exemple pour l'utilisation du paquet apt clean :
# apt clean
# if [ "$?" = "0" ] ; then
# echo "Les paquets présents dans /var/cache/apt/archives ont été supprimés."
# else
# echo "Les paquets présents dans /var/cache/apt/archives n'ont pas été supprimés."
# fi


# Faire un test conditionnel.
# MAX=2
# for X in $(seq 1 $MAX) ; do
# commande
# done
