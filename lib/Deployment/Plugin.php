<?php

namespace Deployment;

use Pimcore\API\Plugin as PluginLib;

class Plugin extends PluginLib\AbstractPlugin implements PluginLib\PluginInterface {

    public function init() {

        parent::init();

        // register your events here

        // using anonymous function
        \Pimcore::getEventManager()->attach("document.postAdd", function ($event) {
            // do something
            $document = $event->getTarget();
        });

        // using methods
        \Pimcore::getEventManager()->attach("document.postUpdate", array($this, "handleDocument"));

        // for more information regarding events, please visit:
        // http://www.pimcore.org/wiki/display/PIMCORE/Event+API+%28EventManager%29+since+2.1.1
        // http://framework.zend.com/manual/1.12/de/zend.event-manager.event-manager.html
        // http://www.pimcore.org/wiki/pages/viewpage.action?pageId=12124202

    }

    public function handleDocument ($event) {
        // do something
        $document = $event->getTarget();
    }

	public static function install (){
        // implement your own logic here
        return true;
	}

	public static function uninstall (){
        // implement your own logic here
        return true;
	}

	public static function isInstalled () {
        // implement your own logic here
        return true;
	}

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
//        $writer->write(PIMCORE_PLUGINS_PATH . '/Deployment/config.xml', $config);
        $writer->write($customconfig_file, $config);
    }
}
