#!/bin/bash
# robust error handling
set -e
CURRENT_PATH=$(cd `dirname ${0}`; pwd -P)

source $CURRENT_PATH/config.sh

export LC_CTYPE=C
export LANG=C
mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < $CURRENT_PATH/dump.sql
