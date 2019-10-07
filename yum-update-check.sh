#!/bin/bash

if [[ $UID -ne 0 ]]; then
   echo "This script must be run as root or with 'sudo'" 
   exit 1
fi

echo "Clearing yum cache"
yum clean all

cmd="/usr/bin/yum check-update"
status=$?
update="/usr/bin/yum update"

$cmd
status=$?

if [ $status -eq 100 ]
then 
	echo "Updates are available. Running 'yum update'"
	$update
	exit 0	
else
	echo "No system updates are available"
	exit 1
fi
