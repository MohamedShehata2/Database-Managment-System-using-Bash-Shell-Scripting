#!/bin/bash

#Declaration of used colors

RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\e[0;33m'
BLUE=$'\e[0;34m'
CYAN=$'\e[1;36m'
NC=$'\e[m'

#Prompet Style
PS3=" ==>: "

#common Functions
checkInteger ()
{
  if ! [[ $1 =~ [0-9] ]] ; then
    return 1;
  else
    return 0;
  fi
}
checkString ()
{
  if [[ $1 =~ ['!@#$%^&*()+=-'] || $1 =~ [0-9] ]]; then
    return 1;
  else
    return 0;
  fi
}

#checkInteger 1
#echo "$?""
#checkString "AA_"
#echo "$?"
