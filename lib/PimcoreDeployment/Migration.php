<?php

namespace Deployment;

class Migration extends \Deployment\DAbstract
{
    /**
     * @var string
     */
    private $backupPath = '/var/Plugins/PimcoreDeployment/migration/';
    /**
     * @var string
     */
    private $dumpFileName = 'staticdata.zip';
    /**
     * @var Zend_Config
     */
    public $config;

    /**
     * Tables to copy data
     * @var array
     *
     * DEFAULT NOTHING - because data could get overwritten
     */
    private $staticDataTables = array(
    );

    /**
     * Contains migration sql queries
     * @var string
     */
    private $migrationSqlFile = 'migration.sql';

    public function __construct()
    {
        parent::__construct();
        $this->staticDataTables = $this->config->staticDataTables->table ? is_string($this->config->staticDataTables->table) ? array($this->config->staticDataTables->table) : $this->config->staticDataTables->table->toArray() : array();

        $this->backupPath = PIMCORE_WEBSITE_PATH . $this->backupPath;
        \Pimcore\File::mkdir($this->backupPath);
    }

    /**
     * Creates migration
     */
    public function create()
    {
        $this->dumpTables();
        $this->finish();
    }

    /**
     * Zip all migration files
     */
    private function finish()
    {
        $fullPathMigrationFile = $this->backupPath . $this->migrationSqlFile;
        if(is_file($fullPathMigrationFile)){
            $zipFile = $this->backupPath . $this->dumpFileName;
            $zip = new \ZipArchive();
            $zip->open($zipFile, \ZipArchive::OVERWRITE | \ZipArchive::CREATE);
            $zip->addFile($fullPathMigrationFile, $this->migrationSqlFile);
            $zip->close();
            @unlink($fullPathMigrationFile);
        }
    }

    /**
     * Creates a (tables) dump file
     * @throws Zend_Exception
     */
    public function dumpTables()
    {
        $cnf = \Pimcore\Config::getSystemConfig();
        $return_var = NULL;
        $output = NULL;
        $u = $cnf->database->params->username;
        $p = $cnf->database->params->password;
        $db = $cnf->database->params->dbname;
        $h = $cnf->database->params->host;
        $file = $this->backupPath . $this->migrationSqlFile;
        $mysqlVersion = $this->adapter->getServerVersion();
        $purged = '';
        if (version_compare($mysqlVersion, '5.6.0', '>=')) {
            $purged = '--set-gtid-purged=OFF';
        }

        var_dump($this->staticDataTables);

        $tables = implode(' ', $this->staticDataTables);
        if(count($this->staticDataTables) > 0) {
            $command = "mysqldump $purged --add-drop-table -u$u -p$p -h$h $db $tables | sed -e '/DEFINER/d' > $file";
        }
        else {
            $command = "touch $file";
        }

        exec($command, $output, $return_var);
    }

    /**
     * Migrate migration
     * @throws Exception
     * @throws Zend_Exception
     */
    public function migrate()
    {
        $cnf = \Pimcore\Config::getSystemConfig();

        $u = $cnf->database->params->username;
        $p = $cnf->database->params->password;
        $db = $cnf->database->params->dbname;
        $h = $cnf->database->params->host;

        $zipFile = $this->backupPath . $this->dumpFileName;

        $command = "unzip -p $zipFile | mysql -u$u -p$p -h$h $db";
        print "EXEC: $command \n";
        exec($command, $output, $return_var);
    }
}
