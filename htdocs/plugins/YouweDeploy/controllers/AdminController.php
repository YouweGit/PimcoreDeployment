<?php


class YouweDeploy_AdminController extends Pimcore_Controller_Action_Admin {
    
    public function indexAction () {

        // reachable via http://your.domain/plugin/YouweDeploy/index/index

    }
    public function settingAction()
    {
        $sql = "SHOW TABLES";
        $db = Pimcore_Resource_Mysql::get();
        $result =  $db->fetchAssoc($sql);
        foreach($result as $k => &$r)
        {
            if(substr($k,0,6)==='_data_') unset($result[$k]);
        }
        $this->view->tables = $result;
        $config = YouweDeploy_Plugin::getConfig()->toArray();
        foreach ($config as $name => $conf) {
            $this->view->{$name} = $conf;
        }

    }

    public function saveSettingAction()
    {
        $tablesToCopy = $this->getParam('tablesToCopy');
        $config = YouweDeploy_Plugin::getConfig();
        $config->tablesToCopy = $tablesToCopy;
        YouweDeploy_Plugin::setConfig($config);
        $this->forward("setting");
    }
}
