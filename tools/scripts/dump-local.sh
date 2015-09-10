#!/bin/bash
# robust error handling
set -e
CURRENT_PATH=$(cd `dirname ${0}`; pwd -P)

source $CURRENT_PATH/config.sh

export LC_CTYPE=C
export LANG=C
mysqldump -h127.0.0.1 -u $DB_USER -p$DB_PASSWORD --databases $DB_NAME > $CURRENT_PATH/dump.sql

# --set-gtid-purged=OFF

if which say >/dev/null; then
	say -v "Vicki" database dump complete
fi



