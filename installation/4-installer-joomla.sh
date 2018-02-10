#!/bin/bash
echo "  "
echo "  "

echo " Installer Joomla! "

echo "  "

echo " Changer le groupe et utilisateur pour celui de Apache. "
echo " Apache est propriétaire du site. "
echo " Depuis le répertoire /var/www/html/ "
cd /var/www/html
echo " Appliquer le changement de groupe et utilisateur "
echo " chown www-data:www-data * -R  "

echo "  "

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
# echo " Copier la configuration proposée en bas de page et l'ajouter dans le fichier configuration.php. "
# echo " touch configuration.php "
# echo " nano configuration.php "

echo "  "

echo " Supprimer le dossier d'installation en cliquant sur le bouton. "
# echo " Erreur. Le dossier ne peut pas être supprimé. "
# echo " Veuillez le supprimer manuellement. "
# echo " rm -R installation/ "

echo "  "

# echo " Si le plugin install from the web est manquant, c'est un problème de droits. "

echo " Joomla est prêt à être utilisé. "
