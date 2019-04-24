#!/bin/bash

echo " Installer Wordpress 5.1.1"

# Créer une base de données wordpress avec PhpMyAdmin
# Ajouter la procédure
echo " Aller sur la page locale http://localhost/phpmyadmin "
echo " Se connecter à PHPMyAdmin avec znation / KillTheZombie "
echo " Créer une nouvelle base wordpress "


# Se placer à la racine du dossier html qui contient les fichiers par défaut du serveur web local.
echo "Se placer à la racine du dossier /var/www/html/ et charger Wordpress."
cd /var/www/html/

echo " Rapatrier la dernière version de Wordpress "
# Rapatrier la version Wordpress qui est la dernière version stable lors de la rédaction de ce tutoriel.
wget https://fr.wordpress.org/latest-fr_FR.zip
echo " "

# Dézipper au même niveau que l'archive .zip
echo "Dézipper Wordpress dans le répertoire courant /var/www/html/"
unzip latest-fr_FR.zip
rm latest-fr_FR.zip
rm index.html

# Le paquet Worpdress créé un nouveau répertoire, on copie les données du répertoire htdocs directement dans le dossier html.
cd wordpress
mv * /var/www/html
cd /var/www/html
# La source devient inutile
rm -R wordpress


echo " "

echo " Changer le groupe et utilisateur pour celui de Apache. "
echo " Apache est propriétaire du site. "
echo " Depuis le répertoire /var/www/html/ "
cd /var/www/html
echo " Appliquer le changement de groupe et utilisateur "
echo " chown www-data:www-data * -R  "
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
echo " Effectué. "

echo "  "

echo " Ouvrir le navigateur avec l'adresse localhost/index.php "
echo " Finaliser l'installation de Wordpress "

echo " Renseigner la page 1 "
echo " Cliquer sur C'est parti !"

echo "  "

echo " Renseigner la page 2 "

echo " Renseigner la rubrique Nom de la base de données"
echo " Saisir wordpress"

echo "Renseigner Identifiant: znation"
echo "Renseigner mot de passe : KillTheZombie" 

echo "Renseigner Adresse de la base de données"
echo "Saisir localhost"

echo " Renseigner Préfixe des tables"
echo " Saisir : wp_"

echo " Cliquer sur Valider"


echo " Sur la page 3 , cliquer sur Lancer l'installation !"

echo " Renseigner la page 4 "

echo " Rubrique Titre du site" 
echo " Nommer votre site : VictoireWP"

echo " Renseigner Votre adresse de messagerie"
echo " Saisir votre adresse e-mail"

echo " Renseigner Visibilité pour les moteurs de recherche:"
echo "Laisser cette case décochée pour un site accessible à tous."
echo " Cliquer sur Installer Wordpress."

echo " Sur la page 5 : cliquer sur Se connecter."

echo " Sur la page de connexion, renseigner Identifiant et Mot de passe"
echo " Identifiant : znation"
echo " Mot de passe : KillTheZombie"
echo "Cliquer sur Se connecter"
echo " On arrive sur la page d'administration de Wordpress"



echo "Sortir du conteneur"
echo "Saisir exit"



echo "Identifier le conteneur à sauvegarder avec docker ps -a"
echo "docker export 5cd7e1ffb9f6 > wordpress.tgz"
echo "docker import - wordpress < wordpress.tgz"

echo "Stopper le précédent conteneur"
echo "docker stop wordpress"
echo "Relancer le conteneur sauvegardé"
echo "docker ps -a"
echo "docker run --name Wordpress -p 80:80 -t -i wordpress /bin/bash"
echo "service apache2 start"
echo "service mysql start"
