#!/usr/bin/env bash
getName(){ unzip -qql $1 | head -n1 | tr -s ' ' | cut -d' ' -f5- | rev | cut -c 2- | rev }
wget --user=$USER --password=$PASS $URL
DIR=$(getName master.zip)
unzip master.zip
mv $DIR src
ls
cd src
ls

echo "complete"

