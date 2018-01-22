# Linux Search Engine Optimisation
L'objectif de cette machine virtuelle est de centraliser et partager des outils pour le référencement et le SEO.

# SEO Kalamity - Version 0.5
Télécharger l'image .ova de la Version 0.5 avec ce lien pour soutenir le projet SEO Kalamity : https://cnhv.co/1f7v4
<br/><br/>
Compter environ 2Go 500Mo pour le chargement.<br/>
Disposer de 30Go disponibles pour installer la machine virtuelle sur VirtualBox.

# Utilisateurs de la machine virtuelle
seo : UtilisateurSEO<br/>
root : OptimisationSEO

# Liens en miroir de précédentes versions a télécharger
SEO Kalamity - Version 0.4 --> Télécharger l'image .ova avec ce lien pour soutenir le projet SEO Kalamity : https://cnhv.co/1cyiu<br/>
Télécharger l'image .ova en version 0.4 depuis MediaFire : http://www.mediafire.com/file/suef98dg7oj9dhs/SEO.ova<br/>
Télécharger l'image .ova en version 0.5 depuis OneDrive : https://1drv.ms/u/s!AKtUsyUfGwC9hEc

# Importer la machine virtuelle avec VirtualBox
Double cliquer sur l'archive .ova téléchargée pour importer la machine virtuelle Linux Search Engine Optimisation.<br/>
La version courante de SEO Kalamity sera ajoutée à VirtualBox.

# Démarrer la machine virtuelle
Lancer la machine depuis Virtualbox.<br/>
Utiliser l'identifiant seo / UtilisateurSEO indiqué en haut de la page.

# Utiliser Linux Search Engine Optimisation
## Cours et prises de notes
Ajout de cours et prises notes dans le dossier /home/seo/DOCU-SEO/<br/>
Consulter les fichiers suivant : "SEO - Visuel.odg" et "SEO - Prise de notes.odt"

## Exemples disponibles
Ajout d'un exemple de masterspin dans /home/seo/DOCU-SEO/Tutoriels/Master spin/

## Logiciels installés
### Configurer Firefox
Le compte Firefox administrateur pour conserver la liste des favori est déconnecté lors du partage de la machine virtuelle.<br/>
Créer votre propre compte Firefox pour sauvegarder et syncroniser la liste des favoris actuelle et vos nouveaux favoris.<br/>
Les favoris de Firefox ont été sauvegardés dans le dossier /home/seo/DOCU-SEO/Sauvegarde/Les favoris de Firefox/

### Utiliser Firefox
Des favoris ont été sélectionnés pour partager des outils pour le SEO.<br/>
Le plugin Linkchecker est intégré pour vérifier si les liens de votre site ne sont pas brisés.<br/>
Le plugin PurTraqueur de PurMedia est intégré pour partager vos pages intéressantes en un clic sur PurMedia.

### Eclipse
L'outil de développement web Eclipse est disponible depuis le bureau.

### Mantra
L'outil navigateur pentest Mantra est disponible depuis le bureau.

## Scripts installés
### Script pour lancer le logiciel Gephi
L'outil Gephi est disponible depuis les scripts à partir du bureau.<br/>
La page Gephi sur le wiki est ajoutée dans les favoris du navigateur Firefox : https://www.visionduweb.eu/wiki/index.php?title=Accueil_SEO#Gephi

### Script pour créer un ficher sitemap.xml avec Sitemap-e
Sitemap-e permet de créer un fichier sitemap.xml

### Script pour miner de la monnaie numérique avec Minergate
Créer un compte sur Minergate pour fabriquer de la monnaie numérique : https://minergate.com/a/8ac23bd407f9b6db4d848765<br/>
Installation du Mineur cpuminer pour aider les nouveaux utilisateurs de monnaie numérique (https://www.visionduweb.eu/wiki/index.php?title=Sites_gratuits_pour_gagner_du_Monero_depuis_votre_navigateur#Installer_le_mineur_cpuminer_sur_Debian_Stretch)
### Script pour Ping google bing sitemap
Ajout d'URL qui permettent de soumettre un fichier sitemap.xml par ping, aux moteurs de recherche.<br/>
/home/seo/Scripts/ping-google-bing-sitemap.sh

### Script pour Importer l'image de sauvegarde Docker
Un fichier texte dans les raccourcis du bureau permet de réimporter l'image docker.

## Utiliser Docker
### Mise en place du serveur Lamp PHP5 MySQL avec une image Docker<br/>
Importer l'image avec la commande : docker pull tutum/lamp<br/>
Démarrer lamp : docker run -d -p 80:80 -p 3306:3306 tutum/lamp<br/>
Cette image peut être modifiée puis sauvegardée a un état personnalisé.
Tutoriel Docker : https://www.visionduweb.eu/wiki/index.php?title=Ajouter_Docker_sur_GNU_Linux#Installer_une_image_Docker_lamp

### Supprimer tous les conteneurs existants
Normalement, il n'y a pas de conteneurs démarrés ou arrêtés au démarrage de la machine virtuelle SEO Kalamity.<br/>
Si des conteneurs Docker existent déjà, vous pouvez les supprimer.
<br/><br/>
Se connecter en super utilisateur : su<br/>
Ajouter le mot de passe de l'utilisateur root : OptimisationSEO
<br/><br/>
Vérifier si des conteneurs sont arrêtés : docker ps -a<br/>
Vérifier si des conteneurs sont démarrés : docker ps
<br/><br/>
On stop tous les conteneurs avec la commande : docker stop $(docker ps -a -q)<br/>
On supprime tous les conteneurs existant avec la commande : docker rm $(docker ps -a -q)

### Importer notre image de sauvegarde Docker
Réimporter l'image Docker avec Lamp MySQL PHP5 cURL : docker load -i /home/seo/lamp-mysql-php5-curl.tar

### Se connecter à une image Docker
Voir toutes les images disponibles avec la commande : docker images<br/>
docker run -d -p 80:80 -p 3306:3306 8d876406448a

### Entrer dans le bash de Nginx avec l'id de status du conteneur
Voir tous les conteneurs démarrés et les ids associées avec la commande : docker ps<br/>
docker exec -it 8d876406448a bash<br/>
Mise à jour de l'image Docker Lamp MySQL PHP5 curl : update upgrade<br/>
Installation du paquet php5-curl
<br/><br/>
Les fichiers du site par défaut une fois connecté à l'image Docker : /var/www/html# ls<br/><br/>Maintenir le serveur et le site local.<br/>Ajouter des scripts php ...

### Sauvegarde de l'image Docker modifiée
Commiter le conteneur Docker avec Lamp MySQL PHP5 cURL pour générer l'état à sauvegarder.<br/>
Identifier le conteneur a commiter avec la commande : docker ps -a<br/>
Lancer le commit sur le conteneur avec la commande : docker commit -a "Auteur" -m "message optionnel" <ID du conteneur ou nom> <Tag à donner à l'image>
<br/><br/>
Sauvegarder l'image Docker avec Lamp MySQL PHP5 cURL<br/>
Trouver l'id de l'image a sauvegarder avec la commande : docker images -a<br/>
docker save -o /home/seo/lamp-mysql-php5-curl.tar c1d0dc8367a4
