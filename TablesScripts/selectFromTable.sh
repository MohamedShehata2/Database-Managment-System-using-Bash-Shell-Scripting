#!/bin/bash
#import
source ../.././GlobalVars.sh

echo -e "\n====================== Select From Table ======================\n";
while true ; do
bash ../../TablesScripts/./listTables.sh
read -p "${CYAN} press q to exit or${NC} ${YELLOW}Enter Table Name you want to Select from: ${NC}" tableName;
file='tables/'$tableName'.csv';
mfile='metaData/'$tableName'.metaData'
if [[ ${tableName} == 'q' ]]; then
  break;
fi
if [[ -f $file ]]; then
#  echo -e "\n${CYAN}Please, Select an Option :${NC}";
PS3="${CYAN}Please, Select an Option :${NC}"
      select option in "Select All Records" "Select Record" "Select Column" "Back to TableMenu"
      do
            case $option in
                        "Select All Records" )
                                echo -e "\n${BLUE}Your Retreived Data is:${NC}";
                                column -t -s "," tables/$tableName.csv;
                                echo -e "\n========================================================================\n";
                                break;
                                ;;

                        "Select Record" )
                                echo -e "#=> Primay Key of the table is:${CYAN} $(awk -F"," '{if (NR==1) print $1}' $file)${NC}\n"
                                read -p "${YELLOW}Enter the Primary Key of the needed record: ${NC}" PK;

                                recordcheck=$(grep -c $PK $file);

                                if [[ $recordcheck == 0 ]]; then
                                    echo -e "${RED}Record Not Found !!,${NC} Please try again\n";
                                    echo -e "\n========================================================================\n";

                                else
                                    echo -e "${BLUE}Your Retreived Data is:${NC}\n";
                                    echo -e "${CYAN}$(awk -F"," '{if(NR==1) print $0}' $file  | column -t -s ",")${NC}";
                                    echo -e "$(awk -F"," -v var="$PK" '{if(var==$1) print $0}' $file  | column -t -s ",")";
                                    echo -e "\n========================================================================\n";
                                fi
                                break;
                                ;;

                        "Select Column" )
                                echo -e "#=> Columns in the table:\n${CYAN}$(awk -F"," '{i=1; if(NR==1) while (i<=NF) {print i")-",$i; i++}}' $file)${NC}\n";
                                read -p "${YELLOW}Select Column needed: ${NC}" colNum;

                                columncheck=$(awk -F":" '{if(NR==2) print $2}' $mfile);

                                while true; do
                                        if ! [[ $colNum =~ ^[1-9]+$ ]]; then
                                            read -p "${RED}Column Number Must be Integer: ${NC}" colNum;

                                        elif [[ $colNum > $columncheck ]]; then
                                            read -p "${RED}Invalid Column Number, Select Again: ${NC}" colNum;

                                        else
                                            break;
                                        fi
                                done
                                        cut -d',' -f$colNum $file;
                                        echo -e "\n========================================================================\n";
                                break;
                                ;;

                        "Back to TableMenu" )
                                cd ../../
                                bash DBScripts/./DBConn.sh
                                exit;
                                ;;

                        *)
                                echo "${RED} Please, Select Valid Option !!${NC}"
                                echo -e "\n========================================================================\n";
                                break;
                                ;;
            esac
      done
break;
else
echo "${RED}$tableName doesn't Exist !!,${NC}Please try again";
fi
done
echo -e "\n========================================================================\n";
