#!/bin/bash

echo -------------------------
echo 'Cравнение данных'
txt_a='a 1\na 2\nb 1\nb 2\nc 1\nc 2\nd 1\nd 2'
txt_b='a 1\nb 2\nc 1\nc 3\nd 1\nd 2\nd 3'
echo -------------------------
echo 'Первые тестовые данные:'
echo -e ${txt_a}
echo 'Вторые тестовые данные:'
echo -e ${txt_b}
echo -------------------------
echo 'Построчное сравнение двух файлов:'
sdiff -bW <(echo -e $txt_a) <(echo -e $txt_b)
