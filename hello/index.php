<?php $link = mysql_connect('localhost', 'root'); ?>
<html>
<head>
        <title>Hello SEO Kalamity</title>
        <style>
        body {
                background-color: white;
                text-align: center;
                padding: 50px;
                font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
        }

        #seo {
                margin-bottom: 40px;
        }
        </style>
</head>
<body>
        <img id="seo" src="seo.jpg" />
        <h1><?php echo "Hello SEO Kalamity"; ?></h1>
        <?php if(!$link) { ?>
                <h2>Impossible de se connecter au serveur MySQL !</h2>
        <?php } else { ?>
                <h2>Version du serveur MySQL : <?php echo mysql_get_server_info(); ?></h2>
        <?php } ?>
Vérifier si PHP est interprété : <a href="http://localhost/hello/phpinfo.php" target="_new">http://localhost/phpinfo.php</a>
<br/>
Voir phpinfo(); : <a href="http://localhost/hello/phpinfo.php" target="_new">http://localhost/phpinfo.php</a>
<br/>
Voir curl.php : <a href="http://localhost/hello/curl.php" target="_new">http://localhost/curl.php</a>
</body>
</html>
