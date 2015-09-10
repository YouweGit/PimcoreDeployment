#!/usr/bin/env bash
#
# import-products-xml.sh
#
# handle and Chunk the products import from SAP getProducts
#
# The getProducts.xml is retrieved from the sample data dir and chunked
# into the import dir. Some xml formatting is added
#
# @category Youwe Development
# @package psg.pimcore
# @author Bas Ouwehand <b.ouwehand@youwe.nl>
# @date 2/17/15
#
#

# robust error handling
set -e
scriptdir=`dirname $(readlink -f $0)`

# xml vars
XML_NODE='product'
XML_GROUP_NODE='push_products'

# start argument parsing
SAP_SYSTEM=$1
ARGS=(tn mg hm)
HELP=" Sap sytem not set, please use: ./import-products-xml.sh <tn | mg | hm>"
if [ -z ${SAP_SYSTEM} ]; then
    echo $HELP
    exit 0
fi
# check if we have correct vars
match=0
for acc in "${ARGS[@]}"; do
    if [[ $acc = "$SAP_SYSTEM" ]]; then
        match=1
        break
    fi
done
if [[ $match = 0 ]]; then
    echo $HELP
    exit 0
fi

MAIN_FILE=$scriptdir/../../htdocs/sampleData/import/"$SAP_SYSTEM"/getProducts.xml

echo "handle char encoding"
MIME_ENCODING="$(file --mime-encoding $MAIN_FILE | sed -e 's/.*\:\s//g')"
if [ $MIME_ENCODING != 'us-ascii' ]; then
    iconv -f $MIME_ENCODING -t UTF-8 $MAIN_FILE > $MAIN_FILE.tmp
    mv $MAIN_FILE.tmp $MAIN_FILE
    sed -i 's/utf-16/utf-8/g' $MAIN_FILE
fi

FILES_DIR=$scriptdir/../../htdocs/sampleData/import/"$SAP_SYSTEM"/products
CHUNK_SIZE=100

echo "empty dir"
rm -rf "$FILES_DIR"/*
rm -f "$MAIN_FILE".tmp

echo "handle main file"
fromdos $MAIN_FILE
echo "squeezing the life out"
tr -d '\n' < $MAIN_FILE > $MAIN_FILE.tmp
sed -i "s/<$XML_NODE>/\n<$XML_NODE>/g" $MAIN_FILE.tmp
# for changing filetypes, explicitly break the tail
sed -i "s/<\/$XML_GROUP_NODE>/\n<\/$XML_GROUP_NODE>/g" $MAIN_FILE.tmp
echo "remove head"
sed -i '1d' $MAIN_FILE.tmp
echo "remove tail"
sed -ie '$d' $MAIN_FILE.tmp
echo "create chunks"
split -l $CHUNK_SIZE "$MAIN_FILE".tmp "$FILES_DIR"/products_
echo "change rights"
chmod -R 755 $FILES_DIR
for f in "$FILES_DIR"/*
do
  sed -i '1s/^/<?xml version="1.0" encoding="utf-8"?>\n<products>\n /' $f
  printf "</products>" >> $f
  xmllint --format $f > "$f".xml
  echo "$f".xml
  rm $f
done
rm -f "$MAIN_FILE".tmp
echo 'DONE'
