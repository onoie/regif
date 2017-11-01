#!/usr/bin/env bash
if [ $# -ne 3 ]; then
  echo "require [host],[user],[repository]"
  exit 1
else
  #echo "$1,$2,$3"
  git clone git@$1:$2/$3.git
  echo "complete"
fi


