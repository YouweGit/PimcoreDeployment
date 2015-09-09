<?php
/**
 * Created by PhpStorm.
 * User: yasarkunduz
 * Date: 02-10-14
 * Time: 16:43
 */

class YouweDeploy_Cache {
    /**
     *  This function clears all cache from pimcore in order to not conflict with the possible new database config
     */
    public function doClearCache()
    {
        $db = Pimcore_Resource::get();
        $db->query("truncate table cache_tags");
        $db->query("truncate table cache");

        // empty cache directory
        array_map(function($file){
            if ($file != ".dummy") {
                unlink($file);
            }
        }, glob(PIMCORE_CACHE_DIRECTORY . '/*'));

        Pimcore_Model_Cache::removeIgnoredTagOnClear("output");
        Pimcore_Model_Cache::clearTag("output");

        recursiveDelete(PIMCORE_TEMPORARY_DIRECTORY, false);
        #recursiveDelete(PIMCORE_SYSTEM_TEMP_DIRECTORY, false);
        #recursiveDelete(PIMCORE_LOG_DIRECTORY, false);

    }

} 