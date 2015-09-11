PIMCORE MIGRATION EXTENSION DEVELOPMENT PROJECT
-----------------------------------------------

version: Pimcore 3.x

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

change credentials in tools/scripts/config.sh
    user: root
    pass: root
    db:   pimcore_migdev

Fork the git and clone your fork to:

    /data/projects/pimcore-migration-dev

Put initial database structure/data in place:

    cd tools/scripts
    cp dump-initial.sql dump.sql
    ./reload-local.sh

Set permissions:

    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
    find . -type f -name "*.sh" -exec chmod 774 {} \;



