<?php
/**
 * User: Manea Eugen
 * Email: e.manea@youwe.nl
 * 7/4/14 12:26 PM
 */


require_once 'bootstrap.php';
Zend_Session::start();

//this is optional, memory limit could be increased further (pimcore default is 1024M)
ini_set('memory_limit', '1024M');
ini_set("max_execution_time", "-1");

$time = microtime(true);
$memory = memory_get_usage();

//execute in admin mode
define("PIMCORE_ADMIN", true);

$actionen = ['import-definition', 'export-definition'];

try {
    $opts = new Zend_Console_Getopt(array(
        'action|a=s' => '',
        'ignore-maintenance-mode' => 'forces the script execution even when the maintenance mode is activated',
    ));
    $opts->parse();

    //action should be resync, backup or cache-clear
    //defaults to resync


    if (!isset($opts->action) || !in_array($opts->action, $actionen)) {
        throw new Exception('Action parameter should be ' . var_export($actionen,1));
    }

} catch (Zend_Console_Getopt_Exception $e) {
    echo $e->getUsageMessage() . "\n";
    exit(1);
} catch (Exception $e) {
    echo $e->getMessage() . "\n";
    exit(1);
}

Version::disable();
Pimcore_Model_Cache::disable();

$def = new \Deployment\Definition();

switch ($opts->action) {
    case 'import-definition':
        $def->import();
        break;
    case 'export-definition':
        $def->export();
        break;
}
