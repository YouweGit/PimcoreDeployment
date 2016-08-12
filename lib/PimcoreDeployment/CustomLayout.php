<?php

namespace PimcoreDeployment;

use Exception;
use Pimcore\Db;
use Pimcore\File;
use Pimcore\Model\Object\ClassDefinition;
use Pimcore\Model\Object\ClassDefinition\CustomLayout as PimcoreCustomLayout;
use Zend_Json_Exception;
use Pimcore\Model\Object;

class CustomLayout {
    /** @var string */
    public $path;
    /** @var mixed|\Zend_Db_Adapter_Abstract */
    private $db;

    public function __construct() {
        $this->db = Db::get();
        $this->path = PIMCORE_WEBSITE_PATH . '/var/Plugins/PimcoreDeployment/migration/custom_layouts/';
    }

    /**
     * Exports custom layouts to json file
     */
    public function export() {
        File::setDefaultMode(0755);

        if (!is_dir($this->path)) {
            File::mkdir($this->path);
        }

        $list = new PimcoreCustomLayout\Listing();
        /** @var PimcoreCustomLayout $customLayout */
        foreach ($list->load() as $customLayout) {

            $json = $this->generateCustomLayoutJson($customLayout);
            $filename = $this->path . 'custom_layout_' . $customLayout->getName() . '.json';
            echo 'Exporting: ' . str_replace(PIMCORE_WEBSITE_PATH, '', $filename) . "\n";
            File::put($filename, $json);
        }
    }

    /**
     * @param PimcoreCustomLayout $customLayout
     * @return string
     */
    public function generateCustomLayoutJson($customLayout) {
        unset(
            $customLayout->creationDate,
            $customLayout->modificationDate,
            $customLayout->userModification,
            $customLayout->fieldDefinitions
        );
        $json = \Zend_Json::encode($customLayout);
        $json = \Zend_Json::prettyPrint($json);
        return $json;
    }


    /**
     * Imports custom layouts from json files
     * @throws \Exception
     */
    public function import() {
        $this->db->query('TRUNCATE custom_layouts');
        foreach (glob($this->path . '*.json') as $filename) {
            echo 'Importing: ' . str_replace(PIMCORE_WEBSITE_PATH, '', $filename) . "\n";
            $this->save($filename);
        }
    }

    /**
     * @param string $filename
     * @throws Exception
     * @throws Zend_Json_Exception
     */
    public function save($filename) {
        $json = file_get_contents($filename);
        $importData = \Zend_Json::decode($json);

        // Safe to do an insert with id as long as custom_layouts is truncated at import()
        $this->db->insert('custom_layouts', [
            'id' => $importData['id'],
            'name' => $importData['name'],
            'description' => $importData['description'],
            'userOwner' => $importData['userOwner'],
            'classId' => $importData['classId'],
            'default' => $importData['default'],
        ]);

        $customLayout = PimcoreCustomLayout::getById($importData['id']);
        $layout = Object\ClassDefinition\Service::generateLayoutTreeFromArray($importData['layoutDefinitions'], true);
        $customLayout->setLayoutDefinitions($layout);
        $customLayout->save();
    }


}