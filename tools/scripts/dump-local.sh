#!/bin/bash
export LC_CTYPE=C 
export LANG=C
mysqldump -h127.0.0.1 -uroot -proot --databases pimcore-migdev > dump.sql
 
# --set-gtid-purged=OFF


if which say >/dev/null; then
	say -v "Vicki" database dump complete
fi
# printf '\7\7\7\7\7\7\7\7\7\7\7'



