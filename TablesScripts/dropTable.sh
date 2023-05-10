#!/bin/bash
#import
source ../.././GlobalVars.sh

cd tables
result=${PWD##*/}
cd ../
echo "=========================== Drop Table ===============================\n";
if [ "$( ls -A tables )" ]; then
		bash ../../TablesScripts/./listTables.sh;

		read -p "${YELLOW}Enter table Name: ${NC}" dropt;

		if [[ -f tables/$dropt.csv ]]; then
			echo "${RED}Are you Sure You Want To drop $dropt table?${NC}${CYAN} [y/n] ${NC} "
			read choice;

					case $choice in
						 [Yy]* )
							rm tables/$dropt.csv
							rm metaData/$dropt.metaData
							echo -e "\n${GREEN} $dropt has been Deleted ${NC}^__^\n";
							echo -e "\n========================================================================\n";
							;;
						 [Nn]* )
							echo -e "\n${GREEN} Operation Canceled ${NC}\n";
							echo -e "\n========================================================================\n";
							;;
						* )
							echo -e "\n${RED} Invalid Input 0 tables effected${NC}\n";
							echo -e "\n========================================================================\n";
							;;
					esac
		else
			echo -e "\n${RED} $dropt table doesn't exist!! ${NC}\n";
			echo -e "\n========================================================================\n";
		fi

else
	echo -e "\n${RED}There are no avialable tables to drop${NC}\n";
	echo -e "\n========================================================================\n";
fi
