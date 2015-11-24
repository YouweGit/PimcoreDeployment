<?php

namespace Deployment;

use Pimcore\Model\Object\DeploymentDataMigration;

class DeploymentDataMigrationManager {

//    public $path;
//    private $db;

    function __construct() {
//        $this->db = \Pimcore\Resource::get();
//        $this->path = PIMCORE_WEBSITE_PATH . '/var/deployment/migration/classes/';
    }

    public static function getModeByCnameAndId($cname, $cid, $cid2 = null, $cid3 = null) {
        $mode = 'default'; // when nothing is found

        $deployment_data_object = self::retrieveObjectByCnameAndId($cname, $cid, $cid2, $cid3);

        if($deployment_data_object)
        {
            $mode = $deployment_data_object->getMode();
        }

        return $mode;
    }

    public static function setModeByCnameAndId($cname, $cid, $cid2 = null, $cid3 = null, $mode)
    {
        $deployment_data_object = self::retrieveObjectByCnameAndId($cname, $cid, $cid2, $cid3);
//        var_dump($deployment_data_object);
//        die();

        if(!$deployment_data_object) {

            // Create a new object (all related object migration keys will be created by the CLI)
            $parent_id_of_new_object = \PathManager_PathManager::getOrCreateSubfolder('/deployment', 'datamigration');

            $deployment_data_object = new DeploymentDataMigration();
            $deployment_data_object->setCName($cname);
            $deployment_data_object->setMode($mode);
            $deployment_data_object->setCId($cid);
            $deployment_data_object->setTimestamp(new \Pimcore\Date());
            $deployment_data_object->setMigrationKey(self::generateUniqueMigrationKey());
            $deployment_data_object->setParentId($parent_id_of_new_object);

            if($cid2) $deployment_data_object->setCId2($cid2);
            if($cid3) $deployment_data_object->setCId2($cid3);
            $deployment_data_object->setKey($cname . '-' . $cid . '-' . $cid2 . '-' . $cid3);
            $deployment_data_object->save();
        }
    }

    public static function retrieveObjectByCnameAndId($cname, $cid, $cid2 = null, $cid3 = null)
    {
        $list = new DeploymentDataMigration\Listing();
        $list->addConditionParam('CName = ?', $cname);
        $list->addConditionParam('CId = ?', $cid);
        if ($cid2) $list->addConditionParam('CId2 = ?', $cid2);
        if ($cid3) $list->addConditionParam('CId3 = ?', $cid3);
        $deployment_data_object = $list->current();
        return $deployment_data_object;
    }

    public static function generateUniqueMigrationKey()
    {
        while(!self::idIsUnique($uid = uniqid(rand(), true)))
        {
            // loop until we get a unique id
        }
        return $uid;
    }

    public static function idIsUnique($uid)
    {
        if(!$uid) return false;
        $deployment_data_object = DeploymentDataMigration::getByMigrationKey($uid);
        if(!$deployment_data_object->count()) return true;
        return false;
    }


}