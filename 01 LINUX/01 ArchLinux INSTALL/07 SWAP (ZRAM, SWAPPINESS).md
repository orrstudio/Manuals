# Устанавливаем SYSTEM-SWAP (ZRAM)
## Установка для ArchLinux
```
pacman -S systemd-swap
```
## Установка для UBUNTU
### Перед установкой systemd-swap нужно установить `make, git, python-sysv-ipc` и обновиться:
```
sudo apt install make
sudo apt-get update -y
sudo apt-get install -y python-sysv-ipc

git clone https://github.com/Nefelim4ag/systemd-swap.git
cd systemd-swap
make deb
sudo apt install ./systemd-swap_*_all.deb
```
## После чего редактируем файл swap.conf
```
sudo nano /etc/systemd/swap.conf
```
## Изменяем следующие строки как ниже:
```
zram_enabled=1
zram_size=$(( RAM_SIZE * 2 ))
zram_count=${NCPU}
zram_streams=${NCPU}
zram_alg=zstd
zram_prio=32767
```
## Сохраняемся выходим.
## Вводим в автозагрузку:
```
systemctl enable systemd-swap
или
sudo systemctl enable --now systemd-swap
```

</br></br></br>

# Команды для проверки статуса подкачки после перезагрузки:
```
swapon --show
free -h
```

</br></br></br>

# Swappiness & Cache Pressure

## https://gist.github.com/Nihhaar/ca550c221f3c87459ab383408a9c3928

## Изменение значения Swappiness и Cache Pressure. 

## Смотрим значения по умолчанию для `Swappiness` (Оно обычно 60 процентов. То есть как толко останется 60 процентов памяти в оперативке тут же включается файл подкачки) и `Cache Pressure` (который указывает системе какое время нужно хранить открытые файлы в кэше оперативной памяти. Значение 100 заставляет систему удалять такие файлы очень быстро, 0 - держать их в памяти как можно дольше.): 
```
sudo cat /proc/sys/vm/swappiness
sudo cat /proc/sys/vm/vfs_cache_pressure
```
## Чтобы установить значение 10 необходимо выполнить команду:
```
sudo sysctl -w vm.swappiness=10
sudo sysctl -w vm.vfs_cache_pressure=50
```
## И чтобы стало значением по умолчанию создаем для это новый файл конфигурации sysctl.conf по пути: 
```
sudo nano /usr/lib/sysctl.d/sysctl.conf
```
## и прописываем в файл sysctl.conf строчки: 
```
vm.swappiness=10
vm.vfs_cache_pressure=50
```
## Сохраняемся выходим.  
## Перезагружаемся и проверяем:
```
sudo cat /proc/sys/vm/swappiness
sudo cat /proc/sys/vm/vfs_cache_pressure
```
