#!/bin/bash



echo " Installer Prestashop"



# Créer une base de données prestashop avec PhpMyAdmin

# Ajouter la procédure

echo " Aller sur la page locale http://localhost/phpmyadmin "

echo " Se connecter à PHPMyAdmin avec znation / KillTheZombie "

echo " Créer une nouvelle base wordpress "





# Se placer à la racine du dossier html qui contient les fichiers par défaut du serveur web local.

echo "Se placer à la racine du dossier /var/www/html/ et charger Wordpress."

cd /var/www/html/



echo " Rapatrier la dernière version de Wordpress "

# Rapatrier la version Wordpress qui est la dernière version stable lors de la rédaction de ce tutoriel.

wget https://download.prestashop.com/download/releases/prestashop_1.7.2.5.zip

echo " "



# Dézipper au même niveau que l'archive .zip

echo "Dézipper Wordpress dans le répertoire courant /var/www/html/"

unzip prestashop_1.7.2.5.zip

rm prestashop_1.7.2.5.zip 



unzip prestashop.zip

rm prestashop.zip







# Le paquet Prestashop créé un nouveau répertoire, on copie les données du répertoire htdocs directement dans le dossier html.

cd prestashop

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



echo " Activer mod_rewrite pour Apache:"

echo " Saisir  a2enmod rewrite dans le terminal puis relancer Apache"

echo "  "

echo " 

echo " Ouvrir le navigateur avec l'adresse localhost/index.php "

echo " Renseigner la page 1 :Choix de la langue "

echo " Cliquer sur Suivant"

echo " Si visible , Ignorer l'erreur intl propre aux serveurs distants"

echo " Finaliser l'installation de Prestashop en cliquant sur Suivant"



echo " Renseigner la page 2"



echo " Saisir un nom pour votre Boutique"

echo " Choisir une activité "

echo " Choisir un pays"



echo " Rubrique Votre compte "

echo " Saisir votre Prénom "

echo " Saisir votre nom "

echo " Saisir votre adresse e-mail "

echo " Saisir votre mot de passe "

echo " Confirmer le mot de passe "



echo " Renseigner la page 3 "



echo " Renseigner la rubrique Adresse du serveur"

echo " Saisir 127.0.0.1"

echo " Renseigner nom de la base : prestashop "

echo " Renseigner Identifiant de la base : znation"

echo " Renseigner mot de passe : KillTheZombie" 





echo " Renseigner Préfixe des tables"

echo " Saisir : ps_"



echo " Cliquer sur Suivant"

echo " Patienter pendant le déroulement du processus"

echo " En fin d'installation, retourner sur le terminal"

ecgo " Supprimer le répertoire install "

echo " Saisir rm -R install"

cd var /www/html

echo rm -R install



echo " Retourner sur le navigateur et choisissez Gérer votre Boutique"







echo " Sur la page de connexion, renseigner E-mail et Mot de passe"



echo " Cliquer sur Se connecter"

echo " On arrive sur la page d'administration de Prestashop"







echo "Sortir du conteneur"

echo "Saisir exit"





# Etape a finaliser pour Prestashop

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



