#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
  echo -n 'CPU '
  ps -A -o %cpu | awk '{s+=$1} END {printf "%d", s ","}'
  echo -n '% '
fi
echo -n 'LA '
uptime | sed -e 's/s:/:/g' -e 's/.*average: //g' -e 's/,//g' | awk '{print $1, $2, $3}'
