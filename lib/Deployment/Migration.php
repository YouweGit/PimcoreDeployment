<?php

namespace Deployment;

class Migration extends \Deployment\DAbstract
{
    /**
     * @var string
     */
    private $backupPath = '/var/deployment/migration/';
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
    private $tablesToCopy = array(
//        'classes',
//        'redirects',
//        'staticroutes',
////        'translations_admin',
////        'translations_website',
//        'users_permission_definitions',
//        'documents',
//        'documents_page',
//        'documents_email',
//        'documents_snippet'
    );

    /**
     * Contains migration sql queries
     * @var string
     */
    private $migrationSqlFile = 'migration.sql';

    /**
     * Contains sql queries to create views
     * @var string
     */
    private $viewsSqlFile = 'views.sql';

    /**
     * Contains db params(host,db,username,password)
     * @var string
     */
    private $migrationCreatedDB = 'db.xml';

    function __construct()
    {
        parent::__construct();
        $this->tablesToCopy = $this->config->staticDataTables->table ? $this->config->staticDataTables->table->toArray() : array();

        $this->backupPath = PIMCORE_WEBSITE_PATH . $this->backupPath;
//        $this->backupPath = PIMCORE_WEBSITE_PATH . $this->config->filePath;
//        $this->dumpFileName = $this->config->dumpFileName;
        \Pimcore\File::mkdir($this->backupPath);
    }

    /**
     * Creates migration
     */
    public function create()
    {
        $this->dumpTables();
//        $this->dumpViews();
//        $this->dumpMigrationTable();
//        $this->createMigrationDatabaseConfig();

        $this->finish();
    }

    /**
     * Zip all migration files
     */
    private function finish()
    {
        $zipFile = $this->backupPath . $this->dumpFileName;
        $zip = new \ZipArchive();
        $zip->open($zipFile, \ZIPARCHIVE::OVERWRITE);
        $zip->addFile($this->backupPath . $this->migrationSqlFile, $this->migrationSqlFile);
//        $zip->addFile($this->backupPath . $this->viewsSqlFile, $this->viewsSqlFile);
//        $zip->addFile($this->backupPath . $this->migrationCreatedDB, $this->migrationCreatedDB);
        $zip->close();
        @unlink($this->backupPath . $this->migrationSqlFile);
//        @unlink($this->backupPath . $this->viewsSqlFile);
//        @unlink($this->backupPath . $this->migrationCreatedDB);
    }

    /**
     * Creates database config file
     * @throws Zend_Config_Exception
     * @throws Zend_Exception
     */
//    private function createMigrationDatabaseConfig()
//    {
//        $conf = Zend_Registry::get('systemConfig')->database->params;
//        $writer = new Zend_Config_Writer_Xml();
//        $writer->write($this->backupPath . $this->migrationCreatedDB, $conf);
//    }

    /**
     * Gets migration database params
     * @return array
     */
//    private function getMigrationCreatedDatabaseConfig()
//    {
//        $config = array();
//        $zipFile = $this->backupPath . $this->dumpFileName;
//        $zip = new ZipArchive();
//        if ($zip->open($zipFile) === TRUE) {
//            $migrationCreatedDB = $zip->getFromName($this->migrationCreatedDB);
//            $configXml = new Zend_Config_Xml($migrationCreatedDB, null, false);
//            $config = $configXml->toArray();
//            $zip->close();
//        }
//
//        return $config;
//    }

    /**
     * Creates a (tables) dump file
     * @throws Zend_Exception
     */
    public function dumpTables()
    {

        $cnf = new \Zend_Config_Xml(PIMCORE_CONFIGURATION_DIRECTORY . '/system.xml');

        // classes redirects staticroutes translations_admin translations_website
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

//        $command = "mysqldump $purged --skip-add-drop-table --no-data ";
//        $views = $this->getViews();
//        foreach ($views as $view) {
//            $command .= "--ignore-table=$this->dbName.$view ";
//        }
//        $command .= "--ignore-table=$this->dbName.migration_tables ";
//        $command .= "--ignore-table=$this->dbName.migration_columns ";
//
//        $command .= "-u$u -p$p -h$h $db | sed -e '/DEFINER/d' | sed 's/CREATE TABLE/CREATE TABLE IF NOT EXISTS/g' |  sed 's/ AUTO_INCREMENT=[0-9]*\\b//' > $file";
//        exec($command, $output, $return_var);

        var_dump($this->tablesToCopy);

        $tables = implode(' ', $this->tablesToCopy);
        if(count($this->tablesToCopy) > 0) {
            $command = "mysqldump $purged --add-drop-table -u$u -p$p -h$h $db $tables | sed -e '/DEFINER/d' > $file";
        }
        else {
            $command = "touch $file";
        }

        var_dump($command);

        exec($command, $output, $return_var);

        // remove propel tables
//        $fd = file_get_contents($file);
//        $pattern = '/\n(?:DROP|CREATE|ALTER|RENAME)[^`]+`(?:_data_|propel_migration)[^;]+;\s/';
//        $fd = preg_replace($pattern, '', $fd);
//        file_put_contents($file, $fd);
    }

    /**
     * Creates (views) dump file
     */
//    public function dumpViews()
//    {
//        $viewsQuery = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$this->dbName' " .
//            "AND TABLE_TYPE = 'VIEW' AND TABLE_NAME NOT LIKE '_data_%'";
//
//        $views = $this->adapter->fetchAll($viewsQuery);
//
//        if ($views) {
//            $removeViews = "DROP VIEW IF EXISTS " . implode(', ', array_map(function ($entry) {
//                    return "{$entry['TABLE_NAME']}";
//                }, $views));
//            $dump = $removeViews . "; \n";
//
//            $removeViews = "DROP TABLE IF EXISTS " . implode(', ', array_map(function ($entry) {
//                    return "{$entry['TABLE_NAME']}";
//                }, $views));
//            $dump .= $removeViews . "; \n";
//
//            file_put_contents($this->backupPath . $this->migrationSqlFile, $dump, FILE_APPEND);
//
//            $viewQueries = '';
//            foreach ($views as $view) {
//                try {
//                    $viewData = $this->adapter->fetchRow("SHOW CREATE VIEW {$view['TABLE_NAME']}");
//                    $viewData = preg_replace('/DEFINER=.*?DEFINER /', '', $viewData["Create View"]);
//                    $viewQueries .= "" . $viewData . "; \n";
//                } catch (Exception $e) {
//                    echo $e->getMessage();
//                    exit(1);
//                }
//            }
//
//            file_put_contents($this->backupPath . $this->viewsSqlFile, $viewQueries);
//        }
//    }

    /**
     * Creates migration table within other tables creation
     */
//    public function dumpMigrationTable()
//    {
//        $migrationTable = "DROP TABLE IF EXISTS `migration_tables`;
//                            CREATE TABLE `migration_tables` (
//                              `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
//                              `table` varchar(255) DEFAULT NULL,
//                              `field` varchar(255) DEFAULT NULL,
//                              `type` varchar(255) DEFAULT NULL,
//                              `null` varchar(5) DEFAULT NULL,
//                              `key` varchar(50) DEFAULT NULL,
//                              `default` varchar(255) DEFAULT NULL,
//                              `extra` varchar(255) DEFAULT NULL,
//                              PRIMARY KEY (`id`)
//                            );";
//
//        $views = $this->getViews();
//        $rows = array();
//        $tables = $definition = $this->adapter->fetchAll("SHOW tables");
//        foreach ($tables as $t) {
//            $t = array_values($t);
//            $table = $t[0];
//            if (in_array($table, $views)) {
//                continue;
//            }
//
//            $definition = $this->adapter->fetchAll("DESCRIBE $table");
//            foreach ($definition as $field) {
//                $row['id'] = 0;
//                $row['table'] = $table;
//                $row['field'] = $field['Field'];
//                $row['type'] = $field['Type'];
//                $row['null'] = $field['Null'];
//                $row['key'] = $field['Key'];
//                $row['default'] = $field['Default'];
//                $row['extra'] = $field['extra'];
//                $rows[] = $row;
//            }
//        }
//        $tableInsertQuery = $this->createInsertQuery('migration_tables', $rows);
//
//        $dump = $migrationTable . "\n";
//        $dump .= $tableInsertQuery . "\n";
//
//        file_put_contents($this->backupPath . $this->migrationSqlFile, $dump, FILE_APPEND);
//    }

    /**
     * Migrate migration
     * @throws Exception
     * @throws Zend_Exception
     */
    public function migrate()
    {
//        $this->install();

        $cnf = new \Zend_Config_Xml(PIMCORE_CONFIGURATION_DIRECTORY . '/system.xml');

        $u = $cnf->database->params->username;
        $p = $cnf->database->params->password;
        $db = $cnf->database->params->dbname;
        $h = $cnf->database->params->host;

//        $createdFrom = $this->getMigrationCreatedDatabaseConfig();
//        if (!empty($createdFrom) && $createdFrom['host'] == $h && $createdFrom['dbname'] == $db && $createdFrom['username'] == $u && $createdFrom['password'] == $p) {
//            throw new Exception("The migration file has been created from same database. Nothing to migrate!");
//        }
//
//        /// DROP THE VIEWS they will be recreated by next command
//        $viewsQuery = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$this->dbName' " .
//            "AND TABLE_TYPE = 'VIEW' ;\n";
//
//        try {
//            $views = $this->adapter->fetchAll($viewsQuery);
//        } catch (Exception $e) {
//            print $e->getMessage();
//        }
//
//        if ($views) {
//            $removeViews = "DROP VIEW IF EXISTS " . implode(', ', array_map(function ($entry) {
//                    return $entry['TABLE_NAME'];
//                }, $views)) . ";\n";
//
//            $this->executeQuery($removeViews);
//
//            $removeViews = preg_replace('/DROP VIEW/', 'DROP TABLE', $removeViews);
//            $this->executeQuery($removeViews);
//        }
//
//        $return_var = NULL;
//        $output = NULL;
//
        $zipFile = $this->backupPath . $this->dumpFileName;
//
//        // Create/Update tables  -x =>  exclude files that follow (in xlist)
        $command = "unzip -p $zipFile -x $this->viewsSqlFile $this->migrationCreatedDB | mysql -u$u -p$p -h$h $db";
        print "EXEC: $command \n";
        exec($command, $output, $return_var);
//
//        // define placeholder so that addMissingColumns knows where to add the class id
//        // with  sprintf($table_prefix, $class['id']);
//        $tablePrefixesToCheck = array(
//            'object_localized_data_%s', 'object_query_%s', 'object_store_%s', 'object_relations_%s'
//        );
//        $config = new Zend_Config_Xml(PIMCORE_CONFIGURATION_SYSTEM);
//        if ($config && isset($config->general) && isset($config->general->validLanguages)) {
//            $languages = explode(',', $config->general->validLanguages);
//            foreach ($languages as $language) {
//                array_push($tablePrefixesToCheck, 'object_localized_query_%s_' . $language);
//            }
//        }
//
//        foreach ($tablePrefixesToCheck as $tablePrefix) {
//            try {
//                $this->alterTable($tablePrefix);
//            } catch (Exception $e) {
//                print $e->getMessage() . "\n";
//            }
//        }

        // Create views -x =>  exclude files that follow (in xlist)
//        $command = "unzip -p $zipFile -x $this->migrationSqlFile $this->migrationCreatedDB | mysql -u$u -p$p -h$h $db ";
//        print "EXEC: $command \n";
//        exec($command, $output, $return_var);

    }

    // if you use migrations to INITIALIZE your database for the first time from nothing
    // you must run this function (from cli) to insert:
    // - root objects
    // - admin user
//    public function insertInitialData()
//    {
//        // insert a admin user
//        $this->createAdminUser();
//        $this->insertObjects();
//    }


    /**
     * Creates pimcore admin user
     * @throws Exception
     * @throws Zend_Exception
     */
//    private function createAdminUser()
//    {
//        // create pimcore system user with id 0
//        $sql = "INSERT INTO users(id, parentId, name, admin, active) VALUES (0, 0, 'system', 1, 1)";
//        $this->executeQuery($sql);
//
//        // create first admin (admin)
//        $username = $this->config->admin->username;
//        $email = $this->config->admin->email;
//        $password = Pimcore_Tool_Authentication::getPasswordHash($username, $this->config->admin->password);
//        $sql = "INSERT INTO users(id, parentId, name, password, admin, active, email) VALUES (1, 0, '$username', '$password', 1, 1, '$email')";
//        $this->executeQuery($sql);
//
//        // create second admin (youwe/yasar)
//        $username = $this->config->admin2->username;
//        $email = $this->config->admin2->email;
//        $password = Pimcore_Tool_Authentication::getPasswordHash($username, $this->config->admin2->password);
//        $sql = "INSERT INTO users(id, parentId, name, password, admin, active, email) VALUES (2, 0, '$username', '$password', 1, 1, '$email')";
//        $this->executeQuery($sql);
//
//    }

    /**
     * Inserts first object and first asset
     */
//    private function insertObjects()
//    {
//        $sql = "INSERT INTO objects(o_id, o_parentId, o_type, o_key, o_path, o_index, o_published) VALUES (1, 0, 'folder', '', '/', 999999, 1)";
//        $this->executeQuery($sql);
//
//        $time = time();
//        $sql = "INSERT INTO assets(id, parentId, type, filename, path, userOwner, creationDate) VALUES (1, 0, 'folder', '', '/', 1, $time)";
//        $this->executeQuery($sql);
//    }


    /**
     * @param $table_prefix
     */
//    private function alterTable($table_prefix)
//    {
//        // loop throw local classes so that we don't get errors on creating the view
//        $getClasses = "SELECT id FROM `$this->dbName`.classes ORDER BY id";
//
//        $classes = $this->adapter->fetchAll($getClasses);
//        //search in tables for extra columns
//        foreach ($classes as $class) {
//            $currentTable = sprintf($table_prefix, $class['id']);
//            //check if table exist in both classes
//            $sourceTable = $this->adapter->fetchAll("SELECT * FROM migration_tables WHERE `table` = '$currentTable' ");
//            $localTable = array();
//            try {
//                if ($this->createTable($currentTable)) {
//                    $localTable = $this->adapter->fetchAll("DESCRIBE $currentTable");
//                }
//            } catch (Exception $e) {
//                $localTable = array();
//                print $e->getMessage();
//            }
//
//
//            $localFields = array();
//            foreach ($localTable as $row) {
//                $lField = strtolower($row['Field']);
//                $localFields[$lField] = $row['Type'];
//            };
//            // if source server don't have that table ... then production server don't need it
//            // if production don't have that table it will be created on next command in deployment
//            if (!$sourceTable || !is_array($sourceTable) || empty($sourceTable) ||
//                !$localTable || !is_array($localTable) || empty($localTable)
//            ) {
//                continue;
//            }
//
//            $result = array_diff_assoc($sourceTable, $localTable);
//
//            $indexes = array();
//            $uniqueKeys = array();
//
//            // run only if both source and local have that table ...else mysqldump will create for us
//            foreach ($sourceTable as $column) {
//                $field = strtolower($column['field']);
//                $lType = isset($localFields[$field]) ? $localFields[$field] : null;
//
//                //print $field.'  =>  '.$column['type']." = $lType\n";
//                if ($column['key'] == 'MUL') {
//                    $indexes[] = $field;
//                } elseif ($column['key'] == 'UNI') {
//                    $uniqueKeys[] = $field;
//                }
//
//                if ($column['type'] == $lType) {
//                    continue;
//                }
//
//                $addColumnQuery = null;
//                $fieldDesc = $this->createFieldDescribe($column);
//                if (!$lType) {
//                    $addColumnQuery = "ALTER TABLE `$this->dbName`.$currentTable ADD $fieldDesc;";
//                } else if ($lType && $column['type'] != $lType) {
//                    $addColumnQuery = "ALTER TABLE `$this->dbName`.$currentTable MODIFY $fieldDesc;";
//                }
//                if ($addColumnQuery) {
//                    $this->executeQuery($addColumnQuery);
//                }
//            }
//
//            if (!empty($indexes)) {
//                foreach ($indexes as $index) {
//                    $indexQuery = "ALTER TABLE `$this->dbName`.$currentTable ADD INDEX `$index` (`$index`) ;";
//                    $this->executeQuery($indexQuery);
//                }
//            }
//
//            if (!empty($uniqueKeys)) {
//                foreach ($uniqueKeys as $index) {
//                    $indexQuery = "ALTER TABLE `$this->dbName`.$currentTable ADD UNIQUE KEY  `$index` (`$index`) ;";
//                    $this->executeQuery($indexQuery);
//                }
//            }
//
//        }
//    }

    /**
     * Executes query
     * @param string $query
     */
    private function executeQuery($query)
    {
        print $query . "\n";
        try {
            $this->adapter->query($query);
        } catch (Exception $e) {
            print $e->getMessage() . "\n";
        }
    }

    /**
     * Creates tables from migration
     * @param $name
     * @return bool
     */
//    private function createTable($name)
//    {
//        $sourceTable = $this->adapter->fetchAll("SELECT * FROM migration_tables WHERE `table` = '$name' ");
//        if (!$sourceTable) {
//            return false;
//        }
//
//        $sql = "CREATE TABLE IF NOT EXISTS `$name` (";
//        $fields = array();
//        $keys = array();
//        $indexes = array();
//        $uniqueKeys = array();
//        foreach ($sourceTable as $column) {
//            $fields[] = $this->createFieldDescribe($column);
//
//            $field = strtolower($column['field']);
//            if ($column['key'] == 'PRI') {
//                $keys[] = $field;
//            } elseif ($column['key'] == 'MUL') {
//                $indexes[] = $field;
//            } elseif ($column['key'] == 'UNI') {
//                $uniqueKeys[] = $field;
//            }
//
//        }
//
//        if (!empty($keys)) {
//            $fields[] = 'PRIMARY KEY (' . implode(',', $keys) . ')';
//        }
//
//        if (!empty($indexes)) {
//            foreach ($indexes as $index) {
//                $fields[] = "KEY `$index` (`$index`)";
//            }
//        }
//
//        if (!empty($uniqueKeys)) {
//            $fields[] = 'UNIQUE KEY (' . implode(',', $uniqueKeys) . ')';
//        }
//
//        $sql .= implode(',', $fields) . " );";
//        //print $sql . "\n";
//        $this->executeQuery($sql);
//        return true;
//    }

    /**
     * @param $column
     * @return string
     */
//    private function createFieldDescribe($column)
//    {
//        $type = $column['type'];
//        $field = $column['field'];
//        $null = $column['null'] == 'NO' ? 'NOT NULL' : '';
//        $default = $column['default'] != '' ? "DEFAULT '" . $column['default'] . "'" : '';
//        $extra = $column['extra'] != '' ? $column['extra'] : '';
//
//        return "`$field` $type $null $default $extra";
//    }

    /**
     * @param $tableName
     * @param $data
     * @return string
     */
//    private function createInsertQuery($tableName, $data)
//    {
//        $tableInsertQuery = 'INSERT INTO ' . $tableName . ' VALUES ("';
//        $tableInsertQuery .= implode('"), ("', array_map(function ($entry) {
//            return implode('", "', $entry);
//        }, $data));
//        $tableInsertQuery .= '");';
//        return $tableInsertQuery;
//    }

    /**
     * @return array
     */
//    private function getViews()
//    {
//        $views = array();
//        $tablePrefixes = array(
//            'object_%s'
//        );
//        $config = new Zend_Config_Xml(PIMCORE_CONFIGURATION_SYSTEM);
//        if ($config && isset($config->general) && isset($config->general->validLanguages)) {
//            $languages = explode(',', $config->general->validLanguages);
//            foreach ($languages as $language) {
//                $tablePrefixes[] = 'object_localized_%s_' . $language;
//            }
//        }
//
//        $classes = $this->adapter->fetchAll("SELECT id FROM `$this->dbName`.classes ORDER BY id");
//        foreach ($tablePrefixes as $tablePrefix) {
//            foreach ($classes as $class) {
//                $views[] = sprintf($tablePrefix, $class['id']);
//            }
//        }
//
//        return $views;
//    }


//    public static function dropAllTablesAndViews()
//    {
//
//        /** @var \Zend_Db_Adapter_Abstract $db */
//        $db = \Pimcore_Resource_Mysql::get();
//        $dbName = $db->getConfig()['dbname'];
//
//        $db->query('SET foreign_key_checks = 0;')->execute();
//        /*
//         * DROP TABLES
//         */
//        $tableQuery = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$dbName' " .
//            "AND TABLE_TYPE = 'BASE TABLE'";
//
//        $tables = $db->fetchAll($tableQuery);
//        $tableNames = implode(', ', array_map(function ($entry) {
//            return "{$entry['TABLE_NAME']}";
//        }, $tables));
//        if (!empty($tableNames)) {
//            $removeTableQuery = "DROP TABLE IF EXISTS $tableNames";
//            $db->query($removeTableQuery)->execute();
//        }
//
//
//        /*
//         * DROP VIEWS
//         */
//        $viewsQuery = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$dbName' " .
//            "AND TABLE_TYPE = 'VIEW'";
//
//        $views = $db->fetchAll($viewsQuery);
//        $viewName = implode(', ', array_map(function ($entry) {
//            return "{$entry['TABLE_NAME']}";
//        }, $views));
//
//        if (!empty($views)) {
//            $removeViewsQuery = "DROP VIEW IF EXISTS " . $viewName;
//            $db->query($removeViewsQuery)->execute();
//        }
//
//        $db->query('SET foreign_key_checks = 1;')->execute();
//        echo "Database cleared\n";
//    }

    /**
     * Istall pimcore database
     * @throws Zend_Exception
     */
//    public function install()
//    {
//        // Check if installation already done otherwise install pimcore
//        $check = false;
//        try {
//            $check = $this->adapter->fetchAll("SELECT * FROM objects LIMIT 1");
//        } catch (Exception $e) {
//            echo $e->getMessage();
//        }
//        if (!$check) {
//            // database configuration host/unix socket
//            $dbConfig = [
//                'username' => Zend_Registry::get('systemConfig')->database->params->username,
//                'password' => Zend_Registry::get('systemConfig')->database->params->password,
//                'dbname' => Zend_Registry::get('systemConfig')->database->params->dbname,
//                'host' => Zend_Registry::get('systemConfig')->database->params->host,
//                'port' => Zend_Registry::get('systemConfig')->database->params->port
//            ];
//
//            $setup = new Tool_Setup();
//
//            // check if /website folder already exists, if not, look for /website_demo & /website_example
//            // /website_install is just for testing in dev environment
//            if (!is_dir(PIMCORE_WEBSITE_PATH)) {
//                foreach (["website_install", "website_demo", "website_example"] as $websiteDir) {
//                    $dir = PIMCORE_DOCUMENT_ROOT . "/" . $websiteDir;
//                    if (is_dir($dir)) {
//                        rename($dir, PIMCORE_WEBSITE_PATH);
//                        break;
//                    }
//                }
//            }
//
//            $setup->config(array(
//                "database" => array(
//                    "adapter" => Zend_Registry::get('systemConfig')->database->adapter,
//                    "params" => $dbConfig
//                ),
//            ));
//
//            $contentConfig = array(
//                "username" => $this->config->admin->username,
//                "password" => $this->config->admin->password
//            );
//
//            $mysqlInstallScript = file_get_contents(PIMCORE_PATH . "/modules/install/mysql/install.sql");
//            $mysqlInstallScript = preg_replace('/DROP TABLE(.*);/', '', $mysqlInstallScript);
//            $mysqlInstallScript = preg_replace('/CREATE TABLE/', 'CREATE TABLE IF NOT EXISTS', $mysqlInstallScript);
//            $sqlFile = $this->backupPath . "/install.sql";
//            file_put_contents($sqlFile, $mysqlInstallScript);
//            // remove comments in SQL script
//            $mysqlInstallScript = preg_replace("/\s*(?!<\")\/\*[^\*]+\*\/(?!\")\s*/", "", $mysqlInstallScript);
//
//            // get every command as single part
//            $mysqlInstallScripts = explode(";", $mysqlInstallScript);
//
//            // execute every script with a separate call, otherwise this will end in a PDO_Exception "unbufferd queries, ..." seems to be a PDO bug after some googling
//            foreach ($mysqlInstallScripts as $m) {
//                $sql = trim($m);
//                if (strlen($sql) > 0) {
//                    $sql .= ";";
//                    $this->adapter->query($m);
//                }
//            }
//
//            // set table search_backend_data to InnoDB if MySQL Version is > 5.6
//            $this->adapter->query("ALTER TABLE search_backend_data /*!50600 ENGINE=InnoDB */;");
//
//            // reset the database connection
//            Pimcore_Resource::reset();
//
//            Pimcore::initConfiguration();
//            $setup->contents($contentConfig);
//            echo "Installation completed\n";
//        }
//
//    }

}
