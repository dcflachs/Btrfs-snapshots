#!/bin/bash
[ -z "$OUTPUT_DIR" ] && echo "Output Folder not set" && exit 1

PLUGIN_NAME="snapshots"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="/usr/local/emhttp/plugins"
TMP_DIR="/tmp/${PLUGIN_NAME}_"$(echo $RANDOM)""
VERSION="$(date +'%Y.%m.%d')$1"

mkdir -p $TMP_DIR/$VERSION/$BASE_DIR
cp -R $SCRIPT_DIR/$PLUGIN_NAME/ $TMP_DIR/$VERSION/$BASE_DIR/$PLUGIN_NAME
chmod -R 755 $TMP_DIR/$VERSION/
rm $TMP_DIR/$VERSION/$BASE_DIR/$PLUGIN_NAME/README.md
cd $TMP_DIR/$VERSION/
makepkg -l y -c y $OUTPUT_DIR/${PLUGIN_NAME}-$VERSION.txz
md5sum $OUTPUT_DIR/${PLUGIN_NAME}-$VERSION.txz | awk '{print $1}' > $OUTPUT_DIR/${PLUGIN_NAME}-$VERSION.txz.md5
rm -R $TMP_DIR/$VERSION/
chmod 755 $OUTPUT_DIR/*

echo "MD5: $(cat $OUTPUT_DIR/${PLUGIN_NAME}-$VERSION.txz.md5)"
echo "MD5: $(echo $MD5 | head -n1 | awk '{print $1;}')" >> $OUTPUT_FOLDER/release_info