<?php
/**
 * Pimcore
 *
 * LICENSE
 *
 * This source file is subject to the new BSD license that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://www.pimcore.org/license
 *
 * @category   Pimcore
 * @package    Element
 * @copyright  Copyright (c) 2009-2014 pimcore GmbH (http://www.pimcore.org)
 * @license    http://www.pimcore.org/license     New BSD License
 */

namespace Pimcore\Model\Element\Sanitycheck;

use Pimcore\Model;

class Resource extends Model\Resource\AbstractResource {

    /**
     * Save to database
     *
     * @return void
     */
    public function save() {

        $sanityCheck = get_object_vars($this->model);

        foreach ($sanityCheck as $key => $value) {
            if (in_array($key, $this->getValidTableColumns("sanitycheck"))) {
                $data[$key] = $value;
            }
        }

        try {
            $this->db->insert("sanitycheck", $data);
        }
        catch (\Exception $e) {
           //probably duplicate
        }

        return true;
    }

    /**
     * Deletes object from database
     *
     * @return void
     */
    public function delete() {
        $this->db->delete("sanitycheck", $this->db->quoteInto("id = ?", $this->model->getId()) . " AND " . $this->db->quoteInto("type = ?", $this->model->getType()));
    }

    public  function getNext(){

        $data = $this->db->fetchRow("SELECT * FROM sanitycheck LIMIT 1");
        if (is_array($data)) {
            $this->assignVariablesToModel($data);
        }  


    }

}