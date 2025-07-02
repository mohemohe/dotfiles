#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
  echo -n 'MemPress '
  memory_pressure | grep -e '^System-wide memory free percentage:' | sed 's/%//g' | awk '{ print 100-$5 "%"}'
else
  echo -n 'Mem '
  free -m | awk '/^Mem/ {printf("%.2f%", 100*$3/$2);}'
fi
