# НАСТРОЙКИ SAMBA
## Устанавливаем пакеты:
```
sudo yay -S samba smbclient gvfs-smb cifs-utils
```
## После установки настраиваем:  
## Стартуем службу:
```
sudo samba
```
## Стартуем при входе в систему.
```
sudo systemctl enable smb.service
```
## Создаем файл: 
```
sudo touch /etc/samba/smb.conf
```
## Вставляем в этот файл следующий текст `sudo nano /etc/samba/smb.conf`:
```
[publicshare]
comment = Samba on Linux
path = /home/user/publicshare
valid users = orr
read only = no
browsable = yes
writable = yes
```
## Чтобы установить пароль для пользователя самба. 
```
sudo smbpasswd -a $USER
```
## Создаем папку общего доступа по пути которой указали в файле:
```
mkdir ~/publicshare
```
## Перезагружаемся или перезапускаем службы.  
## Для проверки вводим в проводнике `Ctrl + L` следующюю строку:
```
smb://192.168.0.102/publicshare
``` 