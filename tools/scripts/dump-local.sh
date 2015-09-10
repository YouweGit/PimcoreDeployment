#!/bin/bash
# robust error handling
set -e
CURRENT_PATH=$(cd `dirname ${0}`; pwd -P)

source $CURRENT_PATH/config.sh

export LC_CTYPE=C
export LANG=C
mysqldump -hlocalhost -u $DB_USER -p$DB_PASSWORD --databases $DB_NAME | sed '/\*\!50013 DEFINER/d' > $CURRENT_PATH/dump.sql

# --set-gtid-purged=OFF

if which say >/dev/null; then
	say -v "Vicki" database dump complete
fi



