#! /bin/bash
# dataBase Home Menu
#import
source ./GlobalVars.sh;

echo -e "\n==============================================================================\n";
echo -e "\n\t\t\t Welcome To our DBMS Program\n";
echo -e "================================================================================\n";

flag=true;
while $flag ; do

PS3="${YELLOW}What is the action you want to perform on the Database: ${NC}";
	select i in "Create DataBase" "List DataBases " "Connect to DataBase"  "Rename DataBase" "Drop Data Base" " Sign Out!"
	do
	  case ${REPLY} in
	  1) DBScripts/./createDB.sh ;;
	  2) DBScripts/./listDB.sh ;;
    3) DBScripts/./DBConn.sh ;;
    4) DBScripts/./renameDB.sh ;;
	  5) DBScripts/./DBDrop.sh ;;
	  6) flag=false;
				break;
				exit; ;;
	  esac

	done
done
