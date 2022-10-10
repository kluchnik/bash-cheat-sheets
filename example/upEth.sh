#!/bin/bash
# Просмотр параметров интерфейсов с link state UP

eth_list=$(ip link | grep 'state UP' | awk -F': ' '{print $2}')

echo '-----------------------'
for eth in ${eth_list}; do
  ip a show dev ${eth};
  echo '-----------------------'
done
