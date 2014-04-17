#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Please specify the dest folder name."
	exit 1
fi

DEST=$1
mkdir ${DEST}
mv conf logs temp webapps work ${DEST}
mkdir -p ${DEST}/lib
mkdir -p ${DEST}/bin
cp setenv.sh ${DEST}/bin/setenv.sh
cp -f tomcat-users.xml ${DEST}/conf/tomcat-users.xml
