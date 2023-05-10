#!/bin/bash
#Create database directory with name sent by user

#import
source ./GlobalVars.sh

echo -e "\n============================== Create Database =================================\n";

while true; do
read -p "${YELLOW}Enter DB Name:${NC} " var;
dir='data/'$var;

if [[ -z $var ]]; then
 	  echo "${RED}Empty Input !!,${NC} Please try again";

elif [[ $var =~ ['!@#$%^&*()+=-'] ]]; then
    echo "${RED}Invalid input !! ,${NC} Please try again";

elif [[ -d $dir ]]; then
    echo "${RED}The Database${NC} $var ${RED}is Already Exists${NC}";

else
  	mkdir -p data/$var 2>  DBScripts/logger.log;
    if [[ $? == 0 ]]; then
  	echo -e "\n${GREEN}The Database Created Successfully${NC} ^__^ ";
    else
    echo -e "\n${RED}The process Failed please try again later${NC} :( ";
    fi
    break;
fi
done
echo -e "\n================================================================================\n";
