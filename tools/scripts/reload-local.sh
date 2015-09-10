#!/bin/bash
# robust error handling
set -e
scriptdir=`dirname $(readlink -f $0)`
CURRENT_PATH=$scriptdir

source $CURRENT_PATH/config.sh

export LC_CTYPE=C
export LANG=C
CURRENT_PATH=$scriptdir
mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < $CURRENT_PATH/dump.sql
