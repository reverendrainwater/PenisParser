#!/bin/bash
FILE=$1     
if [ ! -f $FILE ]; then
  echo "File $FILE does not exist."
  exit -1
fi
sed -i 's/[a-zA-Z^:space:^\n^\s^\t]*/penis/g' $FILE
