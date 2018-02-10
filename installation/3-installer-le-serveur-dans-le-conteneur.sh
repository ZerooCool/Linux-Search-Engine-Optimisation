#!/bin/bash
# Script pour installer le serveur web local depuis le shell du conteneur de l'image Docker de Debian.

echo " "
echo " "

# Mise à jour des dépôts de debian.
echo "Mise à jour des dépôts de debian et mise à niveau des paquets."
apt update
apt upgrade

echo " "
echo " "

# Installer les paquets nécessaires pour le serveur web local.
echo "Installation des paquets nécessaires pour le serveur web local."
apt install nano wget unzip apache2 php7.0 php7.0-curl mariadb-server mariadb-client -y

echo " "
echo " "

# Démarrer MariaDB.
echo "Démarrage de MariaDB."
/etc/init.d/mysql start

echo " "
echo " "

# Installer PHPMyAdmin.
echo "Installation de PHPMyAdmin."
apt install phpmyadmin -y
# yes pour configurer phpmyadmin
# Choisir un mot de passe : GestionnaireBDD
# Choix 1 pour configurer Apache2

echo " "
echo " "

# Démarrer Apache2.
echo "Démarrage de Apache2."
service apache2 start

echo " "
echo " "

# Se placer dans le dossier par défaut du serveur web local.
echo "Se placer dans le dossier /var/www/html du serveur web local."
cd /var/www/html
# Créer un dossier hello.
echo "Création du dossier hello."
mkdir hello
# Se placer dans le dossier hello.
echo "Se placer dans le dossier /var/www/html/hello."
cd /var/www/html/hello

echo " "
echo " "

# Créer le fichier hello.php pour vérifier le fonctionnement de PHP.
echo "Créer le fichier hello.php pour vérifier le fonctionnement de PHP."
echo "<?php" >> hello.php
echo "echo 'SEO';" >> hello.php
echo "?>" >> hello.phpn

# Créer le fichier phpinfo.php pour obtenir les informations du serveur.
echo "Créer le fichier phpinfo.php pour obtenir les informations du serveur."
echo "<?php" >> phpinfo.php
echo "phpinfo();" >> phpinfo.php
echo "?>" >> phpinfo.php

# Créer le fichier curl.php pour vérifier si cURL est activé.
echo "Créer le fichier curl.php pour vérifier si cURL est activé."
echo "<?php" >> curl.php
echo "echo 'Curl : ', function_exists('curl_version') ? 'Enabled' : 'Disabled';" >> curl.php
echo "?>" >> curl.php

echo " "
echo " "

# Vérifier si Apache2 est démarré et affiche sa page d'accueil depuis le navigateur
# http://localhost/

# Aller dans l'interface de PHPMyAdmin
# http://localhost/phpmyadmin
# Impossible de se connecter en root avec le mot de passe créé précédemment.
# root / GestionnaireBDD
# 1698 - Access denied for user 'root'@'localhost'
# mysqli_real_connect(): (HY000/1698): Access denied for user 'root'@'localhost'
# Etablir alors une connexion avec MariaDB.
echo "Se connecter en root à MariaDB."
echo "Le mot de passe proposé à l'installation de PHPMyAdmin est GestionnaireBDD."
echo "Saisir les 3 lignes suivantes :"
echo "CREATE USER 'znation'@'localhost' IDENTIFIED BY 'KillTheZombie';"
echo "GRANT ALL PRIVILEGES ON *.* TO 'znation'@'localhost' WITH GRANT OPTION;"
echo "FLUSH PRIVILEGES;"
echo "exit;"
mysql -u root -p
# Saisir le mot de passe de l'utilisateur root : GestionnaireBDD
# Une fois connecté à l'interface MariaDB, lancer les 3 commandes suivantes :

## COMMENT FAIRE CETTE SAISIE AUTOMATIQUEMENT ?
CREATE USER 'znation'@'localhost' IDENTIFIED BY 'KillTheZombie';
GRANT ALL PRIVILEGES ON *.* TO 'znation'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
## Comment sortir du terminal de MariaDB ? -- exit! 

# Retourner sous http://localhost/phpmyadmin
# Se connecter avec l'utilisateur znation / GestionnaireBDD
# Créer manuellement la base de données : joomlazombies

echo " "
echo " "

# Se placer à la racine du dossier html qui contient les fichiers par défaut du serveur web local.
echo "Se placer à la racine du dossier /var/www/html/ et charger Joomla!"
cd /var/www/html/
# Rapatrier Joomla! 3.8.4.1 qui est la dernière version stable lors de la rédaction de ce tutoriel.
wget https://github.com/AFUJ/joomla-cms-fr/releases/download/3.8.4.1/Joomla_3.8.4-FR-Stable-Full_Package.zip

echo " "
echo " "

# Dézipper au même niveau que l'archive .zip
echo "Dézipper Joomla! dans le répertoire courant /var/www/html/"
unzip Joomla_3.8.4-FR-Stable-Full_Package.zip

echo " "
echo " "

echo "Installation terminée !"
echo "Le serveur web local est fonctionnel !"
echo "Les paquets suivants ont été installés : nano wget unzip apache2 php7.0 php7.0-curl mariadb-server mariadb-client !"
echo "Le CMS Joomla a également été préchargé ! ( Installation a finalisée. )"
