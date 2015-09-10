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

$actionen = ['migrate', 'create', 'wipe', 'cache-clear', 'insert-propel-etim', 'load-initial-fixtures', 'load-initial-dev-fixtures', 'import-definition', 'export-definition'];

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


$migration = new YouweDeploy_Migration();
switch ($opts->action) {
    case 'migrate':
        $migration->migrate();
        break;
    case 'create':
        $migration->create();
        print "Migration has been created \n";
        break;
    case 'load-initial-fixtures':
        $migration->insertInitialData();
        print "Initial fixtures load task done \n";
        break;
    case 'insert-propel-etim':
        $migration->insertPropelEtim();
        print "Initial fixtures load task done \n";
        break;
    case 'load-initial-dev-fixtures':
        $migration->insertInitialDevFixtures();
        print "Initial DEV fixtures load task done \n";
        break;
    case 'wipe':
        print 'Dropping all tables and views in 3';
        sleep(3);
        $migration->dropAllTablesAndViews();
        print "Dropped all tables and views (BEWARE OF ERROR NOTICES) \n";
        break;
    case 'cache-clear':
        $clearCache = new YouweDeploy_Cache();
        $clearCache->doClearCache();
        break;

    case 'import-definition':
        $def = new YouweDeploy_Definition();
        $def->import();
        break;
    case 'export-definition':
        $def = new YouweDeploy_Definition();
        $def->export();
        break;
}
