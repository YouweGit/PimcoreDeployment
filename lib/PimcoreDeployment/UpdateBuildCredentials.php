<?php


namespace PimcoreDeployment;

use Pimcore\Config;


/**
 * Class UpdateMysqlCredentials
 * Imports mysql credentials from an ini file with this structure and merges it with existing configuration
 * mysql_hostname=[HOSTNAME]
 * mysql_port=[PORT]
 * mysql_database=[DATABASE_NAME]
 * mysql_user=[DATABASE_USERNAME]
 * mysql_password=[DATABASE_PASSWORD]
 */
class UpdateBuildCredentials
{
    /** @var  \Zend_Config_Ini */
    private $iniFile;

    /**
     * @param string $pathToIniFile
     * @throws \Zend_Config_Exception Zend has build in validation if it cannot read and parse the file
     */
    public function __construct($pathToIniFile)
    {
        $this->iniFile = new \Zend_Config_Ini($pathToIniFile, null, ['allowModifications' => false]);
    }

    public function updateBuildFile()
    {

        // Get data from ini file
        $hostname = $this->iniFile->get('mysql_hostname');
        $port = $this->iniFile->get('mysql_port');
        $database = $this->iniFile->get('mysql_database');
        $user = $this->iniFile->get('mysql_user');
        $password = $this->iniFile->get('mysql_password');

        // Validate the content of the ini file
        if (!$hostname || !$port || !$database || !$user || !$password) {
            throw new \InvalidArgumentException('The ini file provided has invalid structure or missing data');
        }

        /*
         * /data/projects/hotbath-pimcore/tools/build/local.cfg
         *
         * # database 
         *
         * DBHost=127.0.0.1 
         * DBName=hotbath 
         * DBUser=root 
         * DBPassword=root 
         * DBPort=3306
         *
         */

        // Get and validate system.php file
        $file = PIMCORE_DOCUMENT_ROOT . '/tools/build/local.cfg';
        if (!file_exists($file) || !is_readable($file) || !is_writable($file)) {
            throw new \InvalidArgumentException('Config file does not exist at ' . $file);
        }

        $data = "# database\n
DBHost=$hostname\n
DBName=$database\n
DBUser=$user \n
DBPassword=$password\n 
DBPort=$port\n
";

        file_put_contents($file, $data);

    }
}