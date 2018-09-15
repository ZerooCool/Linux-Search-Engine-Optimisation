#!/bin/bash
echo "  "
echo "  "

echo " Installer Joomla! "

# Se placer à la racine du dossier html qui contient les fichiers par défaut du serveur web local.
echo "Se placer à la racine du dossier /var/www/html/ et charger Joomla!"
cd /var/www/html/

echo " Rapatrier la dernière version de Joomla! "
# Rapatrier Joomla! 3.8.12.1 qui est la dernière version stable lors de la rédaction de ce tutoriel.
wget https://github.com/AFUJ/joomla-cms-fr/releases/download/3.8.12.1/Joomla_3.8.12-FR-Stable-Full_Package.zip

echo " "

# Dézipper l'archive zip au même niveau.
echo "Dézipper Joomla! dans le répertoire courant /var/www/html/"
unzip Joomla_3.8.12-FR-Stable-Full_Package.zip
# Supprimer l'archive zip.
rm Joomla_3.8.12-FR-Stable-Full_Package.zip

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


# Supprimer les fichiers suivants pour éviter de laisser des informations sur le CMS utilisé.
# LICENSE.txt, README.txt et web.config.txt
rm LICENSE.txt README.txt web.config.txt


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

# echo " Cette étape est automatique quand le groupe www-data est autorisé en écriture. "
# echo " Copier la configuration proposée en bas de page et l'ajouter dans le fichier configuration.php. "
# echo " Coller les données proposées par Joomla dans le fichier configuration.php "

echo "  "

echo " Supprimer le dossier d'installation en cliquant sur le bouton. "
echo " Erreur. Le dossier ne peut pas être supprimé. "
echo " Veuillez le supprimer manuellement. "
echo " rm -R installation/ "

# Avec la bonne configuration du serveur,
# Le groupe www-data autorisé en écriture,
# Cette étape ci-dessous devrait fonctionnée :
# cd /var/www/html
# rm -R installation/

echo "  "

# echo " Si le plugin install from the web est manquant, c'est un problème de droits. "

echo " Joomla est prêt à être utilisé. "
