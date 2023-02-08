# Подключение через SSH:

```
ssh -i ~/.ssh/ssh.key ubuntu@ServeripAddres
```

# Настроки доступа

Чтобы увидеть забытый пароль `WebAdmin console` введите команду:
```
sudo cat /etc/cyberpanel/webadmin_passwd
```
Сбросить, изменить имя и пароль `WebAdmin console`  можно командой:
```
/usr/local/lsws/admin/misc/admpass.sh
```

# Конфигурация сервера

```
Current Disk usage : 150 GB                
------------------------------------------
Visit: https://ServeripAddres:8090
Panel username: admin
Panel password: 
------------------------------------------
Visit: https://ServeripAddres:7080
WebAdmin console username: admin 
WebAdmin console password: 
------------------------------------------
Visit: https://ServeripAddres:8090/rainloop/?admin     
Rainloop Admin username: admin   
Rainloop Admin password: 
```
If your provider has a network-level firewall
Please make sure you have opened following port for both in/out:
```
TCP: 8090 for CyberPanel
TCP: 80, TCP: 443 and UDP: 443 for webserver
TCP: 21 and TCP: 40110-40210 for FTP
TCP: 25, TCP: 587, TCP: 465, TCP: 110, TCP: 143 and TCP: 993 for mail service
TCP: 53 and UDP: 53 for DNS service
```
> Your provider seems blocked port 25 , E-mail sending may not work properly.
