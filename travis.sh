#!/usr/bin/env bash

wget --user=$USER --password=$PASS $URL
unzip master.zip &>/dev/null
DIR=$( unzip -qql master.zip | head -n1 | tr -s ' ' | cut -d' ' -f5- | rev | cut -c 2- | rev )
mv $DIR src

echo "complete"

