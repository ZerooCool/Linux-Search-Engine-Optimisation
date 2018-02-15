#!/bin/bash
echo "  "
echo "  "

echo " Installer Dolibarr 6.0.5"

# Créer une base de données dolibarr avec PhpMyAdmin
# Ajouter la procédure
echo " Aller sur la page locale http://localhost/phpmyadmin "
echo " Se connecter à PHPMyAdmin avec znation / KillTheZombie "
echo " Créer une nouvelle table dolibarr "


# Se placer à la racine du dossier html qui contient les fichiers par défaut du serveur web local.
echo "Se placer à la racine du dossier /var/www/html/ et charger Dolibarr."
cd /var/www/html/

echo " Rapatrier la dernière version de Dolibarr! "
# Rapatrier la version Dolibarr qui est la dernière version stable lors de la rédaction de ce tutoriel.
wget https://github.com/Dolibarr/dolibarr/archive/develop.zip
echo " "

# Dézipper au même niveau que l'archive .zip
echo "Dézipper Dolibarr dans le répertoire courant /var/www/html/"
unzip develop.zip
rm develop.zip 

# Le paquet Dolibarr créé un nouveau répertoire, on copie les données du répertoire htdocs directement dans le dossier html.
cd dolibarr-develop/htdocs
mv * /var/www/html
cd /var/www/html
# La source devient inutile
rm -R dolibarr-develop/


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
echo " Finaliser l'installation de Dolibarr "

echo " Renseigner la page 1 "
echo " Choisir la langue"

echo "  "

echo " Renseigner la page 2 "
echo "Vérification des prérequis"
echo "Démarrer"

echo "Renseigner la page 3"
echo "Configurer le Serveur Web" 

echo "Renseigner le Répertoire contenant les pages web"
echo "/var/www/html"

echo "Répertoire devant contenir les documents générés (PDF, etc.)"
echo "/var/www/html/documents"
echo "Il est recommandé de mettre ce répertoire en dehors du répertoire des pages web."
echo "Exemples:/var/lib/dolibarr/documents"


echo "URL racine"
echo "http://localhost "

echo "Renseigner les informations Base de données Dolibarr"
echo "Nom de la base de données"
echo "dolibarr"

echo "Type du pilote"
echo " La base à sélectionner est mysqli "

echo "Serveur de Base de données"
echo "localhost"

echo "Port"
echo "3306"

echo "Préfixe des tables"
echo "llx"

echo "On peut éventuellement demander à l'installeur de créer la base de données."
echo "Inutile de cocher la case, la base de données a déjà été créée avec PhpMyAdmin"

echo "Identifiant de la Base de données : znation"
echo "Mot de passe : KillTheZombie"

echo "On peut Créer le propriétaire ou lui affecter les droits à la base"
echo "Ne pas sélectionner la case"
echo "L'utilisateur znation a déjà été créé lors de l'installation du serveur."
echo "La base de données a déjà été sécurisée par le paquet de sécurité..."
echo " Etape suivante "





echo "Renseigner la page 4"
echo " Ici Dolibarr affiche une version 8.0.0-alpha"
echo " Fichier de configuration "
echo " Enregistrement du fichier de configuration ../conf/conf.php	Ok "
echo " Rechargement des informations depuis le fichier de configuration.	Ok  "
echo " Connexion au serveur (Utilisateur znation) : localhost	Ok"
echo " Connexion à la base (Utilisateur znation) : dolibarr	Ok "
echo " Etape suivante "


echo " La procédure d'installation démarre.... patientez"
echo " Une erreur apparait : "
echo " Erreur SQL DB_ERROR_1071 Specified key was too long; max key length is 767 bytes "
echo " Etape suivante "



echo " Page de connexion"
echo " Renseigner identifiants et mot de passe (znation et KillTheZombie "
echo " Noter que l'utilisateur root est le même que celui de la base de données "
echo " Etape suivante"


echo " Création du compte administrateur Dolibarr 'znation' réussie."
echo "Votre système est maintenant installé."
echo "Attention, pour des raisons de sécurité, "
echo "afin de bloquer une nouvelle utilisation des outils d'installation/migration, une fois l'installation terminée," 
echo "il est conseillé de placer dans le répertoire document de Dolibarr un fichier nommé install.lock en lecture seule."

echo "Vous devez maintenant configurer Dolibarr selon vos besoins"
echo "(Choix de l'apparence, des fonctionnalités, etc.). Pour cela, cliquez sur le lien ci-dessous : "
echo " Accéder à Dolibarr (espace de configuration) "

echo " Finaliser l'installation  "
echo " Accéder à Dolibarr (espace de configuration)"


echo " Page d'accueil de l'espace de configuration de Dolibarr"
echo " http://localhost/admin/index.php?mainmenu=home&leftmenu=setup&username=znation "
echo " Se connecter avec l'utilisateur znation / KillTheZombie "


echo " Sur l'Espace de configuration , Cliquer à gauche sur la rubrique Société /Organisation et la renseigner "
echo " Aller en bas de page et cliquer sur Modifier pour renseigner les champs"
echo "Faire les modifications puis cliquer Enregistrer en bas de page"
echo " De retour sur l'Espace de configuration , Cliquer à gauche sur la rubrique Modules / Applications et la renseigner en choisissant les options souhaitées."

echo" Dans la rubrique Utilisateurs et Groupes , vous pouvez personnaliser les informations de connexion et du profil utilisateur."
echo " Penser à modifier l'identifiant et mot de passe de l'utilisateur SuperAdmin qui utilise celui de la base de données par défaut."
echo " Penser à renseigner le mail."




echo "Repartir sur le terminal"
echo "Protéger le dossier documents"
echo "cd /var/www/html/"
echo "cd documents"
echo "touch install.lock"
echo "chmod 444 install.lock"



echo "Identifier le conteneur à sauvegarder avec docker ps -a"
echo "docker export e0e99bf04c07 > dolibarr.tgz"
echo "docker import - dolibarrok < dolibarr.tgz"

echo "Stopper le précédent conteneur"
echo "docker stop dolibarr"
echo "Relancer le conteneur sauvegardé"
echo "docker ps -a"
echo "docker run --name Dolibarrok -p 80:80 -t -i dolibarrok /bin/bash"
echo "service apache2 start"
echo "service mysql start"
