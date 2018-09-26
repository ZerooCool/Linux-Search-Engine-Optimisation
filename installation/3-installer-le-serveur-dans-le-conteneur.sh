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
echo " Installation des paquets nécessaires pour le serveur web local. "
apt install nano wget unzip apache2 mariadb-server mariadb-client -y

echo " "
echo " "

echo " Choix du dépôt PHP7.2 pour Debian. "
apt-get install apt-transport-https lsb-release ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list
apt-get update

echo " "
echo " "

echo " Installer les paquets pour PHP7.2 "
apt-get install php7.2 php7.2-opcache libapache2-mod-php7.2 php7.2-mysql php7.2-curl php7.2-json php7.2-gd  php7.2-intl php7.2-mbstring php7.2-xml php7.2-zip php7.2-fpm php7.2-readline

echo " "
echo " "

# Modifier le php.ini
echo " Modifier le fichier php.ini "
echo " A intégrer dans le script automatique ! "
echo " En attendant, modifier manuellement le fichier /etc/php/7.2/apache2/php.ini "
# nano /etc/php/7.2/apache2/php.ini
echo " Modifier les lignes "
echo " memory_limit = 256M "
echo " upload_max_filesize = 32M "
echo " post_max_size = 32M "
echo " output_buffering Off "

echo " "
echo " "

# Joomla et PHP Mail : Impossible de lancer la fonction mail.
# Seuls les mails de Joomla avec SMTP et Gmail sortent avec une configuration par défaut.
# Avoir un vrai serveur de mail en interne serait plus adéquate pour un grand projet.
# Utiliser le bon serveur SMTP SSL, pour OVH, permet l'envoie de mail : ssl0.ovh.net
# Il faut donc contacter le support de son hébergeur pour obtenir les bonnes informations.
# Contacter Nerim pour le domaine visionduweb.com et obtenir le bon serveur SMTP avec SSL.
# Voir l'issue : https://github.com/joomla/joomla-cms/issues/22249

# echo " "
# echo " "

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
# Choix 1 pour configurer Apache2
# Choisir un mot de passe : GestionnaireBDD
echo " "
echo " "

# Démarrer Apache2.
echo " Démarrage de Apache2. "
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
echo "Disallow root login  remotely ? [Y/n] : no" // Ou plutôt Yes en fait.
echo "PLACER LA SECURISATION A LA FIN DU SCRIPT UNE FOIS L'UTILISATEUR MariaDB créé." 
echo "... et mettre Y pour interdire root. <strike>No pour le moment.</strike>"
echo "Delete test database : yes (?)"
echo "Reload privilèges tables now : yes"
mysql_secure_installation


echo " "
echo " "


# Concerne notamment le CMS Joomla!
# En cas d'erreurs lors de l'import MySql
# incorrect datetime value '0000-00-00 00:00:00'
# Dans les configuration de base de MySql la valeur zéro est maintenant interdite dans les dates.
# Si vous avez des champs date avec des valeurs à zéro, il faut enlever ce contrôle.
# Dans le fichier de configuration de MySql (/etc/mysql/mysql.conf.d/mysql.cnf)
# Rechercher la variable d'environnement sql-mode et supprimer NO_ZERO_DATE et NO_ZERO_IN_DATE
# Ajouter le bloc suivant dans la configuration de MySQL :
# 
# [client]
# sql-mode="STRICT_ALL_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER"
# 
# [mysql]
# sql-mode="STRICT_ALL_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER"


# echo " "
# echo " "


echo " Apache est propriétaire du site. "
echo " Appliquer le changement de propriétaire et de groupe pour les fichiers du site depuis le répertoire /var/www/html/ "
cd /var/www/html
echo " Appliquer le changement de groupe et utilisateur "
echo " chown -Rv www-data:www-data * "
chown -Rv www-data:www-data *
echo " Permettre au groupe www-data d'écrire dans le dossier html. "
echo " chmod -Rv g+w * "
chmod -Rv g+w *

echo " "
echo " "

echo " Installer Denyhosts pour protéger des tentatives d'intrusion. "
wget http://ftp.fr.debian.org/debian/pool/main/d/denyhosts/denyhosts_2.10-2_all.deb
dpkg -i denyhosts_2.10-2_all.deb
sudo rm denyhosts_2.10-2_all.deb

echo " "

echo " Installation du serveur terminée ! "
echo " Les paquets suivants ont été installés : nano wget unzip apache2 php7.0 php7.0-curl mariadb-server mariadb-client mysql_secure_installation ! "
echo " Ainsi que les paquets pour les modules de php. "

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

echo " "

echo " Tester l'appel des 3 fichiers dans le dossier hello. "
echo " Le serveur web local doit maintenant être fonctionnel ! "

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

# En cas de difficulté à l'installation, penser à redémarrer Apache2 et MySQL
# service apache2 restart
# service mysql restart
