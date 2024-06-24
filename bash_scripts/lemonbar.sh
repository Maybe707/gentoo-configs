#!/bin/bash

# set -f

# resultLine=""

# wmctrl -d | while read line; do
# 	testResult=$(echo "$line" | grep "\*")
# 	currentWorkspace=$(echo "$line" | grep "*" | cut -d ' ' -f 1)
# 	if [[ "$testResult" == "" ]]; then
# 		echo -n "| | "
# 	else
# 		echo -n "|🦎| "
# 	fi
# done

ACTIVE=' |'
ITERATION=0
END='=[]'
 
#set -f
 
wmctrl -d | while read line
do
  echo "$line" | grep '*' > /dev/null           # grep return 0 if something found or 1 if nothing found
  is_active=$?

  ITERATION=$((ITERATION+1))
 
  if [[ $is_active = 0 ]]; then
    name="$ACTIVE"
  else
    if [[ $ITERATION != 10 ]]; then
      name="$(echo $line | awk '{ print $1 }') |"
    else
      name="$END"
    fi
  fi

  echo -n " $name"
done
