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

        $list = new DeploymentDataMigration\Listing();
        $list->addConditionParam('CName', $cname);
        $list->addConditionParam('CId', $cid);
        if($cid2) $list->addConditionParam('CId2', $cid2);
        if($cid3) $list->addConditionParam('CId3', $cid3);
        $deployment_data_object = $list->current();

        if($deployment_data_object)
        {
            $mode = $deployment_data_object->getMode();
        }

        return $mode;
    }

}