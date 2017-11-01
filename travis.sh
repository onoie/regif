#!/usr/bin/env bash

wget --user=$USER --password=$PASS $URL
unzip master.zip

DIR=$( unzip -qql master.zip | head -n1 | tr -s ' ' | cut -d' ' -f5- | rev | cut -c 2- | rev )
echo $DIR

echo "complete"

