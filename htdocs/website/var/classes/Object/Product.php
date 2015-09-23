<?php 

/** Generated at 2015-09-23T12:34:10+02:00 */

/**
* Inheritance: no
* Variants   : no
* Changed by : system (0)
*/


namespace Pimcore\Model\Object;



/**
* @method static \Pimcore\Model\Object\Product getByName ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Product getByCode ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Product getByPrice ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Product getByLocalizedfields ($value, $limit = 0) 
*/

class Product extends Concrete {

public $o_classId = 3;
public $o_className = "product";
public $Name;
public $Code;
public $Price;
public $localizedfields;


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
* @return \Pimcore\Model\Object\Product
*/
public function setName ($Name) {
	$this->Name = $Name;
	return $this;
}

/**
* Get Code - Code
* @return string
*/
public function getCode () {
	$preValue = $this->preGetValue("Code"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->Code;
	return $data;
}

/**
* Set Code - Code
* @param string $Code
* @return \Pimcore\Model\Object\Product
*/
public function setCode ($Code) {
	$this->Code = $Code;
	return $this;
}

/**
* Get Price - Price
* @return float
*/
public function getPrice () {
	$preValue = $this->preGetValue("Price"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->Price;
	return $data;
}

/**
* Set Price - Price
* @param float $Price
* @return \Pimcore\Model\Object\Product
*/
public function setPrice ($Price) {
	$this->Price = $Price;
	return $this;
}

/**
* Get localizedfields - 
* @return array
*/
public function getLocalizedfields () {
	$preValue = $this->preGetValue("localizedfields"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->getClass()->getFieldDefinition("localizedfields")->preGetData($this);
	return $data;
}

/**
* Get Description - Description
* @return string
*/
public function getDescription ($language = null) {
	$data = $this->getLocalizedfields()->getLocalizedValue("Description", $language);
	$preValue = $this->preGetValue("Description"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { return $preValue;}
	 return $data;
}

/**
* Set localizedfields - 
* @param array $localizedfields
* @return \Pimcore\Model\Object\Product
*/
public function setLocalizedfields ($localizedfields) {
	$this->localizedfields = $localizedfields;
	return $this;
}

/**
* Set Description - Description
* @param string $Description
* @return \Pimcore\Model\Object\Product
*/
public function setDescription ($Description, $language = null) {
	$this->getLocalizedfields()->setLocalizedValue("Description", $Description, $language);
	return $this;
}

protected static $_relationFields = array (
);

public $lazyLoadedFields = NULL;

}

