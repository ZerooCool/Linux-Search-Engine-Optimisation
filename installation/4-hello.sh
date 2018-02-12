echo " "
echo " Installation des fichiers examples. "

# Se placer dans le dossier par défaut du serveur web local.
echo "Se placer dans le dossier /var/www/html du serveur web local."
cd /var/www/html
# Créer un dossier hello.
echo "Création du dossier hello."
mkdir hello
# Se placer dans le dossier hello.
echo "Se placer dans le dossier /var/www/html/hello."
cd /var/www/html/hello

echo " "
echo " "

# Importer le fichier index.php et l'image seo. Permet d'avoir accès aux scripts directement.
echo "Importer le fichier index.php et l'image seo. Permet d'avoir accès aux scripts directement."
wget https://raw.githubusercontent.com/ZerooCool/Linux-Search-Engine-Optimisation/master/hello/index.php
wget https://github.com/ZerooCool/Linux-Search-Engine-Optimisation/raw/master/hello/seo.jpg

# Créer le fichier hello.php pour vérifier le fonctionnement de PHP.
echo "Créer le fichier hello.php pour vérifier le fonctionnement de PHP."
echo "<?php" >> hello.php
echo "echo 'SEO';" >> hello.php
echo "?>" >> hello.php

# Créer le fichier phpinfo.php pour obtenir les informations du serveur.
echo "Créer le fichier phpinfo.php pour obtenir les informations du serveur."
echo "<?php" >> phpinfo.php
echo "phpinfo();" >> phpinfo.php
echo "?>" >> phpinfo.php

# Créer le fichier curl.php pour vérifier si cURL est activé.
echo "Créer le fichier curl.php pour vérifier si cURL est activé."
echo "<?php" >> curl.php
echo "echo 'Curl : ', function_exists('curl_version') ? 'Enabled' : 'Disabled';" >> curl.php
echo "?>" >> curl.php

echo " "
echo " Exemples installés. "
