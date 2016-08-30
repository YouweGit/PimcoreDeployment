<?php

namespace PimcoreDeployment;

use Pimcore\Model\Object\Fieldcollection as FieldCollectionObject;

class FieldCollection {

     /**
     * Imports classes from json files
     */
    public function import() {
        $listing = new FieldCollectionObject\Definition\Listing();
        foreach($listing->load() as $key => $value) {
            echo sprintf('Saving field collection defintion "%s"', $value->getKey()) . "\n";
            $value->save();
        }
    }
}