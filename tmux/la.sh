#!/bin/bash

uptime | sed -e 's/.*average: //g' -e 's/,//g' | awk '{print $1, $2, $3}'