#!/bin/bash

# Простое преобразование большого xml документа на несколько в формате csv
# Формат документа: 
# <data>
#    <row>Данныйе блока 1<\row>
#    <row>Данныйе блока 2<\row>
#    ...
#    <row>Данныйе блока N<\row>
# <\data>
# xml взят с ресурса: https://fsrar.gov.ru/opendata/7710747640-reestr/

FILE_IN='data-20220701t0000-structure-20190918t0000.xml'
MAX_LINE=1000

echo "in file: ${FILE_IN}"
echo "max line in one file: ${MAX_LINE}"
echo 'create header...'

HEADER='LINE'
while IFS= read -r line
do
  HEADER+=$( echo ${line} | grep -E '^<\/' | sed -e 's/<\//;/g' | sed -e 's/>.*//g' )
  if [[ -n $( echo ${line} | grep '</row>' ) ]]; then
    break
  fi
done < <(sed -e 's/<\//\n<\//g' < ${FILE_IN})

echo 'create csv file...'

NUMBER_LINE=1
NUMBER_FILE=1
ALL_LINE=1

while IFS= read -r line
do
  FILE_OUT="data_${NUMBER_FILE}.csv"
  if [[ ${NUMBER_LINE} -eq 1 ]]; then
    echo $HEADER | sed -e 's/;/\t/g' > ${FILE_OUT}
  fi
  echo -ne "\rfile: ${FILE_OUT} (${NUMBER_LINE}) LINE:${ALL_LINE}      "
  echo "${ALL_LINE}<number>${line}" | sed -e 's/\t/ /' | sed -e 's/<.[^/]*>/\t/g' >> ${FILE_OUT}
  let NUMBER_LINE+=1
  let ALL_LINE+=1
  if (( ${NUMBER_LINE} > ${MAX_LINE} )); then
    NUMBER_LINE=1
    let NUMBER_FILE+=1
  fi
done < <(sed -e 's/<\/row><row>/\n/g' <(sed -e 's/^.*<data><row>//g' < ${FILE_IN}))
