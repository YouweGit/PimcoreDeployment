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

$actionen = [
    'import-definition',
    'export-definition',
    'import-staticdata',
    'export-staticdata',
    'import-content',
    'export-content',
    'drop-views',
    'clear-classes'];

try {
    $opts = new Zend_Console_Getopt(array(
        'action|a=s' => '',
        'classes|c-s' => '',
        'classids|i-s' => '',
        'ignore-maintenance-mode' => 'forces the script execution even when the maintenance mode is activated',
    ));
    $opts->parse();

    if (!isset($opts->action) || !in_array($opts->action, $actionen)) {
        throw new Exception(
            "\n" .
            "USAGE INSTRUCTIONS" .
            "\n" .
            'Action parameter should be one of the following:' . "\n" .
            'import-definition  : re-create pimcore classes from json definitions' . "\n" .
            'export-definition  : re-create json definitions from pimcore classes'. "\n" .
            'import-staticdata  : re-create selected tables from static data dump' . "\n" .
            'export-staticdata  : re-create static data dump from selected tables'. "\n" .
            'import-content     : update content on server' . "\n" .
            'export-content     : export selected content on local/dev'. "\n" .
            'drop-views         : drop views or tables that should be views' . "\n" .
            'clear-classes      : empty the classes table' . "\n" .
            "\n" .
            'Optional classes parameter may list the class names comma seperated.' . "\n" .
            "\n" .
            'Example:' . "\n" .
            'php migration.php -a export-definition -c product,person' . "\n" .
            "\n" .
            'Note: for drop-views you can also use class ids:' . "\n" .
            'php migration.php -a drop-views -i 2,5,6' . "\n" .
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

$classes = ( ($opts->classes !== true && $opts->classes !== NULL) ? explode(',', $opts->classes) : false );
$classids = ( ($opts->classids !== true && $opts->classids !== NULL) ? explode(',', $opts->classids) : false );

//echo "Classes: " . var_export($classes,1) . "\n";

Version::disable();
Pimcore_Model_Cache::disable();

$plugin = "Deployment";
if (!\Pimcore\ExtensionManager::isEnabled('plugin', $plugin)) {
    echo "\nEnabling plugin on the fly.\n";
    \Pimcore\ExtensionManager::enable('plugin', $plugin);
    $command = 'php ' . implode(' ', $argv);
    echo "\nRe-executing command: [ $command ] \n";
    echo shell_exec($command);
    die();
}

$def = new \Deployment\Definition();
$mig = new \Deployment\Migration();
$con = new \Deployment\Content();

switch ($opts->action) {
    case 'clear-classes':
        $def->clearClasses($classes);
        break;
    case 'drop-views':
        $def->dropViews($classes, $classids);
        break;
    case 'import-definition':
        $def->import($classes);
        break;
    case 'export-definition':
        $def->export($classes);
        break;
    case 'import-staticdata':
        $mig->migrate();
        break;
    case 'export-staticdata':
        $mig->create();
        break;
    case 'import-content':
        $con->importContent();
        break;
    case 'export-content':
        $con->exportContent();
        break;

}


