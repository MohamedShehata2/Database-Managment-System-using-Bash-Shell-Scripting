#!/bin/bash
#import
source ../.././GlobalVars.sh;

echo -e "\n============================== Existing Tables =================================";

if [[ -d "tables" ]]; then

	ls tables | awk -F"." '{print  "Table "NR": " $1 }'|awk -F"." '{{print $1}}';

fi
echo -e "================================================================================\n";
