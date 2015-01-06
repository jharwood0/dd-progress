#!/bin/bash

#get every instance of dd and format them to CSV
id=$(pgrep -d ',' '^dd$')

#split the string into array
IFS=',' read -a array <<< "$id"

#check if there are any processes...
if [ ${#array[@]} -eq 0 ];
then
    	echo "No Processess found, quiting!";
        exit
fi

echo "Starting infinite loop"
echo "ctrl-C to cancel"

#forearch element in the array, send a USR1 signal to the process
#loop continuously
while(true)
do
  for element in "${array[@]}"
  do
    #send the signal
    out=$(kill -USR1 $element);
    if [ $? !=  0 ]
    then
      echo "Process has ended!"
      echo "Bye!"
      exit
    fi
    echo "sent signal to $element"
  done
  #stops dos effect
  sleep 10
done
