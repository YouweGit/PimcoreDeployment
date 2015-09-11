<?php 

/** Generated at 2015-09-11T11:40:34+02:00 */

/**
* Inheritance: no
* Variants   : no
* Changed by : system (0)
*/


namespace Pimcore\Model\Object;



/**
* @method static \Pimcore\Model\Object\Person getByFirstname ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Person getByLastname ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Person getByEmail ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Person getByGender ($value, $limit = 0) 
* @method static \Pimcore\Model\Object\Person getByPersona ($value, $limit = 0) 
*/

class Person extends Concrete {

public $o_classId = 1;
public $o_className = "person";
public $firstname;
public $lastname;
public $email;
public $gender;
public $persona;


/**
* @param array $values
* @return \Pimcore\Model\Object\Person
*/
public static function create($values = array()) {
	$object = new static();
	$object->setValues($values);
	return $object;
}

/**
* Get firstname - first_name
* @return string
*/
public function getFirstname () {
	$preValue = $this->preGetValue("firstname"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->firstname;
	return $data;
}

/**
* Set firstname - first_name
* @param string $firstname
* @return \Pimcore\Model\Object\Person
*/
public function setFirstname ($firstname) {
	$this->firstname = $firstname;
	return $this;
}

/**
* Get lastname - last_name
* @return string
*/
public function getLastname () {
	$preValue = $this->preGetValue("lastname"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->lastname;
	return $data;
}

/**
* Set lastname - last_name
* @param string $lastname
* @return \Pimcore\Model\Object\Person
*/
public function setLastname ($lastname) {
	$this->lastname = $lastname;
	return $this;
}

/**
* Get email - Email
* @return string
*/
public function getEmail () {
	$preValue = $this->preGetValue("email"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->email;
	return $data;
}

/**
* Set email - Email
* @param string $email
* @return \Pimcore\Model\Object\Person
*/
public function setEmail ($email) {
	$this->email = $email;
	return $this;
}

/**
* Get gender - Gender
* @return string
*/
public function getGender () {
	$preValue = $this->preGetValue("gender"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->gender;
	return $data;
}

/**
* Set gender - Gender
* @param string $gender
* @return \Pimcore\Model\Object\Person
*/
public function setGender ($gender) {
	$this->gender = $gender;
	return $this;
}

/**
* Get persona - Persona
* @return string
*/
public function getPersona () {
	$preValue = $this->preGetValue("persona"); 
	if($preValue !== null && !\Pimcore::inAdmin()) { 
		return $preValue;
	}
	$data = $this->persona;
	return $data;
}

/**
* Set persona - Persona
* @param string $persona
* @return \Pimcore\Model\Object\Person
*/
public function setPersona ($persona) {
	$this->persona = $persona;
	return $this;
}

protected static $_relationFields = array (
);

public $lazyLoadedFields = NULL;

}

