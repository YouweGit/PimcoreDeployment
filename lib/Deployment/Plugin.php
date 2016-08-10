<?php

namespace Deployment;

use Pimcore\API\Plugin as PluginLib;
use Pimcore\Model\Object\ClassDefinition;

class Plugin extends PluginLib\AbstractPlugin implements PluginLib\PluginInterface {

    /**
     * @var Zend_Translate
     */
    protected static $_translate;

    public function init() {

        parent::init();

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
        $writer->write($customconfig_file, $config);
    }

    /**
     * @return string $statusMessage
     */
    public static function install()
    {
        // check if the plugins table structure is already exported by the plugin itself
        $def = new \Deployment\Definition();
        $plugin_data_table_file_exported = $def->path . 'class_DeploymentDataMigration.json';
        if(file_exists($plugin_data_table_file_exported))
        {
            return self::getTranslate()->_('deployment_install_definition_import');
        }

        try {
            $install = new \Deployment_Plugin_Install();
            $install->createClass('DeploymentDataMigration');
        } catch(\Exception $e) {
            \logger::crit($e);
            return self::getTranslate()->_('deployment_install_failed');
        }

        return self::getTranslate()->_('deployment_installed_successfully');
    }

    /**
     * @return string $statusMessage
     */
    public static function uninstall()
    {
        try {
            $install = new \Deployment_Plugin_Install();
            $install->removeClass('DeploymentDataMigration');

            return self::getTranslate()->_('deployment_uninstalled_successfully');
        } catch (\Exception $e) {
            \Logger::crit($e);
            return self::getTranslate()->_('deployment_uninstall_failed');
        }
    }

    /**
     * @return boolean $isInstalled
     */
    public static function isInstalled()
    {
        $entry = Classdefinition::getByName('DeploymentDataMigration');
        if ($entry) {
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
