
## Docker

Очень удобная вещь для разворачивания приложений. Требует минимум настройки и система не засирается хвостами.

```bash
$ yay -S docker docker-compose

# Добавим пользователя в группу docker, чтобы использовать команду docker без sudo
$ sudo usermod -aG docker $USER

# Перегрузимся
$ reboot
```

Юсаге:

```bash
# (Пере)собрать и запустить контейнеры
$ docker-compose up -d

# Остановить контейнеры
$ docker-compose stop

# Запустить остановленные ранее контейнеры
$ docker-compose start

# Остановить и удалить контейнеры
$ docker-compose down
```

`docker-compose.yml`:
```yaml
version: '3.9'

services:
  postgres:
    container_name: postgres
    image: postgres:alpine
    env_file: .env
    networks:
      - internal
    ports:
      - '54320:5432'
    restart: unless-stopped
    volumes:
      - ./data/postgres:/var/lib/postgresql/data:rw

  pgadmin:
    container_name: pgadmin
    image: dpage/pgadmin4
    depends_on:
      - postgres
    env_file: .env
    networks:
      - internal
    ports:
      - "5050:80"
    restart: unless-stopped
    volumes:
      - ./data/pgadmin:/var/lib/pgadmin:rw

  redis:
    container_name: redis
    image: redis:alpine
    networks:
      - internal
    ports:
      - "63790:6379"
    restart: unless-stopped
    volumes:
      - ./data/redis:/var/lib/redis:rw

networks:
  internal:
```

`.env`:
```bash
POSTGRES_USER=docker
POSTGRES_PASSWORD=password
POSTGRES_DB=db
PGADMIN_DEFAULT_EMAIL=pgadmin4@pgadmin.org
PGADMIN_DEFAULT_PASSWORD=admin
```

В pgadmin заходим через `localhost:5050`, в качестве имени хоста базы указываем имя сервиса, те `postgres` вместо традиционного `localhost` и порт `54320`,

## Snapper

Snapper ‒ это менеджер снапшотов (снимков состояния файловой системы) для **Btrfs**. Он может их создавать/удалять по таймеру, а так же позволяет восстанавливать отдельные файлы.

```bash
$ yay -Sy snapper
```

Установим так же хук, который будет делать снапшоты после каждого обновления пакетов:

```bash
$ yay -S snap-pac
```

Снапшоты делаются каждый час, если не переопределить это поведение:

```bash
$ systemctl edit snapper-timeline.timer

[Timer]
OnCalendar=<period>
```

Настройки по-умолчанию предполагают слишком длительное хранение снапшотов, что может привести к постоянной проблеме нехватки места, если у вас SSD маленького объема.

Создаем новый шаблон файла конфигураций, чтобы не редактировать дефолтный:

```bash
$ cd /usr/share/snapper/config-templates
$ cp default config
$ micro config
```

Где значения `TIMELINE_LIMIT_<PRERIOD>` указывают сколько хранить N последних снапшотов за час (HOURLY)/день (DAILY)/неделю (WEEKLY)/месяц (MONTHLY)/год (YEARLY).

Пример конфига:

```conf
...
TIMELINE_LIMIT_HOURLY="10"
TIMELINE_LIMIT_DAILY="7"
TIMELINE_LIMIT_WEEKLY="0"
TIMELINE_LIMIT_MONTHLY="0"
TIMELINE_LIMIT_YEARLY="0"
...
```

Храним 10 последних за час и 7 ежедневных (хранится самый первый за день).

```bash
snapper -c root create-config -t config /
snapper -c home create-config -t config /home
```

```bash
systemctl enable snapper-timeline.timer
systemctl enable snapper-cleanup.timer
```

### Восстановление удаленного файла

```bash
# Смотрим номер последнего снапшота
sudo snapper -c <config> list -a

# Восстанавливаем файл
sudo snapper -c <config> undochange 0..<number> /path/to/file
```

### Заменяем корневой сабвольюм на снапшот

В более сложных случаях может потребоваться восстановление системы:

```bash
$ sudo su

$ mount /dev/mapper/root /mnt

$ ls /mnt 
@ @home @.snapshots ...

$ cd /mnt

# Смотрим снапшоты
$ ls @.snaphosts
... 42 ...

# Переименовываем старый корневой сабвольюм
$ mv @ @old

# Помним, что snapshot и subvolume это одно и тоже, считай, а значит мы монтировать снапшот 
# Делаем снимок снапшота, по-сути копирем его, так как снапшоты, создаваемые snapper readonly
$ btrfs sub snap @.snaphots/42/snapshot @

# Редактируем fstab, если он содержит subvolid
# Ищем `subvol=/@` и удаляем `subvolid=N,`
$ micro @/etc/fstab

# Или же можно прописать subvolid
$ sudo btrfs sub show @ | grep 'Subvolume ID'
        Subvolume ID:           XXX

# Монтируем сабвольюм
$ mount -o remount /

# Теперь можно удалить @old
$ btrfs su de @old
```

## Используйте Flatpak для графических приложений


Для установки графических приложений я советую использовать flatpak:

```bash
$ yay -S flatpak

$ flatpak install com.github.Eloston.UngoogledChromium
```

Его плюсы:

* Большая безопасность, так как приложения запускаются в изолированных контейнерах и не имею доступа к системным каталогам. 
* Приложение преднастроены и идут вместе со всем необходимым для их запуска ‒ рантаймом. По сути у нас параллельно запускатся другая операционная систем, которая и запускает приложения [ из Flatpak ].
* Поддерживаются частичные обновления, те при вместо скачивания архива с библиотекой каждый раз, мы скачиваем только изменения. Например, для того же Telegram при обновлении нужно будет выкачать всего пару мегабайт вместо 40.

Минусы:

* Рантайм занимает дополнительное место, но из-за частичных обновлений мы все равно экономим место.
* Так как приложения запускаются в другой системе, то они не имеют доступа к _нашим_ системным утилитам в `/usr/bin` и тд. Это делает установку IDE из Flatpak абсолютно бесмысленной, хоть они там и есть. Например, [тут](https://github.com/redhat-developer/vscode-java/issues/510) можно почитать про страдания отдельных индивидов, пытающихся Java засунуть в контейнеры.

Касательно последнего выдержка из [документации](https://docs.flatpak.org/en/latest/sandbox-permissions.html#filesystem-access):

```
As mentioned above the host option does not actually provide complete access to the host filesystem. The main rules are:

* These directories are blacklisted: /lib, /lib32, /lib64, /bin, /sbin, /usr, /boot, /root, /tmp, /etc, /app, /run, /proc, /sys, /dev, /var
* Exceptions from the blacklist: /run/media
* These directories are mounted under /var/run/host: /etc, /usr
```

Конечно, делать все нужно без фанатизма. Стандартные приложения для вашего **DE** лучше ставить из основных репозиториев Arch Linux. 

# Дополнения

## Добавление загрузочной записи

### Linux

```bash
# Загрузочный раздел: /dev/nvme0n1p4
# EFI не удалено
efibootmgr -c -d /dev/nvme0n1 -p 4 -L "Linux Boot Manager" -l '\efi\boot\bootx64.efi'

# Удаление записи
efibootmgr -b 000X -B

# Список записей, порядок загрузки и тп
efibootmgr -v

# Смена порядка. См вывод предыдущей команды
efibootmgr -o 0002,0001,...
```

### Windows

Проблема: после установки/обновления Windows пропадает загрузочная запись Linux.

Запускаем терминал (Windows Terminal) от имени администратора (`Win`+`X`, `Alt`+`A`) и выполняем:

```ps
PS C:\Users\yourname> bcdedit /copy '{bootmgr}' /d "Arch Linux Boot"
The entry was successfully copied to {6c4580c1-e401-11ec-b643-089798e96d74}.
PS C:\Users\yourname> bcdedit /set '{6c4580c1-e401-11ec-b643-089798e96d74}' path \efi\boot\bootx64.efi
The operation completed successfully.
PS C:\Users\yourname> bcdedit /set '{fwbootmgr}' displayorder '{6c4580c1-e401-11ec-b643-089798e96d74}' /addfirst
The operation completed successfully.
PS C:\Users\yourname>
```

## Восстановление Windows EFI (после удаления)

Скачайте образ Windows с сайта [Microsoft](https://www.microsoft.com/ru-ru/software-download/windows10ISO).

Если у вас есть флешка с Ventoi и Windows, то пропускаем запись загрузочной флешки.

Установите утилиту для создания загрузочных флешек для Windows:

```bash
$ yay -S woeusb
```

Записываем образ:

```bash
$ sudo woeusb --device ~/Downloads/Windows...iso /dev/sdX
```

Теперь нам нужно загрузиться с флешки с Windows, проделав операции по смене приоритетов...

Либо можно почитать `man efibootmgr`.

Грузимся с флешки, ожидаем пока закончится загрузка Windows и нажимаем `Shift` + `F10`. Откроется консоль.

В консоли выполняем следующее:

```batch
> diskpart
DISKPART> list volume
:: Смотрим, где у нас установлена Windows
:: Если вы установили, Arch Linux на другой диск, то удалите загрузочный раздел винды (но не сам раздел с Windows! см. `help`)
DISKPART> exit

:: Устанавливаем Windows EFI на загрузочный раздел
> bcdboot c:\windows
```

