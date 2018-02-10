#!/bin/bash
echo "  "
echo "  "

echo " Installer Joomla! "


# Se placer à la racine du dossier html qui contient les fichiers par défaut du serveur web local.
echo "Se placer à la racine du dossier /var/www/html/ et charger Joomla!"
cd /var/www/html/

echo " Rapatrier la dernière version de Joomla! "
# Rapatrier Joomla! 3.8.5 qui est la dernière version stable lors de la rédaction de ce tutoriel.
wget https://github.com/AFUJ/joomla-cms-fr/releases/download/3.8.5.1/Joomla_3.8.5-FR-Stable-Full_Package.zip

echo " "

# Dézipper au même niveau que l'archive .zip
echo "Dézipper Joomla! dans le répertoire courant /var/www/html/"
unzip Joomla_3.8.5-FR-Stable-Full_Package.zip

echo " "

echo " Changer le groupe et utilisateur pour celui de Apache. "
echo " Apache est propriétaire du site. "
echo " Depuis le répertoire /var/www/html/ "
cd /var/www/html
echo " Appliquer le changement de groupe et utilisateur "
echo " chown www-data:www-data * -R  "
chown www-data:www-data * -R
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
echo " configuration.php Modifiable est sur Non alors que la valeur devrait être Oui. "
echo " Output Buffering Désactivé. Il faudrait activer le Output Buffering. "

echo "  "

echo " L'installation aboutie correctement. "
echo " Copier la configuration proposée en bas de page et l'ajouter dans le fichier configuration.php. "
echo " touch configuration.php "
echo " nano configuration.php "
echo " Coller le code de configuration. "

echo "  "

echo " Supprimer le dossier d'installation en cliquant sur le bouton. "
# echo " Erreur. Le dossier ne peut pas être supprimé. "
# echo " Veuillez le supprimer manuellement. "
# echo " rm -R installation/ "

echo "  "

# echo " Si le plugin install from the web est manquant, c'est un problème de droits. "

echo " Joomla est prêt à être utilisé. "
