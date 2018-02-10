#!/bin/bash
echo "  "
echo " -- Démarrage de l'installation -- "
sleep 4s

echo "  "
echo " -- Importation de l'image Docker Debian -- "
echo "  "
docker pull debian
echo "  "
echo " -- Importation de l'image Docker Debian terminée -- "
sleep 4s

echo "  "
echo " -- Noter les commandes suivantes -- "
echo " -- Vous devez les lancer vous même pour installer le serveur local -- "
sleep 4s
echo "  "
echo " -- Vous êtes dans le shell du conteneur Docker Debian -- "
echo " -- Le port 80 est mis en écoute du réseau -- "
echo " -- Effectuer les étapes de 1 à 5 -- "
sleep 4s

echo "  "
echo " 1) Mettre à jour les dépôts : apt update"
sleep 2s
echo " 2) Installer wget : apt install wget -y"
sleep 2s
echo " 3) Aller dans le dossier : cd /home "
sleep 2s
echo " 4) wget https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/raw/master/installation/3-installer-le-serveur-dans-le-conteneur.sh"
sleep 2s
echo " 5) Lancer le script : sh /home/3-installer-le-serveur-dans-le-conteneur.sh"
sleep 2s
echo "  "

docker run --name Debian -p 80:80 -t -i debian /bin/bash
