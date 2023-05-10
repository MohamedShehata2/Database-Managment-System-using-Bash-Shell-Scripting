#!/bin/bash
# import
source ./GlobalVars.sh;

echo -e "\n============================ Connect to Database ==========================\n";
source DBScripts/./listDB.sh;

flag=true;
while ${flag} ; do
      read -p "${YELLOW}Which database do you want to connect to: ${NC}" DataBaseName;

      if [[ -d data/${DataBaseName} ]];then
        flag=false;
        cd data/${DataBaseName};
        echo -e "\n${CYAN}You are now conected to ${DataBaseName}${NC}";
        echo -e "\n";
      PS3="${YELLOW}What do you want to execute on your database?${NC} ";
      select i in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select from Table " "Delete From Table " "Update value in a Row " "Go back to Home" "Exit!";
          do
            case ${REPLY} in
                  1)  ../../TablesScripts/./createTable.sh;;
                  2)  ../../TablesScripts/./listTables.sh;;
                  3)  ../../TablesScripts/./dropTable.sh;;
                  4)  ../../TablesScripts/./InsertIntoTable.sh;;
                  5)  ../../TablesScripts/./selectFromTable.sh;;
                  6)  ../../TablesScripts/./deleteFromTable.sh;;
                  7)  ../../TablesScripts/./updateRowValue.sh;;
                  8)  cd ../../ ;
                      ./HomeMenu.sh;
                      break; ;;
                  9)  cd ../../ ;
                      exit;;
            esac
          done
      else
      echo -e "\n${RED} Sorry, This DataBase doesn't Exist ${NC}";
      echo -e "\n========================================================================\n";
      fi
done
