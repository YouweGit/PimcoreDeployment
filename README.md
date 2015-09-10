PIMCORE MIGRATION EXTENSION DEVELOPMENT PROJECT
-----------------------------------------------

Use this project to develop the Deployment plugin.


Local Setup
-----------

Add to hosts file:

    127.0.0.1	migration-dev.pimcore.local

Add vhost to apache:

    <VirtualHost *:80>
      ServerName migration-dev.pimcore.local
      DocumentRoot "/data/projects/pimcore-migration-dev"
      DirectoryIndex index.php

      PHP_VALUE    error_reporting  6143
      PHP_FLAG     display_errors   On
      PHP_FLAG     log_errors       On

      <Directory "/data/projects/pimcore-migration-dev">
        Options FollowSymLinks
        AllowOverride All
    #    Allow from All
        Require all granted
      </Directory>
    </VirtualHost>

Create database:

    user: pimcore-migdev
    pass: pimcore-migdev
    db:   pimcore-migdev

Fork the git and clone your fork to:

    /data/projects/pimcore-migration-dev

Put initial database structure/data in place:

    cd tools/scripts
    cp dump-initial.sql dump.sql
    ./reload-local.sh


    