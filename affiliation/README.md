Créer une interface Zenity.

Mettre en place un formulaire de saisie d'adresse URL.

Affiliation
Entreprise_ID_Auto
Entreprise_Nom
Entreprise_URL
Entreprise_Tel

Ajouter un champ Mail.
Entreprise_Mail

Stocker l'URL dans une base de données.
Si elle n'éxiste pas déjà.

MySQL doit être autorisé à écouter et interagir depuis un script distant.
Voir l'hébergeur mutualisé : https://www.alwaysdata.com/fr/pricing/

#!/bin/bash

DB_USER='..';
DB_PASSWD='..';
DB_NAME='..';
TABLE='..';

echo 'mysql -u 'Utilisateur' -h 'serveur' -p'pass' -D 'NomBDD' "INSERT INTO 'Affiliation' (Entreprise_ID_Auto,Entreprise_Nom,Entreprise_URL,Entreprise_Tel) VALUES ('','Trop','Cool','777001')"'

| sshpass -p $pass_serveur ssh serveur@192.168.0.1

mysql --user=$DB_USER --password=$DB_PASSWD --default_character_set utf8 $DB_NAME
