#!/bin/bash

#get every instance of dd and format them to CSV
id=$(pgrep -d ',' '^dd$')

#split the string into array
IFS=',' read -a array <<< "$id"

echo "Starting infinite loop"
echo "ctrl-C to cancel"

#forearch element in the array, send a USR1 signal to the process
#loop continuously
while(true)
do
  for element in "${array[@]}"
  do
    command="kill -USR1  $element"
    eval $command
    echo "sent signal to $element"
  done
  #stops dos effect
  sleep 10
done
