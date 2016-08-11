<?php

/**
 * ModernWeb
 *
 * LICENSE
 *
 * This source file is subject to the new BSD license that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://www.modernweb.pl/license/new-bsd
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to kontakt@modernweb.pl so we can send you a copy immediately.
 *
 * @category    Pimcore
 * @package     Plugin_Blog
 * @author      Rafał Gałka <rafal@modernweb.pl>
 * @copyright   Copyright (c) 2007-2012 ModernWeb (http://www.modernweb.pl)
 * @license     http://www.modernweb.pl/license/new-bsd     New BSD License
 */

/**
 * Blog plugin installation class.
 *
 * @category    Pimcore
 * @package     Plugin_Blog
 * @author      Rafał Gałka <rafal@modernweb.pl>
 * @copyright   Copyright (c) 2007-2012 ModernWeb (http://www.modernweb.pl)
 */
class Deployment_Plugin_Install
{
    /**
     * @var User
     */
    protected $_user;
    private $db;

    function __construct() {
        $this->db = \Pimcore\Resource::get();
    }

    public function createClass($name)
    {
        $filename = PIMCORE_PLUGINS_PATH . "/Deployment/install/class_$name.json";

        $json = file_get_contents($filename);
        $importData = \Zend_Json::decode($json);
//        $id = $this->db->quote($importData['id']);
        $name = $this->db->quote($importData['name']);
        $userOwner = $this->db->quote($importData['userOwner']);

//        $class = \Object_Class::getById($id);
//        if (!$class) {
        $this->db->query("INSERT INTO classes(name, userOwner) VALUES($name, $userOwner)");
        $id = $this->db->lastInsertId();
//        }
//        else {
//            $this->db->query("UPDATE classes SET name = $name, userOwner = $userOwner WHERE id=$id");
//        }
        $class = \Pimcore\Model\Object\ClassDefinition::getById($id);

        \Pimcore\Model\Object\ClassDefinition\Service::importClassDefinitionFromJson($class, $json);


        return $class;
    }

    public function removeClass($name)
    {
        $class = \Pimcore\Model\Object\Classdefinition::getByName($name);
        if ($class) {
            $class->delete();
        }
    }


    /**
     * @return User
     */
    protected function _getUser()
    {
        if (!$this->_user) {
            $this->_user = \Zend_Registry::get('pimcore_admin_user');
        }

        return $this->_user;
    }

}
