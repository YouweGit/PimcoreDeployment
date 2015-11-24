PIMCORE DEPLOYMENT EXTENSION
----------------------------

Version: Pimcore 3.x

Developed by: Youwe (Manea, Yasar, Roelf, Bas)

Reference / latest developments: Roelf



Excerpt
-------

* Always developing your pimcore projects locally, and deploying them to servers afterwards like a real pro?
* Don't like having to manually save all the object classes on every server after deploying changed classes?
* Like to work more efficiently and professionally with pimcore?

... then this extension is for you!



Description
-----------

The pimcore deployment extension as the following general functionalities:

* Provide a way to do migrations of the pimcore object classes data structure
* Provide a way to keep tables with static data synced on the server
* Provide a way to migrate static document data to the server (work in progress)



Usage and examples
------------------

After changing or adding a pimcore object class, use the following command line command to export the updated
definitions:

Export all pimcore classes:

    ./htdocs/plugins/Deployment/cli/export-definition.sh
    
Export some selected pimcore classes:
    
    ./htdocs/plugins/Deployment/cli/export-definition.sh -c product,persom

When the project has been set up on a new dev system, or the project has been deployed to a server. Use the following
command to have pimcore update the object class related files and database structure:

Import all json definitions:

    ./htdocs/plugins/Deployment/cli/import-definition.sh

Import some selected json definitions:

    ./htdocs/plugins/Deployment/cli/import-definition.sh -c product,persom
    
Drop all the views (and tables that should be views!) in the database. Typically done before a complete import-definition.

Drop all:
    
    ./htdocs/plugins/Deployment/cli/drop-views.sh
    
Drop selected (by name):
    
    ./htdocs/plugins/Deployment/cli/drop-views.sh -c product,persom
    
Drop selected (by id):
    
    ./htdocs/plugins/Deployment/cli/drop-views.sh -i 2,5,6

Clear the classes table in the database. Can be used when the class ids in the exported definition
mismatch the ones already in the database. Use with care.
    
    ./htdocs/plugins/Deployment/cli/clear-classes.sh

If some tables contain static data which is actually managed whilst developing, and are not supposed to be
altered by the client on the server, you can use the static data exporter/importers:

Configure which tables are static using the extras->extensions->deployment-configuration in pimcore. Run 
this command on your dev station after altering the table data:

    ./htdocs/plugins/Deployment/cli/export-staticdata.sh
    
Run this command (automatically) on the server after deployment. Warning: this will completely replace all
data in the tables:
    
    ./htdocs/plugins/Deployment/cli/import-staticdata.sh
    

Deployment to server
--------------------

When deploying your project to a server, the deployment script would typically execute these commands after
deploying the updated code:

    ./htdocs/plugins/Deployment/cli/import-definition.sh
    ./htdocs/plugins/Deployment/cli/import-staticdata.sh
    (another command will be added here as soon as the document-migration is done)

    
    
Initial (first-time) deployment to server
-----------------------------------------

Be careful not to install this plugin on your server, because it would generate a pimcore table for itself using
an improvised ID. Rather follow this route:

* On your development machine, enable the plugin and install the plugin (from the Extras -> Extensions menu).
* This will generate a pimcore data table called DeploymentDataMigration
* After this is done, use the export-definition command to export all pimcore data table definitions to json files.
* Now you will run the import-definition command on the server and all the data tables will be generated from json files.
* The plugin will enable itself.
* By creating the data tables from the json files, the DeploymentDataMigration datatable is also created.
* This means the plugin is installed.



Troubleshooting
---------------

Before importing the definitions, you might need to set the correct permissions, in order for this script to be able to
write to the definition files. In case of local development, a low security solution like the following could be used:

    sudo chmod -R 777 .



Installation
------------

Plugin can be installed through composer. Add json to your composer.json:

    {
        "config": {
            "document-root-path": "htdocs"
        },
        "require": {
            "pimcore/installer-plugin": "^1.3",
            "youwe/pathmanager": "^0.1.0",
            "youwe/deployment": "^0.1.0"
        },
        "repositories": [
            {
                "type": "git",
                "url": "ssh://git@source.youwe.nl:7999/pimb2b/deployment.git"
            },
            {
                "type": "git",
                "url": "ssh://git@source.youwe.nl:7999/pimb2b/pathmanager.git"
            }
        ]
    }


Activate/enable the plugin in pimcore's extras->extensions list.

Also, add this to your .gitignore:

    /htdocs/plugins/Deployment
    
 


Plugin development
------------------

To create a new version, check out the master branch somewhere and go:

    git tag 0.1.0
    git push origin --tags


