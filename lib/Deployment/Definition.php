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
            if($classes && !in_array($class->getName(), $classes)) continue;

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
     * Clear-classes
     */
    public function clearClasses($classes = false) {

        echo "Clearing classes table\n";
        $this->db->query('DELETE FROM classes');
    }

    /**
     * Dropviews
     */
    public function dropViews($classes = false) {

        // TODO: grab mappings from json files

//        $views = $this->db->fetchAll("SELECT CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS view
//                    FROM information_schema.TABLES
//                    WHERE TABLE_TYPE = 'VIEW' AND TABLE_SCHEMA = " . $this->db->quote($this->db->getConfig()['dbname']));

        $views = $this->db->fetchAll("SELECT
                      CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS fulltablename,
                      TABLE_TYPE as ttype,
                      TABLE_NAME as tablename
                    FROM information_schema.TABLES
                    WHERE TABLE_SCHEMA = " . $this->db->quote($this->db->getConfig()['dbname']));

//        $views = $this->db->fetchAll("SELECT
//                      CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS fulltablename,
//                      TABLE_TYPE as ttype,
//                      TABLE_NAME as tablename
//                    FROM information_schema.TABLES
//                    WHERE
//                      (
//                       TABLE_NAME REGEXP " . $this->db->quote("^object_[0-9]+$") . "
//                        OR
//                       TABLE_NAME REGEXP " . $this->db->quote("^object_localized_[0-9]+_[A-z]{2}_[A-z]{2}$") . "
//                        OR
//                       TABLE_NAME REGEXP " . $this->db->quote("^object_localized_[0-9]+_[A-z]{2}$") . "
//                      )
//                      AND
//                      TABLE_SCHEMA = " . $this->db->quote($this->db->getConfig()['dbname']));

//        ---- object_##
//        ---- object_localized_##_XX_XX
//        ---- object_localized_##_XX

        foreach ($views as $view) {
            // check if class needs to be skipped ($classes)

            $should_be_view = false;
            if (preg_match('/^object_([0-9]+)$/', $view['tablename'], $matches)
                    ||
                preg_match('/^object_localized_([0-9]+)_[A-z]{2}$/', $view['tablename'], $matches)
                    ||
                preg_match('/^object_localized_([0-9]+)_[A-z]{2}_[A-z]{2}$/', $view['tablename'], $matches)
            ) {
                $should_be_view = true;
                $class_id = $matches[1];
            }

            if($should_be_view)
            {
                echo "Found: [" . $view['ttype'] . "] " . $view['tablename'] . ": ";

                // TODO grab class name from ID and check :
                // if($classes && !in_array($class, $classes)) continue;

                if($view['ttype'] == 'VIEW') {
                    $this->db->query('DROP VIEW IF EXISTS ' . $this->db->quoteIdentifier($view['fulltablename']))->execute();
                }
                elseif($view['ttype'] == 'BASE TABLE') {
                    $this->db->query('DROP TABLE IF EXISTS ' . $this->db->quoteIdentifier($view['fulltablename']))->execute();
                }
            }
            else
            {
                //echo "skipping";
            }
            echo "\n";

        }
    }

    /**
     * Imports classes from json files
     */
    public function import($classes = false) {

        foreach (glob($this->path . "*.json") as $filename) {
            // check if class needs to be skipped ($classes)
            $class = substr($filename, strpos($filename, 'class_'));
            $class = str_replace('class_', '', $class);
            $class = str_replace('.json', '', $class);
            if($classes && !in_array($class, $classes)) continue;

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