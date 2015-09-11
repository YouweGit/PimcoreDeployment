<?php 

/** Generated at 2015-09-11T12:10:56+02:00 */

/**
* Inheritance: no
* Variants   : no
* Changed by : system (0)
*/


namespace Pimcore\Model\Object;



/**
* @method static \Pimcore\Model\Object\Order getByCreatedAt ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Order getByPrice ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Order getByProducts ($value, $limit = 0) 
*/

class Order extends Concrete {

public $o_classId = 5;
public $o_className = "order";
public $createdAt;
public $Price;
public $Products;


/**
* @param array $values
* @return \Pimcore\Model\Object\Order
*/
public static function create($values = array()) {
	$object = new static();
	$object->setValues($values);
	return $object;
}

/**
* Get createdAt - createdAt
* @return \Pimcore\Date
*/
public function getCreatedAt () {
	$preValue = $this->preGetValue("createdAt"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->createdAt;
	return $data;
}

/**
* Set createdAt - createdAt
* @param \Pimcore\Date $createdAt
* @return \Pimcore\Model\Object\Order
*/
public function setCreatedAt ($createdAt) {
	$this->createdAt = $createdAt;
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
* @return \Pimcore\Model\Object\Order
*/
public function setPrice ($Price) {
	$this->Price = $Price;
	return $this;
}

/**
* Get Products - Products
* @return array
*/
public function getProducts () {
	$preValue = $this->preGetValue("Products"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->getClass()->getFieldDefinition("Products")->preGetData($this);
	return $data;
}

/**
* Set Products - Products
* @param array $Products
* @return \Pimcore\Model\Object\Order
*/
public function setProducts ($Products) {
	$this->Products = $this->getClass()->getFieldDefinition("Products")->preSetData($this, $Products);
	return $this;
}

protected static $_relationFields = array (
  'Products' => 
  array (
    'type' => 'objects',
  ),
);

public $lazyLoadedFields = NULL;

}

