<?php

namespace Deployment;

class Definition {

    public $path;
    private $db;

    function __construct() {
        $this->db = \Pimcore\Resource::get();
        $this->path = PIMCORE_WEBSITE_PATH . '/var/deployment/migration/classes/';
    }

    /**
     * Exports class definition to json file
     */
    public function export($classes = false) {
        \Pimcore\File::setDefaultMode(0755);

        if (!is_dir($this->path)) {
            \Pimcore\File::mkdir($this->path);
        }

        $list = new \Object_Class_List();
        foreach ($list->load() as $class) {
            // check if class needs to be skipped ($classes)
            if($classes && !in_array($class, $classes)) continue;

            $json = $this->generateClassDefinitionJson($class);
            $filename = $this->path . 'class_' . $class->getName() . '.json';
            echo "Exporting: " . str_replace(PIMCORE_WEBSITE_PATH, '', $filename) . " (" . strlen($json) . " bytes)\n";
            \Pimcore\File::put($filename, $json);
        }
    }

    /**
     * @static
     * @param  Object_Class $class
     * @return string
     */
    public function generateClassDefinitionJson($class){

        $data = \Webservice\Data\Mapper::map($class, '\Webservice\Data\ClassDefinition\Out', "out");
        unset($data->fieldDefinitions);

        $json = \Zend_Json::encode($data);
        $json = \Zend_Json::prettyPrint($json);
        return $json;
    }

    /**
     * Imports classes from json files
     */
    public function import($classes = false) {
//        $views = $this->db->fetchAll("SELECT CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS view
//                    FROM information_schema.TABLES
//                    WHERE TABLE_TYPE = 'VIEW' AND TABLE_SCHEMA = " . $this->db->quote($this->db->getConfig()['dbname']));
//
//        foreach ($views as $view) {
//            // check if class needs to be skipped ($classes)
//            echo "Dropping view: " . $view['view'] . "\n";
//            $this->db->query('DROP VIEW IF EXISTS ' . $this->db->quoteIdentifier($view['view']))->execute();
//        }

        foreach (glob($this->path . "*.json") as $filename) {
            // check if class needs to be skipped ($classes)
//            if($classes && !in_array($class, $classes)) continue;

            echo "Importing: " . str_replace(PIMCORE_WEBSITE_PATH, '', $filename) . " (" . filesize($filename) . " bytes)\n";
            $this->save($filename);
        }
    }

    /**
     * @param string $filename
     * @return bool
     * @throws Exception
     * @throws Zend_Json_Exception
     */
    public function save($filename)
    {
        $json = file_get_contents($filename);
        $importData = \Zend_Json::decode($json);
        $id = $this->db->quote($importData['id']);
        $name = $this->db->quote($importData['name']);
        $userOwner = $this->db->quote($importData['userOwner']);

        $class = \Object_Class::getById($id);
        if (!$class) {
            $this->db->query("INSERT INTO classes(id,name, userOwner) VALUES($id, $name, $userOwner)");
        }
        else {
            $this->db->query("UPDATE classes SET name = $name, userOwner = $userOwner WHERE id=$id");
        }
        $class = \Object_Class::getById($id);

        return \Object_Class_Service::importClassDefinitionFromJson($class, $json);
    }

}