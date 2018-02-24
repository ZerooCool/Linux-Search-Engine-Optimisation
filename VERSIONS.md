
# SEO Kalamity - Version 0.6
Le système Debian Stretch 9 est remplacé par Kali Linux : kali-linux-light-2018.1-amd64.iso<br/>

Ajout d'un wiki sur GitHub : https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/wiki<br/>
Ajout de la page Docker : https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/wiki/Utiliser-Docker<br/>

Ajout des droits root à l'utilisateur seo de Kali Linux. Utiliser sudo dans les scripts.<br/>

OWASP Mantra est réinstallé, uniquement dans le menu des applications du compte root.<br/>

Ajout de JAVA jre-8u161-linux-x64 dans le dossier jre pour Eclipse Oxygen ET pour le dossier bin de Gephi.<br/>
Cmatrix pour le fun : Lancer cmatrix depuis le terminal.<br/>
Ajout du thème Plasma Fire pour XFCE.<br/>
Installation de mousepad.<br/>
Installation de Bleachbit.<br/>
Installation de GIT.<br/>

Installation de Zenity : apt-get install zenity<br/>
Ajout d'un menu Zenity pour les logiciels de développement web en BETA-TEST.<br/>
Ajout d'un menu Zenity pour les logiciels de SEO en BETA-TEST.<br/>
Le script charger-sitemap-production.sh est intégré au menu rapide SEO.<br/>
Gephi est intégré au menu rapide SEO en BETA-TEST.<br/>
Le script sitemap-e est fonctionnel avec libwww-mechanize-perl libdatetime-perl libio-tee-perl.<br/>
Le script sitemap-e est intégré au menu rapide SEO en BETA-TEST.<br/>

Les scripts pour installer Docker sont placés dans le dossier Scripts : /home/seo/KSEO/Scripts/Kalamity Docker/<br/>
Le dossier installation sous Github contient les mêmes scripts , à jour, en BETA-TEST :<br/>
Le fichier README.md<br/>
Script 0 : Image d'introduction en ascii-art.<br/>
Script 0 : Le menu pour une installation assistée.<br/>
Script 1 : Installer Docker.<br/>
Script 1 : Supprimmer des conteneurs et images existantes.<br/>
Script 1 : Supprimmer Docker et nettoyer l'installation.<br/>
Script 2 : Importer l'image Docker Debian.<br/>
Script 3 : Installer le serveur web localement.<br/>
Script 4 : Télécharger et installer Joomla! / Dolibarr / Wordpress<br/>

Création du dossier Github hello avec des scripts pour tester le bon fonctionnement du serveur web local Docker.<br/>
https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/tree/master/hello<br/>
Le fichier index.php affiche une image et les liens vers les scripts suivants :<br/>
hello.php : Voir si php fonctionne. Doit afficher SEO.<br/>
phpinfo.php : Retourne les informations du serveur web Apache2.<br/>
curl.php : Voir si cURL fonctionne. Doit afficher Enabled.<br/>

Ajout de la portée de variables depuis le menu vers les autres scripts appelés depuis le menu.<br/>
Ajout d'un fichier de logs lors de l'installation depuis le menu. (~/installeur/logs.txt)<br/>
Script de suppression de Docker pour partager une machine virtuelle plus légère.<br/>
L'installation de Docker est assistée avec le menu accueil 00-menu.sh (Dossier installation de Github.)<br/>

Le mineur de monero est à nouveau installé. Intégré au menu rapide Dev Web il ne se lance pas.<br/>
Lancer directement depuis le dossier /home/seo/KSEO/Outils/<br/>

Le script ping-google-bing-sitemap.sh ne se lance pas avec le menu rapide SEO.<br/>
Lancer directement depuis le dossier /home/seo/KSEO/Scripts/<br/>

Import du dossier Webcheck dans la Version 0.6 a installer dans la Version 0.7 ou supérieur.

# SEO Kalamity - Version 0.5
Création de la page Github officielle : https://github.com/ZerooCool/Linux-Search-Engine-Optimisation<br/>
Ajout du serveur PHP5 tutum/lamp via Docker. Supprimé dans la version 0.6 et remplacé par Debian Apache2 MariaDB php7.0<br/>
Ajout du paquet php5-curl et sauvegarde de l'image Docker. Supprimé dans la version 0.6 et remplacé par php7.0-curl<br/>
Ajout d'un script pour réimporter le conteneur de Docker à neuf automatiquement.<br/>
Ajout de la page du wiki sur Docker dans les favoris du navigateur Firefox : https://www.visionduweb.eu/wiki/index.php?title=Ajouter_Docker_sur_GNU_Linux<br/>
Ajout du plugin Linkchecker pour identifier les liens morts d'un site avec Firefox : https://addons.mozilla.org/fr/firefox/addon/linkchecker/<br/>
Nouveaux emblèmes sur les icones.<br/>
Nouveaux fonds d'écran.

# SEO Kalamity - Version 0.4
Ajout du lien pour Content Spinning : https://www.visionduweb.eu/wiki/index.php?title=SEO_Content_Spinning<br/>
Ajout du plugin PurTraqueur de PurMedia pour partager vos articles en un clic sur PurMedia : http://purmedia.fr/pur-traqueur.html<br/>
Ajout pour Scrapebox avec une liste de 119 footprints pour « Page Scanner » dans les favoris du navigateur Firefox.<br/>
Ajout d'autres liens complémentaires dans les favoris du navigateur Firefox.<br/>
Ajout du dossier de favoris Blast SEO. Nouvelle organisation des dossiers favoris. <br/>
Ajout de notes dans "SEO - Visuel.odg" et "SEO - Prise de notes.odt" du dossier /home/seo/DOCU-SEO/<br/>
Ajout d'un exemple de masterspin dans /home/seo/DOCU-SEO/Tutoriels/Master spin/<br/>
Ajout d'URL qui permettent de soumettre un fichier sitemap.xml par ping, aux moteurs de recherche : /home/seo/Scripts/ping-google-bing-sitemap.sh<br/>
Sauvegarde des favoris de firefox dans le dossier /home/seo/DOCU-SEO/Sauvegarde/Les favoris de Firefox/<br/>
Créer un compte sur Minergate pour fabriquer de la monnaie numérique : https://minergate.com/a/8ac23bd407f9b6db4d848765<br/>
Installation du Mineur cpuminer pour aider les nouveaux utilisateurs de monnaie numérique (https://www.visionduweb.eu/wiki/index.php?title=Sites_gratuits_pour_gagner_du_Monero_depuis_votre_navigateur#Installer_le_mineur_cpuminer_sur_Debian_Stretch)

# SEO Kalamity - Version 0.3
Installation du paquet gephi-0.9.2-linux.tar.gz dans le dossier utilisateur seo.<br/>
Ajout du navigateur de pentest Mantra (Qui n'est plus maintenu.)<br/>
Ajout de Eclipse GTK Oxygen. (HTML CSS PHP.)<br/>
Ajout du script sitemap-e pour créer un fichier sitemap.xml<br/>
Ajout de perl et de certains modules demandés par Debian pour utiliser sitemap-e.<br/>
Test du script et création du fichier README pour l'utilisation des scripts.<br/>
Ajout de ressources sur la communication et le SE0 dans le dossier pdf /home/seo/DOCU-SEO/Tutoriels/Pdf/<br/>
Ajout de liens pour optimiser un référencement dans les favoris du navigateur Firefox.<br/>
Ajout de liens pour créer et utiliser des masterspins en ligne dans les favoris du navigateur Firefox.<br/>
Ajout de liens dans un dossier Black Hat SEO dans les favoris du navigateur Firefox.

# SEO Kalamity - Version 0.2
Ajour d'une liste d'annuaires et moteurs, autoapprouvés, pour master spin.<br/>
IMPORTANT - La liste des annuaires et moteurs à mettre à jour : https://lite.framacalc.org/Moteurs_et_annuaires<br/>
Liens à compléter et a vérifier avec la communauté pour pouvoir les exploiter.<br/>
IMPORTANT - Ajout du lien pour soumettre son site dans l'annuaire de Vision du web dans les favoris du navigateur Firefox : https://www.visionduweb.eu/proposer-un-lien-web<br/>
Ajout de fichiers et de dossiers en local concernant le SEO.<br/>
Changement des emblèmes sur le dossier DOCU-SEO et son contenu et sur le dossier Scripts.<br/>
IMPORTANT - La page d'accueil SEO depuis le wiki est ajoutée dans les favoris du navigateur Firefox : https://www.visionduweb.eu/wiki/index.php?title=Accueil_SEO<br/>
Ajout de l'outil GHSTooLS et de son forum dans les favoris du navigateur Firefox.<br/>
Ajout du forum Scripts SEO dans les favoris du navigateur Firefox : http://scripts-seo.com

# SEO Kalamity - Version 0.1
 Debian 9 firmware-9.2.1-amd64-DVD-1<br/>
 Graphique install | Fr / fr | Nom de système : presence | Environnement de bureau : xfce4 | Utilitaires Linux préinstallés.<br/>
 sources.list Debian 9 stable<br/>
 Source : https://www.visionduweb.eu/wiki/index.php?title=Installer_Debian_Jessie#Sources.list_non-free_pour_Debian_9_Stretch<br/>
 Addons invités. Interface graphique de VirtualBox Version 5.1.30 r118389 (Qt5.6.1)<br/>
 Copier / Coller bidirectionnel. | Transfert de fichier par cliquer déposer bidirectionnel. | Partage de dossier.<br/>
 Source : https://www.visionduweb.eu/wiki/index.php?title=Installer_VirtualBox_sur_Debian#Installer_les_Additions_invit.C3.A9s_de_VirtualBox<br/>
 Installation du paquet gedit<br/>
 Ajout de fonds d'écran SEO.
