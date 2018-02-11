#!/bin/bash

apt autoremove docker
if [ "$?" = "0" ] ; then
echo "Docker a été supprimé."
else
echo "Docker n'a pas été supprimé."
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
