<?php


class PimcoreDeployment_AdminController extends \Pimcore\Controller\Action\Admin {
    
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
        $config = \PimcoreDeployment\Plugin::getConfig()->toArray();
        if(!isset($config['staticDataTables']['table']))
        {
            $config['staticDataTables']['table'] = array();
        }
        foreach ($config as $name => $conf) {
            $this->view->{$name} = $conf;
        }
    }

    public function saveSettingAction()
    {
        $staticDataTables = $this->getParam('staticDataTables');
        $config = \PimcoreDeployment\Plugin::getConfig();
        $config->staticDataTables = $staticDataTables;
        \PimcoreDeployment\Plugin::setConfig($config);
        sleep(10);
//        die();
        $this->redirect("plugin/PimcoreDeployment/admin/setting?time=" . time());
//        $this->forward('setting', null, null, ['time' => time()]);
    }

    public function saveKeysAction()
    {
        $docs = $this->getParam('doc');

        // Save the settings to the DeploymentDataMigration table + generate unique keys
//        var_dump($docs);
        // array (size=3)
        //          1 => string 'default' (length=7)
        //          7 => string 'default' (length=7)
        //          8 => string 'default' (length=7)


        foreach($docs as $docid => &$mode)
        {
            \PimcoreDeployment\DeploymentDataMigrationManager::setModeByCnameAndId('documents', $docid, null, null, $mode);
        }

        $this->forward("setting");
    }



}
