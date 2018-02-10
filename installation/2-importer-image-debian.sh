#!/bin/bash
echo "  "
echo "  "

echo " -- Démarrage de l'installation -- "

echo "  "

echo " -- Importation de l'image Docker Debian -- "
docker pull debian
echo " -- Importation de l'image Docker Debian terminée -- "

echo "  "
echo " -- Noter les commandes suivantes. Elles vont installer le serveur local. -- "
echo " -- Appuyer la touche <Entrée> pour continuer -- "
read touche
case $touche in
*)	echo " -- Installer le serveur web local dans le conteneur -- "
	;;
esac
echo "  "

echo " -- Vous êtes dans le shell du conteneur Docker Debian -- "
echo " -- Le port 80 est mis en écoute du réseau -- "
echo " -- Effectuer les étapes 1) 2) 3) 4) 5) -- "

echo "  "
echo "  "

echo " 1) Mettre à jour les dépôts : apt update"
echo " 2) Installer wget : apt install wget -y"
echo " 3) Aller dans le bon dossier : cd /home "
echo " 4) wget https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/raw/master/installation/3-installer-le-serveur-dans-le-conteneur.sh"
echo " 5) Lancer le script : sh /home/3-installer-le-serveur-dans-le-conteneur.sh"

docker run --name Debian -p 80:80 -t -i debian /bin/bash
