#!/bin/bash
# Script pour installer le serveur web local depuis le shell du conteneur de l'image Docker de Debian.

# Mise à jour des dépôts de debian.
read -p "Appuyer sur une touche pour mettre à jour des dépôts de debian."
apt update

# Installer les paquets nécessaires pour le serveur web local.
read -p "Appuyer sur une touche pour installer les paquets nécessaires pour le serveur web local."
apt install nano wget unzip apache2 php7.0 php7.0-curl mariadb-server mariadb-client

# Démarrer MariaDB.
read -p "Appuyer sur une touche pour démarrer MariaDB."
/etc/init.d/mysql start

# Installer PHPMyAdmin.
read -p "Appuyer sur une touche pour installer PHPMyAdmin."
apt install phpmyadmin
# yes pour configurer phpmyadmin
# Choisir un mot de passe : GestionnaireBDD

# Démarrer Apache2.
read -p "Appuyer sur une touche pour démarrer Apache2."
service apache2 start

# Se placer dans le dossier par défaut du serveur web local.
read -p "Appuyer sur une touche pour se placer dans le dossier par défaut du serveur web local."
cd /var/www/html
# Créer un dossier hello.
read -p "Appuyer sur une touche pour créer un dossier hello."
mkdir hello
# Se placer dans le dossier hello.
read -p "Appuyer sur une touche pour aller dans le dossier hello."
cd /var/www/html/hello

# Créer le fichier hello.php pour vérifier le fonctionnement de PHP.
read -p "Appuyer sur une touche pour créer le fichier hello.php pour vérifier le fonctionnement de PHP."
echo "<?php" >> hello.php
echo "echo 'SEO';" >> hello.php
echo "?>" >> hello.phpn

# Créer le fichier phpinfo.php pour obtenir les informations du serveur.
read -p "Appuyer sur une touche pour créer le fichier phpinfo.php pour obtenir les informations du serveur."
echo "<?php" >> phpinfo.php
echo "phpinfo();" >> phpinfo.php
echo "?>" >> phpinfo.php

# Créer le fichier curl.php pour vérifier si cURL est activé.
read -p "Appuyer sur une touche pour créer le fichier curl.php pour vérifier si cURL est activé."
echo "<?php" >> curl.php
echo "echo 'Curl : ', function_exists('curl_version') ? 'Enabled' : 'Disabled';" >> curl.php
echo "?>" >> curl.php

# Vérifier si Apache2 est démarré et affiche sa page d'accueil depuis le navigateur
# http://localhost/

# Aller dans l'interface de PHPMyAdmin
# http://localhost/phpmyadmin
# Impossible de se connecter en root avec le mot de passe créé précédemment.
# root / GestionnaireBDD
# 1698 - Access denied for user 'root'@'localhost'
# mysqli_real_connect(): (HY000/1698): Access denied for user 'root'@'localhost'
# Etablir alors une connexion avec MariaDB.
read -p "Appuyer sur une touche pour se connecter en root à MariaDB."
mysql -u root -p
# Saisir le mot de passe de l'utilisateur root : GestionnaireBDD
# Une fois connecté à l'interface MariaDB, lancer les 3 commandes suivantes :
CREATE USER ‘znation’@’localhost’ IDENTIFIED BY ‘KillTheZombie’;
GRANT ALL PRIVILEGES ON *.* TO ‘znation’@’localhost’ WITH GRANT OPTION;
FLUSH PRIVILEGES;
# Retourner sous http://localhost/phpmyadmin
# Se connecter avec l'utilisateur znation / GestionnaireBDD
# Créer manuellement la base de données : joomlazombies

# Se placer à la racine du dossier html qui contient les fichiers par défaut du serveur web local.
read -p "Appuyer sur une touche pour se placer à la racine du dossier html et charger Joomla!"
cd /var/www/html/
# Rapatrier Joomla! 3.8.4.1 qui est la dernière version stable lors de la rédaction de ce tutoriel.
wget https://github.com/AFUJ/joomla-cms-fr/releases/download/3.8.4.1/Joomla_3.8.4-FR-Stable-Full_Package.zip
# Dézipper au même niveau que l'archive .zip
read -p "Appuyer sur une touche pour dézipper Joomla!"
unzip Joomla_3.8.4-FR-Stable-Full_Package.zip

echo "Installation terminée !"
echo "Le serveur web local est fonctionnel !"
echo "Les paquets suivants ont été installés : nano wget unzip apache2 php7.0 php7.0-curl mariadb-server mariadb-client !"
echo "Le CMS Joomla a également été préinstallé ! ( Installation a finalisée. )"
