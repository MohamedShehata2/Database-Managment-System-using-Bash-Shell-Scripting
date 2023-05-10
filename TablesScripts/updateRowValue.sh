#!/bin/bash
#import
source ../.././GlobalVars.sh

echo -e "\n====================== Update Row Value ======================\n";
while true ; do
bash ../../TablesScripts/./listTables.sh
read -p "${CYAN} press q to exit or${NC} ${YELLOW}Enter Table Name you want to Delect from: ${NC}" tableName;
file='tables/'$tableName'.csv';
mfile='metaData/'$tableName'.metaData'
if [[ ${tableName} == 'q' ]]; then
  break;
fi
if [[ -f $file ]]; then
  echo -e "#=> Primay Key of the table is:${CYAN} $(awk -F"," '{if (NR==1) print $1}' $file)${NC}\n"
  read -p "${YELLOW}Enter the Primary Key to delete the record: ${NC}" PK;

  recordcheck=$(grep -c $PK $file);
#  InfoLine=$(head -n 1 filename)
  if [[ $recordcheck == 0 ]]; then
      echo -e "${RED}Record Not Found !!,${NC} Please try again\n";
      echo -e "\n========================================================================\n";
  else
    InfoLine=$(head -n 1 $file)
    Line=`awk -F"," -v var="$PK" '{if(var==$1) print $0}' $file`
    if [[ $Line == $InfoLine ]]; then
      echo "${RED}sorry You can't updaate the table header ${NC}"
      continue;
    else
      echo -e "${BLUE}The record that will be updated is: ${NC}";
      echo "${Line}"
      echo "${YELLOW}What element do you want to update in this record?${NC} "
      read oldWord;
      echo "${YELLOW}what is the new element?${NC}";
      read newWord;
      echo -e "\n${RED}Are you sure that you want to update in this record?${NC}${CYAN} [y/n] ${NC}";
    	read choice;
    	case $choice in
    		 [Yy]* )
          sed -i -e "/$PK/s/$oldWord/$newWord/" $file
          if [[ $? == 0 ]]; then
    			echo -e "\n${GREEN}The record has been updated${NC}^__^";
          else
          echo -e "\n${RED}The process Failed please try again later${NC} :( ";
          fi
    			;;
    		 [Nn]* )
    			echo "${GREEN} Operation Canceled ${NC}"
    			;;
    		* )
    			echo "${RED} Invalid Input 0 tables effected ${NC}";
    			;;
    	esac
    fi
    #  sed "/${pattern}/d" "$file"
    #  echo -e "$(awk -F"," -v var="$PK" '{if(var==$1) print $0}' $file  | column -t -s ",")";
  #  awk -F"," -v var="$PK" '{if(var==$1) print $0}' $file  | column -t -s ","
      echo -e "\n========================================================================\n";
  fi
break;
else
echo "${RED}$tableName doesn't Exist !!,${NC}Please try again";
fi
done
echo -e "\n========================================================================\n";
