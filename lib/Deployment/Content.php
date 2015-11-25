<?php

namespace Deployment;

class Content extends \Deployment\DAbstract
{
    /**
     * @var string
     */
    private $backupPath = '/var/deployment/migration/content/';
    private $backupTmpPath = '/var/deployment/migration/content/tmp/';
    /**
     * @var string
     */
    private $dumpFileName = 'contentdata.zip';
    /**
     * @var Zend_Config
     */
    public $config;

    private $db;

    function __construct()
    {
        parent::__construct();
        $this->db = \Pimcore\Resource::get();
        $this->backupPath = PIMCORE_WEBSITE_PATH . $this->backupPath;
        $this->backupTmpPath = PIMCORE_WEBSITE_PATH . $this->backupTmpPath;
        \Pimcore\File::mkdir($this->backupPath);
        \Pimcore\File::mkdir($this->backupTmpPath);
    }

    /**
     * Creates migration
     */
    public function exportContent()
    {
        $this->clearTmpDir();

        // dump some data to jsons
        file_put_contents($this->backupTmpPath . 'test.json', 'test-data');
        file_put_contents($this->backupTmpPath . 'test2.json', 'test-data2');
        file_put_contents($this->backupTmpPath . 'test3.json', 'test-data3');

        $this->finishExport();
    }

    /**
     * Zip all migration files
     */
    private function finishExport()
    {
        $zipFile = $this->backupPath . $this->dumpFileName;
        $zip = new \ZipArchive();
        $zip->open($zipFile, \ZIPARCHIVE::OVERWRITE);
        $zip->addGlob($this->backupTmpPath . '*', 0, array('add_path' => './', 'remove_all_path' => true));
        $zip->close();

        $this->clearTmpDir();
    }

    /**
     * Migrate migration
     * @throws Exception
     * @throws Zend_Exception
     */
    public function importContent()
    {
        $this->clearTmpDir();

        $zipFile = $this->backupPath . $this->dumpFileName;

        $command = "unzip $zipFile -d " . $this->backupTmpPath;
        print "EXEC: $command \n";
        exec($command, $output, $return_var);

        $files = glob($this->backupTmpPath . '*');
        echo "\nProcessing files:\n";
        var_dump($files);

        $this->clearTmpDir();
    }

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

    private function clearTmpDir()
    {
        array_map('unlink', glob($this->backupTmpPath . '*'));
    }


}
