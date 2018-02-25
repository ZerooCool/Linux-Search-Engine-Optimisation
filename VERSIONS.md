
# Kalamity SEO - Version 0.6
En ligne Samedi 24 février 2018, à partir de 23h.

Le système Debian Stretch 9 est remplacé par Kali Linux : kali-linux-light-2018.1-amd64.iso<br/>
Graphique install | Fr / fr | Nom de système : KSEO | Environnement de bureau : xfce4.<br/>
Dépôt sources.list de Kali Linux 2018 par défaut.<br/>
Ajout des droits root à l'utilisateur seo de Kali Linux. Utiliser sudo dans les scripts.<br/>
La machine virtuelle passe de 30 à 35 Go.

Addons invités. Interface graphique de VirtualBox Version 5.2.6 r120293 (Qt5.6.1)<br/>
Copier / Coller bidirectionnel. | Transfert de fichier par cliquer déposer bidirectionnel. | Partage de dossier.<br/>
Tutoriel : https://www.visionduweb.eu/wiki/index.php?title=Installer_VirtualBox_sur_Debian#Installer_les_Additions_invit.C3.A9s_de_VirtualBox<br/>

Changement des emblèmes sur le dossier DOCU-SEO et son contenu et sur le dossier Scripts.<br/>
Ajout d'un fond d'écran pour l'utilisateur root et de 4 fonds d'écran pour l'utilisateur seo.<br/>
OWASP Mantra, qui n'est plus maintenu, est réinstallé dans le menu des applications du compte root.<br/>
Ajout du plugin PurTraqueur de PurMedia pour partager vos articles en un clic sur PurMedia : http://purmedia.fr/pur-traqueur.html<br/>
Ajout du plugin Linkchecker pour identifier les liens morts d'un site avec Firefox : https://addons.mozilla.org/fr/firefox/addon/linkchecker/<br/>

Ajout d'un wiki sur GitHub : https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/wiki<br/>
Ajout de la page Docker : https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/wiki/Utiliser-Docker<br/>

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

Ajout de la portée de variables depuis le menu assistant de Docker vers les autres scripts appelés depuis le menu.<br/>
Ajout d'un fichier de logs lors de l'installation depuis le menu. (~/installeur/logs.txt)<br/>
Script de suppression de Docker pour partager une machine virtuelle plus légère.<br/>
L'installation de Docker est assistée avec le menu accueil 00-menu.sh (Dossier installation de Github.)<br/>

Le mineur de monero est à nouveau installé, mais la compilation n'a pas aboutie correctement sur Kali Linux.<br/>
dminer est copié collé de l'ancienne installation de Debian Stretch, et, se lance normalement..
Voir si il fonctionne et est bien reconnu depuis l'interface de minergate.<br/>
Intégré au menu rapide Dev Web il ne se lance pas avec mon raccourci Zenity.<br/>
Lancer le script directement depuis le dossier /home/seo/KSEO/Outils/<br/>

Le script ping-google-bing-sitemap.sh ne se lance pas avec le menu rapide SEO.<br/>
Lancer directement depuis le dossier /home/seo/KSEO/Scripts/<br/>

Import du dossier Webcheck dans la Version 0.6 a installer dans la Version 0.7 ou supérieur.

# Kalamity SEO - Version 0.5
Création de la page Github officielle : https://github.com/ZerooCool/Linux-Search-Engine-Optimisation<br/>
Ajout du serveur PHP5 tutum/lamp via Docker. Supprimé dans la version 0.6 et remplacé par Debian Apache2 MariaDB php7.0<br/>
Ajout du paquet php5-curl et sauvegarde de l'image Docker. Supprimé dans la version 0.6 et remplacé par php7.0-curl<br/>
Ajout d'un script pour réimporter le conteneur de Docker à neuf automatiquement. Modifié dans la version 0.6 pour un appel depuis le menu 00-menu.sh<br/>
Ajout de la page du wiki pour le tutoriel sur Docker dans les favoris du navigateur Firefox : https://www.visionduweb.eu/wiki/index.php?title=Ajouter_Docker_sur_GNU_Linux<br/>
Ajout du plugin Linkchecker pour identifier les liens morts d'un site avec Firefox : https://addons.mozilla.org/fr/firefox/addon/linkchecker/<br/>

# Kalamity SEO - Version 0.4
Ajout du lien pour Content Spinning : https://www.visionduweb.eu/wiki/index.php?title=SEO_Content_Spinning<br/>
Ajout du plugin PurTraqueur de PurMedia pour partager vos articles en un clic sur PurMedia : http://purmedia.fr/pur-traqueur.html<br/>
Ajout pour Scrapebox avec une liste de 119 footprints pour « Page Scanner » dans les favoris du navigateur Firefox.<br/>
Ajout d'autres liens complémentaires dans les favoris du navigateur Firefox.<br/>
Ajout du dossier de favoris Blast SEO. Nouvelle organisation des dossiers favoris. <br/>
Ajout de notes dans "SEO - Visuel.odg" et "SEO - Prise de notes.odt" du dossier /home/seo/KSEO/DOCU-SEO/<br/>
Ajout d'un exemple de masterspin dans /home/seo/KSEO/DOCU-SEO/Tutoriels/Master spin/<br/>
Ajout d'URL qui permettent de soumettre un fichier sitemap.xml par ping, aux moteurs de recherche : /home/seo/KSEO/Scripts/ping-google-bing-sitemap.sh<br/>
Sauvegarde des favoris de firefox dans le dossier /home/seo/KSEO/DOCU-SEO/Sauvegarde/Les favoris de Firefox/<br/>
Créer un compte sur Minergate pour fabriquer de la monnaie numérique : https://minergate.com/a/8ac23bd407f9b6db4d848765<br/>
Installation du Mineur cpuminer pour aider les nouveaux utilisateurs de monnaie numérique : https://www.visionduweb.eu/wiki/index.php?title=Sites_gratuits_pour_gagner_du_Monero_depuis_votre_navigateur#Installer_le_mineur_cpuminer_sur_Debian_Stretch

# Kalamity SEO - Version 0.3
Installation du paquet gephi-0.9.2-linux.tar.gz dans le dossier utilisateur seo.<br/>
Ajout du navigateur de pentest Mantra (Qui n'est plus maintenu.)<br/>
Ajout de Eclipse GTK Oxygen. (HTML CSS PHP.)<br/>
Ajout du script sitemap-e pour créer un fichier sitemap.xml<br/>
Ajout de perl et des modules demandés par Debian, puis par Kali Linux dans la version 0.6, pour utiliser sitemap-e.<br/>
Ajout du fichier README pour l'utilisation des scripts et test des scripts.<br/>
Ajout de ressources sur la communication et le SE0 dans le dossier pdf /home/seo/KSEO/DOCU-SEO/Tutoriels/Pdf/<br/>
Ajout de liens pour optimiser un référencement dans les favoris du navigateur Firefox.<br/>
Ajout de liens pour créer et utiliser des masterspins en ligne dans les favoris du navigateur Firefox.<br/>
Ajout de liens dans un dossier Black Hat SEO dans les favoris du navigateur Firefox.

# Kalamity SEO - Version 0.2
Ajour d'une liste d'annuaires et moteurs, autoapprouvés, pour master spin.<br/>
La liste des annuaires et moteurs à mettre à jour : https://lite.framacalc.org/Moteurs_et_annuaires<br/>
Liens à compléter et a vérifier avec la communauté pour pouvoir les exploiter.<br/>
Ajout du lien pour soumettre son site dans l'annuaire de Vision du web dans les favoris du navigateur Firefox : https://www.visionduweb.eu/proposer-un-lien-web<br/>
Ajout de fichiers et de dossiers en local concernant le SEO.<br/>
IMPORTANT - La page d'accueil SEO depuis le wiki est ajoutée dans les favoris du navigateur Firefox : https://www.visionduweb.eu/wiki/index.php?title=Accueil_SEO<br/>
Ajout de l'outil GHSTooLS et de son forum dans les favoris du navigateur Firefox.<br/>
Ajout du forum Scripts SEO dans les favoris du navigateur Firefox : http://scripts-seo.com

# Kalamity SEO - Version 0.1
Installation du système. Debian Stretch 0 à l'origine, remplacé dans la version 0.6 par Kali Linux 2018.

# A faire à chaque version
Sauvegarde des favoris de firefox dans le dossier /home/seo/DOCU-SEO/Sauvegarde/Les favoris de Firefox/<br/>
Se déconnecter de Firefox.<br/>
Supprimer Docker pour minimiser le poids de la machine virtuelle à télécharger.<br/>
Suppression de l'historique du terminal pour éviter la présence d'un historique de commandes inutiles.<br/>
history -c<br/>
history -w<br/>
Lancer bleachbit.
