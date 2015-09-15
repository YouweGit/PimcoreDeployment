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
      DocumentRoot "/data/projects/pimcore-migration-dev/htdocs"
      DirectoryIndex index.php

      PHP_VALUE    error_reporting  6143
      PHP_FLAG     display_errors   On
      PHP_FLAG     log_errors       On

      <Directory "/data/projects/pimcore-migration-dev/htdocs">
        Options FollowSymLinks
        AllowOverride All
    #    Allow from All
        Require all granted
      </Directory>
    </VirtualHost>

Fork the git and clone your fork to:

    /data/projects/pimcore-migration-dev

Change credentials in tools/scripts/config.sh

    user: root
    pass: root
    db:   pimcore_migdev

Put initial database structure/data in place:

    cd tools/scripts
    cp dump-initial.sql dump.sql
    ./init-local.sh

Set permissions:

    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
    find . -type f -name "*.sh" -exec chmod 774 {} \;

    OR

    sudo chmod -R 777 .

Fix GIT not to commit the new permissions (necessary on mac when using 777):

    git config core.fileMode false

Set config:

    cp htdocs/website/var/config/system.xml.initial htdocs/website/var/config/system.xml

Create log path:

    mkdir htdocs/website/var/log (if it doesnt exist)

Login admin:

    http://migration-dev.pimcore.local/admin/
    username: admin
    password: P!mcore

Update database and classes to latest state using the Deployment itself:

    htdocs/plugins/Deployment/cli/import-definition.sh




