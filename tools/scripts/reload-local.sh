#!/bin/bash
# robust error handling
set -e
scriptdir=`dirname $(readlink -f $0)`

export LC_CTYPE=C
export LANG=C
CURRENT_PATH=$scriptdir
mysql -uroot -psynocom pimcore_migdev < $CURRENT_PATH/tool/script/dump.sql
