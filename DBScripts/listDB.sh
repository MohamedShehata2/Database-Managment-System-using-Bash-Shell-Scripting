#!/bin/bash
#List DataBases exist in your DBMS

#import
source ./GlobalVars.sh;

echo -e "\n============================ Existing DataBases ================================";

if [[ -d "data" ]]; then
	ls data | awk '{print  "DB "NR": " $1 }';
fi
echo -e "================================================================================\n";
