#!/bin/bash
# Активация всех сетевых интерфейсов

eth_list=$(ip a | awk -F': ' '{print $2}' | tr -s '\n')

for eth in ${eth_list}; do
  ip link set dev ${eth} up;
  ip link show dev ${eth} | grep -E '^[0-9]*:';
done
