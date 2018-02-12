#!/bin/bash

apt autoremove docker docker-engine docker-compose
if [ "$?" = "0" ] ; then
echo "Docker a été supprimé."
else
echo "Docker n'a pas été supprimé."
fi
sleep 4

apt autoremove dirmngr
if [ "$?" = "0" ] ; then
echo "Le paquet dirmngr pour gérer les clés est supprimé."
else
echo "Le paquet dirmngr pour gérer les clés n'a pas été supprimé."
fi
sleep 4

apt autoremove
if [ "$?" = "0" ] ; then
echo "Les paquets qui ne sont plus nécessaires ont également été supprimés."
else
echo "Les paquets qui ne sont plus nécessaires n'ont pas été supprimé."
fi
sleep 4

apt clean
if [ "$?" = "0" ] ; then
echo "Les paquets présents dans /var/cache/apt/archives ont été supprimés."
else
echo "Les paquets présents dans /var/cache/apt/archives n'ont pas été supprimés."
fi
sleep 4

apt purge '~c'
if [ "$?" = "0" ] ; then
echo "Les fichiers de configuration des paquets désinstallés non purgés ont été supprimés."
else
echo "Les fichiers de configuration des paquets désinstallés non purgés n'ont pas été supprimés."
fi
sleep 4

rm /etc/apt/sources.list.d/docker.list
if [ "$?" = "0" ] ; then
echo "Le dépôt ajouté pour Docker a été supprimé."
else
echo "Le dépôt ajouté pour Docker n'a pas été supprimé."
fi
sleep 4

echo
echo "Le processus de suppression de Docker est terminé"
echo "En cas d'erreur durant l'installation, merci d'ouvrir une issue depuis GitHub."
echo "https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/issues"
sleep 4

# Faire revenir sur le menu.
# placer le script ...
# charger le script ...
# lancer le script ...
