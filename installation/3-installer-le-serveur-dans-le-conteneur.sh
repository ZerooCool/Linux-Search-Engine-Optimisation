#!/bin/bash
# Script pour installer le serveur web local depuis le shell du conteneur de l'image Docker de Debian.

echo " "
echo " "

# Mise à jour des dépôts de debian.
echo " Mise à jour des dépôts de debian et mise à niveau des paquets. "
apt update
apt upgrade

echo " "
echo " "

## Installer sudo pour créer un utilisateur sudoers pour installer les paquets avec un utilisateur autre que root.
echo " Installer les paquets avec un utilisateur autre que root." 
echo " Installer sudo pour créer un utilisateur sudoers. "
echo " A intégrer dans le script automatique ! "
echo " En attendant, il faudra faire l'installation avec root. "
# adduser helloserveur
## Ajouter les informations de l'utilisateur et un mot de passe : ServeurG0
# usermod -a -G sudo helloserveur
# su helloserveur

echo " "
echo " "

# Installer les paquets nécessaires pour le serveur web local.
echo "Installation des paquets nécessaires pour le serveur web local."
apt install nano wget unzip apache2 php7.0 php7.0-curl mariadb-server mariadb-client -y

echo " Un avertissement est affiché : "
echo " locale: Cannot set LC_ALL to default locale: No such file or directory "

echo " "
echo " "

# Modifier le php.ini
echo "Modifier le fichier php.ini"
echo "A intégrer dans le script automatique !"
echo "En attendant, il faudra modifier soit même le fichier /etc/php/7.0/apache2/php.ini"
# nano /etc/php/7.0/apache2/php.ini
## Modifier les lignes :
# memory_limit = 256M
# upload_max_filesize = 32M
# post_max_size = 32M
# output_buffering on

echo " "
echo " "

# Démarrer MariaDB.
echo "Démarrage de MariaDB."
/etc/init.d/mysql start

echo " "
echo " "

# Installer PHPMyAdmin.
echo " Installation de PHPMyAdmin "
echo " Proposition de mot de passe : GestionnaireBDD "
apt install phpmyadmin -y
# yes pour configurer phpmyadmin
# Utiliser dbconfig-common y
# Choisir un mot de passe : GestionnaireBDD
# Choix 1 pour configurer Apache2

echo " "
echo " "

# Démarrer Apache2.
echo "Démarrage de Apache2."
service apache2 start

echo " "
# wget URL
# Appel au script hello.sh pour créer les fichiers exemple.
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
echo "Saisir manuellement les 3 lignes suivantes, et valider à chaque ligne."
echo "CREATE USER 'znation'@'localhost' IDENTIFIED BY 'KillTheZombie';"
echo "GRANT ALL PRIVILEGES ON *.* TO 'znation'@'localhost' WITH GRANT OPTION;"
echo "FLUSH PRIVILEGES;"
echo "Pour sortir, saisir alors exit;"
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

# Sécuriser MariaDB
echo "Sécuriser MariaDB."
echo "Remove anonymous users : Yes"
echo "Disallow root login  remotely ? [Y/n] : no"
echo "PLACER LA SECURISATION A LA FIN DU SCRIPT UNE FOIS L'UTILISATEUR MariaDB créé." 
echo "... et mettre Y pour interdire root. <strike>No pour le moment.</strike>"
echo "Delete test database : yes (?)"
echo "Reload privilèges tables now : yes"
mysql_secure_installation

echo " "
echo " "

echo " Changer le groupe et utilisateur pour celui de Apache. "
echo " Apache est propriétaire du site. "
echo " Depuis le répertoire /var/www/html/ "
cd /var/www/html
echo " Appliquer le changement de groupe et utilisateur "
echo " chown www-data:www-data * -R  "
chown www-data:www-data * -R

echo " "
echo " "

echo " Notes pour créer une base de données. "
echo " La base à sélectionner est mysqli "
echo " localhost "
echo " znation "
echo " KillTheZombie "
echo " Renseigner le nom de la base de données. "
echo " Aller sur la page locale http://localhost/phpmyadmin "
echo " Se connecter à PHPMyAdmin avec znation / KillTheZombie "
echo " Créer une nouvelle base de données joomlazombies "
echo " Modifier le préfixe à sa convenance : wtb3n_ "

echo "Installation du serveur terminée !"
echo "Les paquets suivants ont été installés : nano wget unzip apache2 php7.0 php7.0-curl mariadb-server mariadb-client mysql_secure_installation !"

echo " "

echo " Tester l'appel des 3 fichiers dans le dossier hello. "
echo " Le serveur web local est fonctionnel ! "

echo " "

echo " Continuer avec l'installation de Joomla! "
echo " Se placer dans le home "
cd /home/
echo " Télécharger le script d'installation "
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/installation/4-installer-joomla.sh
sh 4-installer-joomla.sh

echo " "

echo " Supprimer le script 3 et 4 une fois l'installation effectuée. "
sleep 4
rm /home/3-installer-le-serveur-dans-le-conteneur.sh
rm /home/4-installer-joomla.sh

echo " L'archive de Joomla a été téléchargée et installée. "
sleep 4
echo

# En cas de difficulté à l'installation, penser à redémarrer Apache2 et mySQL
# service apache2 restart
# service mysql restart
