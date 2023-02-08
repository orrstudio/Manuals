## Подключение к сeрвeру через SSH:
```
ssh -i ~/.ssh/ssh.key ubuntu@168.138.134.130
```


```
#############################################
If your provider has a network-level firewall
Please make sure you have opened following port for both in/out:
TCP: 8090 for CyberPanel
TCP: 80, TCP: 443 and UDP: 443 for webserver
TCP: 21 and TCP: 40110-40210 for FTP
TCP: 25, TCP: 587, TCP: 465, TCP: 110, TCP: 143 and TCP: 993 for mail service
TCP: 53 and UDP: 53 for DNS service
Your provider seems blocked port 25 , E-mail sending may not work properly.
############################################
```