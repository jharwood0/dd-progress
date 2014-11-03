#!/bin/bash

id=$(pgrep -d ',' '^dd$')

IFS=',' read -a array <<< "$id"

echo "Starting infinite loop"
echo "ctrl-C to cancel"

while(true)
do
  for element in "${array[@]}"
  do
    command="kill -USR1  $element"
    eval $command
    echo "sent signal to $element"
  done
  sleep 10
done
