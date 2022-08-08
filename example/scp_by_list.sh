#!/bin/bash

# Копирование файлов по ssh (scp) согласно списку (с созданием дерева каталогов)

EXEC_DIR='./exec/'
EXEC_LIST='./exec_files.txt'
SSH_USER='user'
SSH_PASSWORD='12345678'
SSH_HOSTNAME='10.0.5.250'

rm -r ${EXEC_DIR}

for item in $( cat ${EXEC_LIST} | awk '{ print $1 }' ); do
  CURRENT_DIR=$( echo ${item} | sed 's/\/[^/]*$//g' )
  mkdir -pv ${EXEC_DIR}${CURRENT_DIR}
  sshpass -p ${SSH_PASSWORD} scp ${SSH_USER}@${SSH_HOSTNAME}:${item} ${EXEC_DIR}${CURRENT_DIR}
  echo "copy file ($?): ${item}"
done
