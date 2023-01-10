# Подключение к интернету

При установке можно использовать проводное подключение по Ethernet или безпроводное по WiFi.

### Выводит на экран список сетевых адаптеров.

```
iwconfig
```
или полную информацию
```
ip a
```

### Выводит список доступных сетей:

```
sudo iw dev wlan0 scan | less
```
для выхоа из командной строки `q`

### Включает сетевой адаптер если он выключен:

```
sudo ip link set wlan0 up
```

# Подключение к сети “OrrHome”:
Если внешний USB Wifi Adapter:
```
iwconfig wlan0 essid OrrHome
```
Если встроенный Wifi Adapter:
```
iwctl
```
Выключаем и заново включаем Wifi Adapter через кнопку на клавиатуре, дальше
```
station wlan0 connect OrrHome
exit
ping www.com
```

