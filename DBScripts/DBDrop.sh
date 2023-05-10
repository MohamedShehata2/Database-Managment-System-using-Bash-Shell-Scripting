#!/bin/bash
#Database Drop
source ./GlobalVars.sh
echo -e "\n============================== Drop Database =================================\n";
if [[ -z "$(ls -A  data)" ]] ;
then
echo -e "\n${RED}Sorry, There is no datbases to drop ${NC}";
echo -e "\n========================================================================\n";
else
DBScripts/./listDB.sh
while true ; do

read -p "${YELLOW}Enter the Name of the DataBase You want to Drop: ${NC}" DBDname;
if [[ -d data/$DBDname && $DBDname != "" ]];
then
echo "${CYAN}Are You Sure To Drop $DBDname DataBase? Y/N? ${NC}";
read Ans;
case $Ans in
	[yY] )
	     	rm -r data/$DBDname
		echo -e "\n${GREEN} $DBDname has been removed successfully${NC}^__^"
		echo -e "\n========================================================================\n";
		break;
		;;
	[Nn] )
		echo -e "\n${GREEN} $DBDname still exist no change is commited ${NC}";
		echo -e "\n========================================================================\n";
		break;
		;;
	*)
		echo "${RED} Invalid choice${NC},Please try again";
		echo -e "\n========================================================================\n";
		break;
		;;
esac
else
echo -e "\n${RED} Data base $DBDname does not exist!!,${NC} Please try again";
echo -e "\n========================================================================\n";
fi
done
fi
