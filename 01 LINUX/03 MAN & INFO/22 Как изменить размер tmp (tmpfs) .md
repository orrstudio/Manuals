


# [Как изменить размер tmp (tmpfs) налету](http://www.michurin.net/tools/remount-resize-tmpfs.html)

## Смотрим, сколько места у нас сейчас:
## Этa команда покажет все
```
df -h
```
## Этa команда покажет /tmp
```
df -h /tmp
```
## Этa команда покажет /dev/shm
```
df -h /dev/shm
```
## или эта
```
df -h | grep -Ei 'shm|size'
```
## А теперь увеличим нужную tmpfs в ручную без перезагрузки. Оно увеличится до следующей перезагрузки. Изменяем размер так:
```
mount -o remount,size=6G /tmp
```
## и или
```
mount -o remount,size=6G /dev/shm
```
## Если захотите увеличить на постоянной основе придется колдовать в файле `/etc/fstab` нужно будет добавить строчку: 
```
tmpfs /dev/shm tmpfs defaults,rw,nodev,nofail,noatime,nosuid,size=6G 0 0 0
```
## и или 
```
tmpfs /tmp tmpfs defaults,rw,nodev,nofail,noatime,nosuid,size=6G 0 0 0
```
