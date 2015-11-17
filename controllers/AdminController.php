<?php


class Deployment_AdminController extends \Pimcore\Controller\Action\Admin {
    
    public function indexAction () {

        // reachable via http://your.domain/plugin/YouweDeploy/index/index

    }
    public function settingAction()
    {
        $sql = "SHOW TABLES";
        $db = \Pimcore\Resource\Mysql::get();
        $result =  $db->fetchAssoc($sql);
        foreach($result as $k => &$r)
        {
            if(substr($k,0,6)==='_data_') unset($result[$k]);
        }
        $this->view->tables = $result;
        $config = \Deployment\Plugin::getConfig()->toArray();
        if(!isset($config['tablesToCopy']['table']))
        {
            $config['tablesToCopy']['table'] = array();
        }
        foreach ($config as $name => $conf) {
            $this->view->{$name} = $conf;
        }

        // =======================

        $sql = "SELECT * FROM documents";
        $this->view->docs = $db->fetchAssoc($sql);
        foreach($this->view->docs as &$doc)
        {
            // look up current migration setting by doc id
            $mode = \Deployment\DeploymentDataMigrationManager::getModeByCnameAndId('documents', $doc['id']);
            $doc['migration_mode'] = $mode;
        }
    }

    public function saveSettingAction()
    {
        $tablesToCopy = $this->getParam('tablesToCopy');
        $config = \Deployment\Plugin::getConfig();
        $config->tablesToCopy = $tablesToCopy;
        \Deployment\Plugin::setConfig($config);
        $this->forward("setting");
    }

    public function saveKeysAction()
    {
        $docs = $this->getParam('doc');

        // Save the settings to the DeploymentDataMigration table + generate unique keys
        var_dump($docs);
        // array (size=3)
        //          1 => string 'default' (length=7)
        //          7 => string 'default' (length=7)
        //          8 => string 'default' (length=7)
        die();
        // @todo: fix the strange no-response form submit

        foreach($docs as $docid => &$mode)
        {
            \Deployment\DeploymentDataMigrationManager::setModeByCnameAndId('documents', $docid, null, null, $mode);
        }

        die();

        $this->forward("setting");
    }



}
