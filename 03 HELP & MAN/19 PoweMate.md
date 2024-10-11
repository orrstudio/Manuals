# Установка PoweMate

>
> Описание:
> https://wirefall.dyndns.org/powermate.html
>
> Репозиторий программы:
> https://github.com/stefansundin/powermate-linux
>

Клонируем репозиторий
```bash
git clone --recurse-submodules https://github.com/stefansundin/powermate-linux.git
```
Она скопируется в папку `/tmp/powermate-linux`. Перемещаем ее в домашнюю директорию `/home/orr/powermate-linux`, затем скачиваем файл `powermate` из репозитория `https://github.com/stefansundin/powermate-linux/releases` в эту папку. Из этой же папки копируем правила в `/etc/udev/rules.d/`
```bash
sudo cp 60-powermate.rules /etc/udev/rules.d/
```
После копирования файла отключите и снова подключите устройство.
 <br><br>
Запускаем:
```bash
cd powermate-linux
./powermate -d
```
или
```bsh
/home/orr/powermate-linux/powermate -d
```
Так же можно скопировать файл `powermate` в папочку `/bin` и запускать программу без указания пути:
```bash
./powermate -d
```
