#!/usr/bin/env bash
getName(){ unzip -qql $1 | head -n1 | tr -s ' ' | cut -d' ' -f5- | rev | cut -c 2- | rev }
wget --user=$USER --password=$PASS $URL
ls
DIR=$(getName master.zip)
echo $DIR

echo "complete"

