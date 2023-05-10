#!/bin/bash
#import
source ../.././GlobalVars.sh

OUT=''
joinByChar() {
  local IFS="$1"
  shift
   OUT=$*
}

echo -e "\n=========================== Insert Into Table =============================\n";
while true ; do
bash ../../TablesScripts/./listTables.sh;

read -p "${CYAN}Press q to Exit ${NC}or ${YELLOW}Enter Table Name you want to insert into: ${NC}" tableName;
file='tables/'$tableName'.csv';
mfile='metaData/'$tableName'.metaData'

if [[ ${tableName} == 'q' ]]; then
  break;
fi
if [[ -f $file ]]; then
  count=`awk -F" " '{if(NR==2) {print $2}}' $mfile`


  for (( i = 1; i<=$count ; i++ )); do
   TypeArr[$i]=`cut -f 2- -d' ' $mfile | awk -F" " -v "i=$i" '{if(NR==4) {print $i}}' `
   headers[$i]=`cut -f 2- -d' ' $mfile | awk -F" " -v "i=$i" '{if(NR==3) {print $i}}' `
  done

  #IFS=', ' read -r -a headers <<< "$colname"

  for (( i = 1; i<=$count ; i++ )); do
    while true ; do
    read -p "${YELLOW}Please Enter your ${headers[i]} : ${NC}" answer[i];
      recordcheck=$(grep -c ${answer[1]} $file);

        while true; do
        recordcheck=$(grep -c ${answer[1]} $file);
        if ! [[ $recordcheck == 0 ]]; then
          echo -e "${RED}ID is Exist !!,${NC}";
          read -p "${YELLOW}Please Enter Another Primay Key: ${NC}" answer[1];
        else
          break;
        fi
        done
    if [[ ${TypeArr[i]} =~ 'int' ]]; then
      checkInteger ${answer[i]}
      if [[ $? == 0 ]]; then
        break;
      else
          echo -e "\n${RED}Not valid input data type!!${NC}";
          echo -e "\n========================================================================\n";
      fi
    elif [[ ${TypeArr[i]} =~ 'string' ]]; then
      checkString ${answer[i]}
      if [[ $? == 0 ]]; then
        break;
      else
          echo -e "${RED}Not valid input data type!!${NC}";
          echo -e "\n========================================================================\n";
      fi
    fi
    done
  done
joinByChar , ${answer[@]};
echo $OUT >> $file;

if [[ $? == 0 ]]; then
echo -e "${GREEN}Your input is commited successfully ${NC}^__^";
echo -e "\n========================================================================\n";
break;
else
  echo -e "${RED} Your input is faced an error!!,${NC} Please try again";
fi
else
  echo -e "${RED}Your table doesn't exist ${NC}";
fi
done
