<?php

namespace Deployment;

abstract class DAbstract {
    /**
     * @var $localDBName string
     */
    protected $localDBName;
    /**
     * @var mixed|Zend_Db_Adapter_Abstract
     */
    protected $adapter;

    protected $config;
    /**
     *  Set up local database
     */
    public function __construct()
    {
        $this->config = YouweDeploy_Plugin::getConfig();

        $this->adapter = Pimcore_Resource::get();
        $this->dbName = $this->adapter->getConfig()['dbname'];
    }

    /**
     *  TODO Not sure if we will implement this
     */
    public function doWarmupCache()
    {
        Pimcore_Cache_Tool_Warming::documents();
        Pimcore_Cache_Tool_Warming::assets();
        Pimcore_Cache_Tool_Warming::objects();

    }

    /**
     *  TODO It just does'nt work for now
     */
    public function activateMaintenanceMode()
    {
        Pimcore_Tool_Admin::activateMaintenanceMode("cache-warming-dummy-session-id");
        Pimcore_Cache_Tool_Warming::setTimoutBetweenIteration(0);
    }

    /**
     *   TODO It just does'nt work for now
     */
    public function disableMaintenanceMode()
    {
        Pimcore_Tool_Admin::deactivateMaintenanceMode();
    }
}