## Подключение к серверу "C-Panel.ml" через SSH:
```
ssh -i ~/.ssh/ssh.key ubuntu@129.148.61.88
```
#
|Server NAME|User Name & Password|IP Address|
|-|-|:-:|
|C-Panel.ml<br/>c-panel|ubuntu<br>solaris_opc|129.148.61.88<br/>10.0.0.59|

Чтобы увидеть забытый пароль `WebAdmin console` введите команду:
```
sudo cat /etc/cyberpanel/webadmin_passwd
```
Сбросить, изменить имя и пароль `WebAdmin console`  можно командой:
```
/usr/local/lsws/admin/misc/admpass.sh
```

```
#################################################
Current Disk usage : 100 GB                

Visit: https://129.148.61.88:8090
Panel username: admin
Panel password: HL3nCZf51mS7dCn8

Visit: https://129.148.61.88:7080
WebAdmin console username: admin 
WebAdmin console password:       

Visit: https://129.148.61.88:8090/rainloop/?admin     
Rainloop Admin username: admin   
Rainloop Admin password: 

##################################################
If your provider has a network-level firewall
Please make sure you have opened following port for both in/out:
TCP: 8090, 888 for CyberPanel
TCP: 80, TCP: 443 and UDP: 443 for webserver
TCP: 21 and TCP: 40110-40210 for FTP
TCP: 25, TCP: 587, TCP: 465, TCP: 110, TCP: 143 and TCP: 993 for mail service
TCP: 53 and UDP: 53 for DNS service
Your provider seems blocked port 25 , E-mail sending may not work properly.
##################################################
```