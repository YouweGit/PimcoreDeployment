<?php

namespace Deployment;

use Pimcore\Model\Object\DeploymentDataMigration;

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
    private $ddmm;

    function __construct()
    {
        parent::__construct();
        $this->db = \Pimcore\Resource::get();
        $this->ddmm = new DeploymentDataMigrationManager();
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
        $this->addMigrationKeys();

        $this->clearTmpDir();

        $this->dumpContent();

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

    public function addMigrationKeys()
    {
        echo "\nCreating migration keys for all known content tables.\n";

        $cts = array(
            'documents'         => array(
                'idfield'       => 'id',
                'idfield2'      => null,
                'idfield3'      => null
            ),
            'documents_link'    => array(
                'idfield'       => 'id',
                'idfield2'      => null,
                'idfield3'      => null
            ),
            'documents_page'    => array(
                'idfield'       => 'id',
                'idfield2'      => null,
                'idfield3'      => null
            ),
            'documents_elements' => array(
                'idfield'       => 'documentId',
                'idfield2'      => 'name',
                'idfield3'      => null
            ),
            'properties'        => array(
                'idfield'       => 'cid',
                'idfield2'      => 'ctype',
                'idfield3'      => 'name'
            ),
        );

        foreach($cts as $tn => $ct) {

            echo "table: $tn\n";

            $sql = "SELECT * FROM " . $tn;
            $docs = $this->db->fetchAssoc($sql);
            foreach ($docs as &$doc) {
                $id1 = $doc[$ct['idfield']];
                $id2 = $ct['idfield2'] ? $doc[$ct['idfield2']] : null;
                $id3 = $ct['idfield3'] ? $doc[$ct['idfield3']] : null;

                echo $tn . ' ' .
                    ' [' . $ct['idfield'] . '=' . $id1 . '] ' .
                    ' [' . $ct['idfield2'] . '=' . $id2 . '] ' .
                    ' [' . $ct['idfield3'] . '=' . $id3 . '] ';

//                echo " ($id1-$id2-$id3) ";

                // look up current migration setting by doc id
                $migration_object = \Deployment\DeploymentDataMigrationManager::createKeyByCnameAndId($tn, $id1, $id2, $id3);

                echo $migration_object->getMigrationKey() . "\n";

            }

        }

    }

    public function dumpContent()
    {
        echo "\nDumping content structure to json:\n";

        $migslist = new DeploymentDataMigration\Listing();
        $migslist->setUnpublished(true);
        $migs = $migslist->getObjects();
        foreach($migs as $mig)
        {
            if($mig->getMode() != 'default') {
                $this->dumpContentPart($mig);
            }
        }
    }


    public function dumpContentPart($mig)
    {
        echo $mig->getCName() . " " . $mig->getCId() . " " . $mig->getCId2() . " " . $mig->getCId3() . " " . $mig->getMode() . "\n";
        if($mig->getCName() == 'documents')
        {
            $this->dumpContentPartDocuments($mig);
        }
    }

    public function dumpContentPartDocuments($mig)
    {
        $docdata = $this->ddmm->getDataByDDM($mig);
        echo 'test ';
        var_dump($docdata);
        die();

        // dump the data itself

        // RELATED:
        // parent documents (parentId)
        if($docdata['parentId'] > 0)
        {
            $mig2 = DeploymentDataMigrationManager::retrieveObjectByCnameAndId('documents', $docdata['parentId']);
            $this->dumpContentPart($mig2);
        }

        // documents_page (type == page? --> use id)

        // documents_elements (documentid)

        // -----------------------------------------------
        // @TODO: complete the list of relations to export


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
