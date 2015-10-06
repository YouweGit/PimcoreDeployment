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
            "youwe/deployment": "^0.1.0"
        },
        "repositories": [
            {
                "type": "git",
                "url": "ssh://git@source.youwe.nl:7999/pimb2b/deployment.git"
            }
        ]
    }




