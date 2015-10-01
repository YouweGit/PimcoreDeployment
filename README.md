PIMCORE DEPLOYMENT EXTENSION
----------------------------

Version: Pimcore 3.x

Developed by: Youwe (Manea, Yasar, Roelf, Bas)

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

Usage
-----

After changing or adding a pimcore object class, use the following command line command to export the updated
definitions:

    ./htdocs/plugins/Deployment/cli/export-definition.sh

When the project has been set up on a new dev system, or the project has been deployed to a server. Use the following
command to have pimcore update the object class related files and database structure:

    ./htdocs/plugins/Deployment/cli/import-definition.sh
    
Drop all the views in the database. Typically done before a complete import-definition.
    
    ./htdocs/plugins/Deployment/cli/drop-views.sh

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
            "youwe/deployment": "0.1.0"
        },
        "repositories": [
            {
                "type": "git",
                "url": "ssh://git@source.youwe.nl:7999/pimb2b/deployment.git"
            }
        ]
    }




