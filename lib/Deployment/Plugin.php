<?php

namespace Deployment;

use Pimcore\API\Plugin as PluginLib;

class Plugin extends PluginLib\AbstractPlugin implements PluginLib\PluginInterface {

    /**
     * @var Zend_Translate
     */
    protected static $_translate;

    public function init() {

        parent::init();

        // register your events here

        // using anonymous function
//        \Pimcore::getEventManager()->attach("document.postAdd", function ($event) {
//            $document = $event->getTarget();
//        });

        // using methods
//        \Pimcore::getEventManager()->attach("document.postUpdate", array($this, "handleDocument"));

        // for more information regarding events, please visit:
        // http://www.pimcore.org/wiki/display/PIMCORE/Event+API+%28EventManager%29+since+2.1.1
        // http://framework.zend.com/manual/1.12/de/zend.event-manager.event-manager.html
        // http://www.pimcore.org/wiki/pages/viewpage.action?pageId=12124202

    }

//    public function handleDocument ($event) {
//        // do something
//        $document = $event->getTarget();
//    }

//	public static function install (){
//        // implement your own logic here
//        return true;
//	}
//
//	public static function uninstall (){
//        // implement your own logic here
//        return true;
//	}
//
//	public static function isInstalled () {
//        // implement your own logic here
//        return true;
//	}

    public static function getConfig()
    {
        $customconfig_file = PIMCORE_CONFIGURATION_DIRECTORY . '/deployment.xml';
        $defaultconfig_file = PIMCORE_PLUGINS_PATH . '/Deployment/config.default.xml';

        if(file_exists($customconfig_file))
        {
            return new \Zend_Config_Xml($customconfig_file, null, true);
        }

        return new \Zend_Config_Xml($defaultconfig_file, null, true);
    }

    public static function setConfig($config)
    {
        $customconfig_file = PIMCORE_CONFIGURATION_DIRECTORY . '/deployment.xml';

        $writer = new \Zend_Config_Writer_Xml();
        $writer->write($customconfig_file, $config);
    }











    /**
     * @return string $statusMessage
     */
    public static function install()
    {
        try {
            $install = new \Deployment_Plugin_Install();

            // create object classes
            $blogCategory = $install->createClass('BlogCategory');
            $blogEntry = $install->createClass('BlogEntry');

            // classmap
            $install->setClassmap();

            // create root object folder with subfolders
//            $blogFolder = $install->createFolders();

            // create custom view for blog objects
//            $install->createCustomView($blogFolder, array(
//                $blogEntry->getId(),
//                $blogCategory->getId(),
//            ));

            // create static routes
//            $install->createStaticRoutes();

            // create predefined document types
//            $install->createDocTypes();

        } catch(\Exception $e) {
            \logger::crit($e);
            return self::getTranslate()->_('blog_install_failed');
        }

        return self::getTranslate()->_('blog_installed_successfully');
    }

    /**
     * @return string $statusMessage
     */
    public static function uninstall()
    {
        try {
            $install = new \Deployment_Plugin_Install();

            // remove predefined document types
//            $install->removeDocTypes();

            // remove static routes
//            $install->removeStaticRoutes();

            // remove custom view
//            $install->removeCustomView();

            // remove object folder with all childs
//            $install->removeFolders();

            // classmap
            $install->unsetClassmap();

            // remove classes
            $install->removeClass('BlogEntry');
            $install->removeClass('BlogCategory');

            return self::getTranslate()->_('blog_uninstalled_successfully');
        } catch (\Exception $e) {
            \Logger::crit($e);
            return self::getTranslate()->_('blog_uninstall_failed');
        }
    }

    /**
     * @return boolean $isInstalled
     */
    public static function isInstalled()
    {
        $entry = \Pimcore\Model\Object\Classdefinition::getByName('BlogEntry');
        $category = \Pimcore\Model\Object\Classdefinition::getByName('BlogCategory');

        if ($entry && $category) {
            return true;
        }

        return false;
    }

    /**
     * @return string
     */
    public static function getTranslationFileDirectory()
    {
        return PIMCORE_PLUGINS_PATH . '/Deployment/static/texts';
    }

    /**
     * @param string $language
     * @return string path to the translation file relative to plugin direcory
     */
    public static function getTranslationFile($language)
    {
        if (is_file(self::getTranslationFileDirectory() . "/$language.csv")) {
            return "/Deployment/static/texts/$language.csv";
        } else {
            return '/Deployment/static/texts/en.csv';
        }
    }

    /**
     * @return Zend_Translate
     */
    public static function getTranslate()
    {
        if(self::$_translate instanceof \Zend_Translate) {
            return self::$_translate;
        }

        try {
            $lang = \Zend_Registry::get('Zend_Locale')->getLanguage();
        } catch (\Exception $e) {
            $lang = 'en';
        }

        self::$_translate = new \Zend_Translate(
            'csv',
            PIMCORE_PLUGINS_PATH . self::getTranslationFile($lang),
            $lang,
            array('delimiter' => ',')
        );
        return self::$_translate;
    }

}
