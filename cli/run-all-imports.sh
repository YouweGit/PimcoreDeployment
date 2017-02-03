#!/bin/sh
CURRENT_PATH=$(cd $(dirname "$0"); pwd)
$CURRENT_PATH/clear-classes.sh
$CURRENT_PATH/import-field-collection.sh
$CURRENT_PATH/import-definition.sh
$CURRENT_PATH/import-customlayout.sh
$CURRENT_PATH/import-bricks.sh
$CURRENT_PATH/import-staticdata.sh
$CURRENT_PATH/import-customsql.sh
