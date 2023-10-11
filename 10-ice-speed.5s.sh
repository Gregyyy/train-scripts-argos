#!/usr/bin/env bash

output=$(curl -s https://iceportal.de/api1/rs/status)

if [ $(echo $output | wc -c) -gt 1 ]; then
  ice_speed=$(echo $output | jq --raw-output ".speed")
  ice_speed="${ice_speed%??}"
  internet=$(echo $output | jq --raw-output ".internet")
 
  echo "$ice_speed km/h"
  echo "---"
  echo "Internet: $internet"
else
  echo "NIT"
fi
