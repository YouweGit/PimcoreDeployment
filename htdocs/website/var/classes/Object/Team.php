<?php 

/** Generated at 2015-09-11T12:41:11+02:00 */

/**
* Inheritance: no
* Variants   : no
* Changed by : system (0)
*/


namespace Pimcore\Model\Object;



/**
* @method static \Pimcore\Model\Object\Team getByName ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Team getByPlayers ($value, $limit = 0) 
*/

class Team extends Concrete {

public $o_classId = 2;
public $o_className = "team";
public $Name;
public $Players;


/**
* @param array $values
* @return \Pimcore\Model\Object\Team
*/
public static function create($values = array()) {
	$object = new static();
	$object->setValues($values);
	return $object;
}

/**
* Get Name - Name
* @return string
*/
public function getName () {
	$preValue = $this->preGetValue("Name"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->Name;
	return $data;
}

/**
* Set Name - Name
* @param string $Name
* @return \Pimcore\Model\Object\Team
*/
public function setName ($Name) {
	$this->Name = $Name;
	return $this;
}

/**
* Get Players - Players
* @return array
*/
public function getPlayers () {
	$preValue = $this->preGetValue("Players"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->getClass()->getFieldDefinition("Players")->preGetData($this);
	return $data;
}

/**
* Set Players - Players
* @param array $Players
* @return \Pimcore\Model\Object\Team
*/
public function setPlayers ($Players) {
	$this->Players = $this->getClass()->getFieldDefinition("Players")->preSetData($this, $Players);
	return $this;
}

protected static $_relationFields = array (
  'Players' => 
  array (
    'type' => 'objects',
  ),
);

public $lazyLoadedFields = NULL;

}

