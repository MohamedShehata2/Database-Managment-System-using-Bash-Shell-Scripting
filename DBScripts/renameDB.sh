#!/bin/bash
#Modify Database Name

#import
source ./GlobalVars.sh

echo -e "\n============================== Rename Database =================================\n";
DBScripts/./listDB.sh
while true; do
read -p "${YELLOW}Enter DataBase Name: ${NC}" dbold;

if [[ -z $dbold ]]; then
 	  echo "${RED}Empty Input !!,${NC} Please try again";

elif [[ $dbold =~ ['!@#$%^&*()+=-'] ]]; then
    echo "${RED}Invalid input !! ,${NC} Please try again";

elif [[ -d data/$dbold ]]; then
	echo -e "\n${CYAN} $dbold Exists ${NC}\n";

	while true; do

				read -p "${YELLOW}Enter New Name: ${NC}" dbnew;

						if [[ -z $dbnew ]]; then
						 	  echo "${RED}Empty Input !!,${NC} Please try again";

						elif [[ $dbnew =~ ['!@#$%^&*()+=-'] ]]; then
						    echo "${RED}Invalid input !!,${NC} Please try again";

						else
								mv data/$dbold data/$dbnew 2> DBScripts/logger.log;
                if [[ $? == 0 ]]; then
                break;
                else
                echo -e "\n${GREEN}The process Failed please try again${NC} :( ";
                fi

						fi
	done
	echo -e "\n${GREEN} Rename Done Successfully ${NC}^__^";
	break;

else
	echo "${RED}No database exist with this name !!!${NC}";

fi
done
echo -e "\n================================================================================\n";
