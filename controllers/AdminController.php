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
    }

    public function saveSettingAction()
    {
        $tablesToCopy = $this->getParam('tablesToCopy');
        $config = \Deployment\Plugin::getConfig();
        $config->tablesToCopy = $tablesToCopy;
        \Deployment\Plugin::setConfig($config);
        $this->forward("setting");
    }
}
