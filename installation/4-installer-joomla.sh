#!/bin/bash
echo "  "
echo "  "

echo " Installer Joomla! "

# Se placer à la racine du dossier html qui contient les fichiers par défaut du serveur web local.
echo "Se placer à la racine du dossier /var/www/html/ et charger Joomla!"
cd /var/www/html/

echo " Rapatrier la dernière version de Joomla! "
# Rapatrier Joomla! 3.8.7 qui est la dernière version stable lors de la rédaction de ce tutoriel.
wget https://github.com/AFUJ/joomla-cms-fr/releases/download/3.8.7.1/Joomla_3.8.7-FR-Stable-Full_Package.zip

echo " "

# Dézipper au même niveau que l'archive .zip
echo "Dézipper Joomla! dans le répertoire courant /var/www/html/"
unzip Joomla_3.8.7-FR-Stable-Full_Package.zip

echo " "

echo " Changer le propriétaire et le groupe pour celui de Apache. "
echo " Depuis le répertoire /var/www/html/ "
cd /var/www/html
echo " Appliquer le changement de propriétaire et de groupe pour les fichiers du site. "
echo " chown -Rv www-data:www-data * "
chown -Rv www-data:www-data *
echo " Permettre au groupe www-data d'écrire dans le dossier html. "
echo " chmod -Rv g+w * "
chmod -Rv g+w *


# Cette partie en commentaire devient inutile quand le groupe reçoit le droit d'écrire.
# Supprimer cette partie commentée par la suite.
# Créer le fichier vide, lui donner les droits, le placer dans le groupe de Apache;
# Il faudrait CONFIGURER le serveur de Joomla pour que Joomla puisse créer le fichier sans avoir à changer pour le bon groupe.
# sudo touch configuration.php
# sudo chmod 0644 configuration.php
# sudo chown www-data:www-data configuration.php
# echo "  "


echo " Effectué. "

echo "  "

echo " Ouvrir le navigateur avec l'adresse localhost/index.php "
echo " Finaliser l'installation de Joomla! "

echo " Renseigner la page 1 "
echo " Ajouter un utilisateur administrateur : MonAdminCMS / TravailLocal "

echo "  "

echo " Renseigner la page 2 "
echo " La base à sélectionner est mysqli "
echo " localhost "
echo " znation "
echo " KillTheZombie "
echo " Renseigner le nom de la base de données. "
echo " Aller sur la page locale http://localhost/phpmyadmin "
echo " Se connecter à PHPMyAdmin avec znation / KillTheZombie "
echo " Créer une nouvelle table joomlazombies "
echo " Modifier le préfixe à sa convenance : wtb3n_ "

echo "  "

echo " Renseigner la page 3 "
echo " Activer couche FTP : non "

echo "  "

echo " Renseigner la page 4 "
echo " Noter que : "
echo " Output Buffering doit être désactivé dans le fichier php.ini. "


echo "  "

echo " L'installation aboutie correctement. "

echo "  "

echo " IMPORTANT "
echo " Copier la configuration proposée en bas de page et l'ajouter dans le fichier configuration.php. "
echo " touch configuration.php "
echo " nano configuration.php "
echo " Coller les données du fichier configuration.php "

echo "  "

echo " Supprimer le dossier d'installation en cliquant sur le bouton. "
echo " Erreur. Le dossier ne peut pas être supprimé. "
echo " Veuillez le supprimer manuellement. "
echo " rm -R installation/ "

# cd /var/www/html
# rm -R installation/

echo "  "

# echo " Si le plugin install from the web est manquant, c'est un problème de droits. "

echo " Joomla est prêt à être utilisé. "
