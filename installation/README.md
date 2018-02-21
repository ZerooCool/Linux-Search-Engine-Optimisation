# README
## Les scripts.

00-ascii.sh - Affiche une image ascii.

00-menu.sh - Lance le menu d'installation.

1-installer-docker.sh - Installer Docker.

1-supprimer-conteneurs-et-images.sh - Supprimer les conteneurs et images de Docker.

1-supprimer-docker.sh - Supprimer le paquet Docker sur le système hôte.

2 - Importer l'image Docker de Debian.

3 - Installer le serveur local dans le conteneur Docker de Debian.

4 - Installer le dossier hello et les scripts pour tester le serveur.

4 - Télécharger l'archive d'un CMS et installer le CMS. ( Faire un nouveau menu pour la liste des CMS proposés. )

 Joomla

 Dolibarr

 WordPress

#################################################

# README
## Liste à faire.

Ajouter le lien vers sur support de Github au début du lancement de chaque script.

  # Support sur Github.

  echo

  echo "${rougefonce}En cas d'erreur durant l'installation, merci d'ouvrir une issue depuis Github${neutre}"

  echo "https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/issues"

  echo

  sleep 4


Chaque script terminé doit revenir sur le menu pour sortir avec le choix EXIT.

  sh ~/installeur/00-menu.sh


Faciliter la lecture de l'installation. Faire un arrêt avec sleep x et vider l'écran avec reset.


Utiliser le code de retour d'erreur après chaque commande.

  Exemple : https://www.visionduweb.eu/wiki/index.php?title=Programmation_en_Shell_Bash_Linux#Code_retour


Ajouter les logs à chaque étape.

   # Logs.txt
   cd ~/installeur
   echo "$jour - $heure : Les paquets de Docker n'ont pas été supprimés." >> logs.txt

Ajouter des couleurs.
