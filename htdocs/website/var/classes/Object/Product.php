<?php 

/** Generated at 2015-09-10T15:47:59+02:00 */

/**
* Inheritance: no
* Variants   : no
* Changed by : admin (2)
* IP:          127.0.0.1
*/


namespace Pimcore\Model\Object;



/**
* @method static \Pimcore\Model\Object\Product getByFirst_name ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Product getByLast_name ($value, $limit = 0) 
*/

class Product extends Concrete {

public $o_classId = 1;
public $o_className = "Product";
public $first_name;
public $last_name;


/**
* @param array $values
* @return \Pimcore\Model\Object\Product
*/
public static function create($values = array()) {
	$object = new static();
	$object->setValues($values);
	return $object;
}

/**
* Get first_name - first_name
* @return string
*/
public function getFirst_name () {
	$preValue = $this->preGetValue("first_name"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->first_name;
	return $data;
}

/**
* Set first_name - first_name
* @param string $first_name
* @return \Pimcore\Model\Object\Product
*/
public function setFirst_name ($first_name) {
	$this->first_name = $first_name;
	return $this;
}

/**
* Get last_name - last_name
* @return string
*/
public function getLast_name () {
	$preValue = $this->preGetValue("last_name"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->last_name;
	return $data;
}

/**
* Set last_name - last_name
* @param string $last_name
* @return \Pimcore\Model\Object\Product
*/
public function setLast_name ($last_name) {
	$this->last_name = $last_name;
	return $this;
}

protected static $_relationFields = array (
);

public $lazyLoadedFields = NULL;

}

