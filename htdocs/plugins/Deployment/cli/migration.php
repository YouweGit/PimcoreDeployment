<?php

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
        'classes|c-s' => '',
        'ignore-maintenance-mode' => 'forces the script execution even when the maintenance mode is activated',
    ));
    $opts->parse();

    if (!isset($opts->action) || !in_array($opts->action, $actionen)) {
        throw new Exception(
            "\n" .
            'Action parameter should be import-definition or export-definition.' . "\n" .
            'Classes parameter should list the classes comma seperated.' . "\n" .
            'Example:' . "\n" .
            'php migration.php -a export-definition -c product,person' . "\n" .
            '');
    }

} catch (Zend_Console_Getopt_Exception $e) {
    echo $e->getUsageMessage() . "\n";
    exit(1);
} catch (Exception $e) {
    echo $e->getMessage() . "\n";
    exit(1);
}

//echo "Action:  " . $opts->action . "\n";
//echo "Classes: " . var_export($opts->classes,1) . "\n";

$classes = ( $opts->classes !== true ? explode(',', $opts->classes) : false );

//echo "Classes: " . var_export($classes,1) . "\n";

Version::disable();
Pimcore_Model_Cache::disable();

$def = new \Deployment\Definition();

switch ($opts->action) {
    case 'import-definition':
        $def->import($classes);
        break;
    case 'export-definition':
        $def->export($classes);
        break;
}


