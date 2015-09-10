#!/bin/bash
export LC_CTYPE=C 
export LANG=C
CURRENT_PATH="`dirname \"$0\"`"
mysql -uroot -proot pimcore-migdev < dump.sql
