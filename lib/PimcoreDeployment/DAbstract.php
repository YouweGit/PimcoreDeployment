<?php

namespace PimcoreDeployment;

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
        $this->config = \PimcoreDeployment\Plugin::getConfig();

        $this->adapter = \Pimcore\Resource::get();
        $this->dbName = $this->adapter->getConfig()['dbname'];
    }

}