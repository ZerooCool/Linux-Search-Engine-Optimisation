# Le fichier phpinfo.php informe l'administrateur système des paquets installés sur le serveur.
# Ce fichier n'a pas vocation a être lisible sur un site en production.

# Interdire l'accès à ce fichier quand il n'est pas nécessaire à l'administrateur système.
# Donner le fichier à l'utilisateur root.
# sudo chown root:root phpinfo.php
# Supprimer les droits d'accès.
# sudo chmod 0000 phpinfo.php

# Autoriser l'accès à ce fichier quand il est nécessaire à l'administrateur système.
# Donner le fichier à l'utilisateur www-data.
# sudo chown www-data:www-data phpinfo.php
# Autoriser les droits en lecture.
# sudo chmod 0444 phpinfo.php

# Recharger la configuration du serveur.
sudo /etc/init.d/apache2 reload

<?php
phpinfo();
?>
