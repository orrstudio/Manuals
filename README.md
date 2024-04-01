# Права доступа к файлам Linux.


|Binary|Octal|String|Permissions|
|:---:|:---:|:---:|:---:|
|000|0 (0+0+0)|- - -|No Permision|
|001|1 (0+0+1)|- - X|Execute|
|010|2 (0+2+0)|- W -|Write|
|011|3 (0+2+1)|- W X|Write + Execute|
|100|4 (4+0+0)|R - -|Read|
|101|5 (4+0+1)|R - X|Read + Execute|
|110|6 (4+2+0)|R W -|Read + Write|
|111|7 (4+2+1)|R W X|Read + Write + Execute|

