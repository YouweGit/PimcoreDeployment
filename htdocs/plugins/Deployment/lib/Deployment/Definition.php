<?php

class YouweDeploy_Definition {

    public $path;
    private $db;

    function __construct() {
        $this->db = Pimcore_Resource::get();
        $this->path = PIMCORE_WEBSITE_PATH . '/var/deployment/migration/classes/';
    }

    /**
     * Exports class definition to json file
     */
    public function export() {
        Pimcore_File::setDefaultMode(0755);

        if (!is_dir($this->path)) {
            Pimcore_File::mkdir($this->path);
        }

        $list = new Object_Class_List();
        foreach ($list->load() as $class) {
            $json = $this->generateClassDefinitionJson($class);
            $filename = 'class_' . $class->getName() . '.json';
            echo $filename . "\n";
            Pimcore_File::put($this->path . $filename, $json);
        }
    }

    /**
     * @static
     * @param  Object_Class $class
     * @return string
     */
    public function generateClassDefinitionJson($class){

        $data = Webservice_Data_Mapper::map($class, "Webservice_Data_Class_Out", "out");
        unset($data->fieldDefinitions);

        $json = Zend_Json::encode($data);
        $json = Zend_Json::prettyPrint($json);
        return $json;
    }

    /**
     * Imports classes from json files
     */
    public function import() {
        $views = $this->db->fetchAll("SELECT CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS view
                    FROM information_schema.TABLES
                    WHERE TABLE_TYPE = 'VIEW' AND TABLE_SCHEMA = " . $this->db->quote($this->db->getConfig()['dbname']));

        foreach ($views as $view) {
            $this->db->query('DROP VIEW IF EXISTS ' . $this->db->quoteIdentifier($view['view']))->execute();
        }

        foreach (glob($this->path . "*.json") as $filename) {
            echo "$filename size " . filesize($filename) . "\n";
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
        $importData = Zend_Json::decode($json);
        $id = $this->db->quote($importData['id']);
        $name = $this->db->quote($importData['name']);
        $userOwner = $this->db->quote($importData['userOwner']);

        $class = Object_Class::getById($id);
        if (!$class) {
            $this->db->query("INSERT INTO classes(id,name, userOwner) VALUES($id, $name, $userOwner)");
        }
        else {
            $this->db->query("UPDATE classes SET name = '$name', userOwner = '$userOwner' WHERE id=$id");
        }
        $class = Object_Class::getById($id);

        return Object_Class_Service::importClassDefinitionFromJson($class, $json);
    }

}