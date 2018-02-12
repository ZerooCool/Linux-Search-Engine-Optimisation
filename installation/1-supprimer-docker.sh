#!/bin/bash

apt autoremove docker docker-engine docker-compose
if [ "$?" = "0" ] ; then
echo "Docker a été supprimé."
else
echo "Docker n'a pas été supprimé."
fi

apt autoremove dirmngr
if [ "$?" = "0" ] ; then
echo "Le paquet dirmngr pour retirer gérer les clés est supprimé."
else
echo "Le paquet dirmngr pour retirer gérer les clés n'a pas été supprimé."
fi

apt autoremove
if [ "$?" = "0" ] ; then
echo "Les paquets qui ne sont plus nécessaires ont également été supprimés."
else
echo "Les paquets qui ne sont plus nécessaires n'ont pas été supprimé."
fi

apt clean
if [ "$?" = "0" ] ; then
echo "Les paquets présents dans /var/cache/apt/archives ont été supprimés."
else
echo "Les paquets présents dans /var/cache/apt/archives n'ont pas été supprimés."
fi

apt purge '~c'
if [ "$?" = "0" ] ; then
echo "Les fichiers de configuration des paquets désinstallés non purgés ont été supprimés."
else
echo "Les fichiers de configuration des paquets désinstallés non purgés n'ont pas été supprimés."
fi

rm /etc/apt/sources.list.d/docker.list
if [ "$?" = "0" ] ; then
echo "Le dépôt ajouté pour Docker a été supprimé."
else
echo "Le dépôt ajouté pour Docker n'a pas été supprimé."
fi

# Faire revenir sur le menu.
# Retour erreur après chaque action.
# Sleep.
