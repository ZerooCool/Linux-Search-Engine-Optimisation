#!/bin/bash

echo " Installer Mediawiki "

# Créer une base de données Mediawiki avec PhpMyAdmin
echo " Aller sur la page locale http://localhost/phpmyadmin "
echo " Se connecter à PHPMyAdmin avec znation / KillTheZombie "
echo " Créer une nouvelle base mediawiki "


# Créer le dossier qui va accueillir le wiki.
cd /var/www/html
sudo mkdir wiki


# Se placer à la racine du dossier wiki qui contient les fichiers par défaut du serveur web local.
echo "Se placer à la racine du dossier /var/www/html/wiki et charger Mediawiki."
cd /var/www/html/wiki

echo " Rapatrier la dernière version de Mediawiki "
# Rapatrier la version de Mediawiki qui est la dernière version stable lors de la rédaction de ce tutoriel.
sudo wget https://releases.wikimedia.org/mediawiki/1.31/mediawiki-1.31.0.tar.gz
echo " "

# Dézipper au même niveau que l'archive .zip
echo "Décompresser Mediawiki dans le répertoire courant /var/www/html/wiki"
sudo tar xzvf mediawiki-1.31.0.tar.gz
sudo rm mediawiki-1.31.0.tar.gz

# Déplacer le contenu du dossier mediawiki-1.31.0 vers le dossier wiki
cd mediawiki-1.31.0
sudo cp -R * /var/www/html/wiki/
sudo rm -R mediawiki-1.31.0/

echo " "

echo " Changer le groupe et utilisateur pour celui de Apache. "
echo " Apache doit être propriétaire du site. "
echo " Depuis le répertoire /var/www/html/wiki "
cd /var/www/html/wiki
echo " Appliquer le changement de groupe et utilisateur "
echo " chown www-data:www-data * -R  "
sudo chown -R www-data:www-data /var/www/html/wiki
sudo chmod -R 755 /var/www/html/wiki
echo " Effectué. "

echo "  "

echo " Ouvrir le navigateur avec l'adresse localhost/wiki "
echo " Finaliser l'installation de Mediawiki "

echo " Suivre les étapes de l'installation de Mediawiki "
echo "  "

echo " Créer un utilisateur et son mot de passe pour Mediawiki. "
echo " Renseigner un mail valide pour le rappel de mot de passe. "

echo " A la fin de l'installation, télécharger le fichier LocalSettings.php"
echo " Créer le fichier LocalSettings.php dans le dossier /var/www/html/wiki"
cd /var/www/html/wiki
sudo touch LocalSettings.php
sudo chown -R www-data:www-data /var/www/html/wiki/LocalSettings.php
sudo chmod -R 755 /var/www/html/wiki/LocalSettings.php
sudo nano LocalSettings.php

echo " Copier le contenu du fichier qui a été téléchargé. "
echo " Coller le contenu dans LocalSettings.php "


echo "Identifier le conteneur à sauvegarder avec docker ps -a"
echo "docker export 5cd7e1ffb9f6 > mediawiki.tgz"
echo "docker import - mediawiki < mediawiki.tgz"

echo "Stopper le précédent conteneur"
echo "docker stop mediawiki"
echo "Relancer le conteneur sauvegardé"
echo "docker ps -a"
echo "docker run --name Mediawiki -p 80:80 -t -i mediawiki /bin/bash"
echo "service apache2 start"
echo "service mysql start"
