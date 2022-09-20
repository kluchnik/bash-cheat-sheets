# Использование утилиты tar

## Запакавать в архив  

```
tar -cvf archive.tar /example
tar -cvzf archive.tar.gz /example
```
* -с - команда, которая означает «создать архив»  
* -f - команда на упаковку файлов и директорий в один файл архива  
* -v - включает визуальное отображение процесса архивации  
* -z | -j - использовать для сжатия GZip | BZip2  
* --exclude - исключить данные из врхива ```--exclude=example/uploads --exclude=example/cache```  

## Просмотр архива  

```
tar -tvf archive.tar.gz
```

## Распакавать из архива  

```
tar -xvf archive.tar -C /tmp
tar -xvzf archive.tar.gz -C /tmp
```
