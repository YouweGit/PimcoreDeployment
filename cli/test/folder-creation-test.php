<?php

require_once 'bootstrap.php';
if(\Pimcore\Version::getRevision() <= 3543) {   // only pimcore 3
    Zend_Session::start();
}

if(\Pimcore\Version::getRevision() < 3932){ // less then pimcore 4.3.0
    throw new \Exception('Pimcore version not supported. Please downgrade Deployment plugin to 0.2.*');
}

//this is optional, memory limit could be increased further (pimcore default is 1024M)
ini_set('memory_limit', '1024M');
ini_set("max_execution_time", "-1");

$time = microtime(true);
$memory = memory_get_usage();

//execute in admin mode
define("PIMCORE_ADMIN", true);


$newfolder = \Pimcore\Model\Object\Service::createFolderByPath('/test123');
var_dump($newfolder->getId());

$newfolder = \Pimcore\Model\Object\Service::createFolderByPath('/test123/testing/multiple/levels/deep');
var_dump($newfolder->getId());






