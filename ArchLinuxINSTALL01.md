<div align="center">
<img src="https://archlinux.org/static/logos/archlinux-logo-dark-90dpi.ebdee92a15b3.png" title="Arch Linux Logo">
</div>


# Установка Arch Linux

## Подготовка к установке

[Качаем Ventoy](https://www.ventoy.net/en/download.html).

![Screenshot 2022-06-01 110230](https://user-images.githubusercontent.com/12753171/171402454-823a41ce-7f53-4670-bbfc-0cf179e35f4f.png)

Выбираем `Option --> Partition style --> GPT` как на скрине.

Качаем [ISO-образ Arch Linux](https://archlinux.org/download/) [ и копируем/перемещаем ] в корень на созданном разделе флешки.

![Screenshot 2022-06-01 110523](https://user-images.githubusercontent.com/12753171/171402749-864475ac-6241-4881-9c53-a8707f67990c.png)

Теперь нужно выделить немного места под **Arch Linux**.

Запускаем **Explorer/Проводник** и кливаем правой по иконке **This PC/Этот Компьютер**, выбираем `Manage` (перед этим нужно выбрать `Show more options`):

![Screenshot 2022-06-01 130403](https://user-images.githubusercontent.com/12753171/171412260-c81f18b4-3861-4d94-810e-3b00a68f7e50.png)

В `Disk Managment` нужно сжать какой-нибудь раздел, выделив под Arch 80-100GB:

![Screenshot 2022-06-01 130613](https://user-images.githubusercontent.com/12753171/171412706-0f8f6dca-8a11-4347-aade-7e8f31133faa.png)

## Заходим в UEFI

При появлении логотипа жмем раза клавиши `F2` /  `F12` / `Del` (зависит от производителя).

Во вкладке `Boot` отключаем `Secure Boot`. Это виндовое изобретение, которое не позволяет запускать неподписанные **EFI**. Можно еще включить `Launch CSM` / `CMS Boot` / `CMS OS` / `Legacy OS` для возможности загрузки с устройств, содержащих метку **MBR** (может потребоваться, например, для установки Windows 7). В этой же вкладке меняем приоритет загрузки устройств, делая флешку первой. Сохраняем изменения и выходим.

Когда загрузится Ventoy, выбираем в меню Arch Linux... 

## Настройка WiFi

Если вы подключены от провода, то ничего настраивать не надо.

Для Wi-Fi нужно выполнить ряд действий:

```bash
$ iwctl

# Получим список сетевых интерфейсов
[iwd]# device list
                           Devices
-------------------------------------------------------------
  Name          Address          Powered    Adapter    Mode
-------------------------------------------------------------
  wlan0         ...              on         ...        ...

# Сначала просканируем сети
[iwd]# station <interface> scan

# А потом посмотрим все сети к которым можно подключиться
[iwd]# station <interface> get-networks
                               Available networks                             *
--------------------------------------------------------------------------------
    Network name                    Security          Signal
--------------------------------------------------------------------------------
    ...  
    <sid>                           psk               ****

# Подключаемся
[iwd]# station <interface> connect <sid>
```

Проверка:

```bash
$ ping -c5 ya.ru
```
## Синхронизация пакетов

База пакетов в репозитории постоянно обновляется...

```bash
$ pacman -Syu
```

## Установка с помощью помощника

```bash
$ archinstall
```

Далее переходим к разделу [Настройка](#system-settings).

## Ручная установка: Luks + Btrfs (Expert Mode)

### Создание файловой системы

Для Btrfs лучше всего подходит SSD.

Смотрим список и разделов и устройств:

```bash
fdsik -l
```

Пусть нам нужно поставить систему на `nvme0n1`.

Размечаем диск под систему, руководствуясь правилом от большего к меньшему:

```bash
cfdisk nvme0n1 
```

Должно получиться что-то типа этого:

| раздел | точка монтирования | тип файловой системы | размер | комментарий |
| -- | -- | -- | -- | -- |
| nvme0n1p1 | / | luks | Весь объем _минус_ размер efi/boot | шифрованный раздел |
| nvme0n1p2 | /boot | vfat | где-то 512 MiB - 1 GiB | загрузочный раздел |

Размещая тот же boot в конце диска, мы сможем в последующем менять его размер, откусывая место от предыдущего.

Если у вас уже установлена Windows, пропускайте шаг с форматированием загрузочного раздела.

Форматируем загрузочный раздел:

```bash
mkfs.vfat -F32 -n BOOT /dev/nvme0n1p2
```

Созданному разделу нужно выставить флаг boot, чтобы UEFI с него грузилось:

```bash
$ parted /dev/nvme0n1  
GNU Parted 3.5
Using /dev/nvme0n1
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) p                                                                
...
 2      499GB   500GB  1074MB  fat32        Boot        msftdata

(parted) set 2 boot on                                                    
(parted) q                                                                
Information: You may need to update /etc/fstab.
```

Создаем шифрованный раздел:

```bash
cryptsetup luksFormat /dev/nvme0n1p1
```

В качестве пароля указывайте фразу длинее 20 символов. Не используйте пароли, которые вами уже использовались на ресурсах, напрямую подключенных к СОРМ (Вконтакте, Одноклассники, Mail, Yandex, Rambler и тп), избегайте распространенных паролей, которые утекли в сеть, и, конечно, же не вздумайте проверять стойкость пароля через сайт Касперского (вы его просто добавите в базу для брута, которую используют правоохранительные органы). В качестве пароля можно использовать фразу на одном из вымирающих языков, например, абхазском или ады-гей-ском, набранную на английской раскладке. Взломостойкими являются бредовые фразы, так как такой пароль нельзя подобрать с помощью цепей Маркова (например, "краб катит листья яблок"). Так же можно намеренно допускать ошибки в словах. Помните **О**лбанский и «Онотоле, пыш-пыш»?

Почему Luks, а не аппаратное шифрование? — Диски с аппаратным шифрованием (SED) уже ломал какой-то энтузиаст из Нидерландов, путем замены прошивки, ему удавалось без пароля получить доступ к данным. Этот трюк был проделан на старых SSD EVO 840 и EVO 850... [Статья в журнале ксакеп](https://xakep.ru/2018/11/06/ssd-flaws/). Новые диски вроде как избавлены от этих проблем, _но это не точно_ и никто не гарантирует отсутствия аппаратных закладок, и никак не решается проблема с "быстрым переподключением" к другому устройству для считывания данных. Другие недостатки аппаратного шифрования: UEFI от некоторых производителей, например, Acer, "забывают" старые записи Boot, что делает загрузку невозможной. Так же проблемой является невозможность ухода в suspend, так как отключение питания диска переводит его в залоченное состояние (официальная сборка не поддерживает suspend). К сожалению программное шифрование намного медленее (где-то в 1.5x), потому как шифрование в самошифрующихся дисках осуществляется отдельным AES чипом. Стоит упомянуть, что значительная часть SATA SSD поддерживает установку пароля, но эти пароли часто [хранятся в открытом виде](https://club.esetnod32.ru/articles/analitika/nepristupnaya-krepost/), либо есть сервисный пароль по умолчанию, например, последние 7 символов серийного номера, который делает всю эту затею бесмысленной + метод с помощью перепрошивки контроллера диска как и в случае со старыми моделями с SED.

Открываем шифрованный раздел:

```bash
cryptsetup luksOpen /dev/nvme0n1p1 crypt
```

Последний аргумент это имя под под которым блочное устройство будет доступно в `/dev/mapper`.

Создаем на шифрованном разделе файловую систему Btrfs:

```bash
# Будет доступен так же доступен как /dev/disk/by-label/arch 
mkfs.btrfs -L arch /dev/mapper/crypt
```

Btrfs ‒ это одна из самых продвинутых файловых систем в Linux (ZFS считается лучшей, но она не включена в ядро). Она поддерживает механизм CoW (copy-on-write), когда все копии файла суммарно занимают на диске столько же места сколько оригинал, а при изменениях файлов данные всегда пишутся в новые страницы. Плюсом такого подхода является, то что мы можем делать снимки состояния подтома на лету, а потом вернуть это состояние, например, после неудачного обновления или удаления чего-то нужного, просто отредактировав `/etc/fstab`, и выполнив `mount -o remount mountpoint` (главное не забыть сделать снапшот доступным для записи). Для автоматического создания снапшотов я советую использовать утилиту snapper. За почти 4 года использования Btrfs я не сталкивался с какими-то критическими багами, и она меня не раз спасали от утраты данных. Простой пример: `sudo rm -rf /`.

В Btrfs нет привычных разделов, есть только подтома, отличительной особенностью которых является динамический размер (который можно ограничить с помощью quota), что роднит их с обычными каталогами. Снапшоты, если упускать некоторые детали, являются теми же самыми подтомами, те их можно монтировать и выполнять аналогичные операции.

Монтируем RootFS:

```bash
mount -o compress=zstd /dev/mvme0n1p1 /mnt
```

Возможные сабвольюмы:

| subvolume | mount | описание |
| -- | -- | -- | 
| `@` | `/` | Корневой каталог (системные файлы) |
| `@home` | `/home` | Домашний каталог с пользовательскими данными. Нужен отдельный так как при откате системы к предыдущему состоянию очень важно сохранить существующий прогресс (куки браузера, конфиги, документы, файлы проектов и т.д.) | 
| `@.snapshots` | `/.snapshots` |  Содержит снапшоты корня, которые создает snapper |
| `@home.snapshots` | `/home/.snapshots` |  Содержит снапшоты хомяка, которые создает snapper |
| `@machines` | `/var/lib/machines` |  Если не существует, то создаст systemd |
| `@portables` | `/var/lib/portables` |  Если не существует, то создаст systemd |
| `@docker_btrfs` | `/var/lib/docker/btrfs` |  Докер создает сабвольюм по указанному пути |
| `@var_lib` | `/var/lib` |  Вместо создания `@machines`, `@portables`, `@docker` можно создать только этот, если в `/var/lib` не будет храниться чего-то важного (предполагается, что будут делаться снапшоты только корня и/или хомяка) |
| `@var` | `/var` |  Аналогично выше описанному |
| `@var_log` или просто `@log` | `/var/log` | Содержит кучу файлов, которые пишутся маленькими частями, от чего занимаемое ими место пухнет. Должен монтироваться с nodatacow |
| `@swap` | `/swap` или `/var/swap`, или `/var/lib/swap` |  Хранит файл подкачки. Должен монтироваться с nodatacow |


Подтома `@machines`, `@portables`, `@.snapshots`, `@home.snapshots` и `@docker_btrfs` (опционально при использовании docker) нужны чтобы не заморачиваться с переносом вложенных подтомов при замене старого подтома на снапшот. Подтом с вложенными подтомами/снапшотами нельзя удалить, а на вложенных подтомах у нас по умолчанию снапшоты, а так же systemd и docker создают новые.

Создаем нужные подтома:

```bash
btrfs sub create /mnt/@
btrfs sub create /mnt/@home
btrfs sub create /mnt/@.snapshots
btrfs sub create /mnt/@home.snapshots
btrfs sub create /mnt/@machines
btrfs sub create /mnt/@portables
btrfs sub create /mnt/@docker_btrfs
```

Отмонтируем RootFS:

```bash
umount /mnt
```

Монтируем подтома и загрузочный раздел:

```bash
# Смонтируем корневой раздел
mount -o subvol=@,compress=zstd /dev/mapper/crypt /mnt

# Создадим каталоги для монтирования
# Хинт: если примонтироваться с опцией x-mount.mkdir, то каталог создастся автоматически
mkdir /mnt/{boot,home}

# Примонтируем остальное
mount /dev/nvme0n1p2 /mnt/boot

# будет применино родительское сжатие
mount -o subvol=@home /dev/mapper/crypt /mnt/home

# докер и виртуалки создают подтома, если по заданным путям их не существует
mkdir -p /mnt/var/lib/{docker/btrfs,machines,portbales}
mount -o subvol=@machines /dev/mapper/crypt /mnt/var/lib/machines
mount -o subvol=@portables /dev/mapper/crypt /mnt/var/lib/portables

# для снапшотов
mkdir /mnt{,/home}/.snapshots
mount -o subvol=@.snapshots /dev/mapper/crypt /mnt/.snapshots
mount -o subvol=@home.snapshots /dev/mapper/crypt /mnt/home/.snapshots
```

Обратите внимание на параметр **compress** ‒ это тип сжатия для данных, так же через двоеточие можно указать уровень сжатия. В данный момент лучшим методом сжатия является ZSTD с уровнем сжатия 3 (по-умолчанию).

### Установка системных пакетов

Установим ядро, драйвера и базовый набор пакетов:

```bash
pacstrap /mnt base base-devel linux linux-firmware linux-headers btrfs-progs cryptsetup efibootmgr ntfs-3g exfat-utils git micro terminus-font wget xorg zsh
```

### Генерация fstab

А теперь сгенерируем fstab, файл который содержит указания системы что и куда монтировать при загрузке:

```bash
genfstab -U /mnt | sed 's/,relatime/,noatime,commit=300,discard=async/' >> /mnt/etc/fstab
```

Тут мы изменили с целью оптимизации некоторые параметры монтирования:

* Каждый раз когда мы открываем файл, записывается время его изменения, `noatime` запрещает запись времени модификации файла.
* Btrfs хранит изменения файлов в оперативной памяти, сохраняя их через интервал указанный в секундах в параметре`commit`.
* `discard=async` предотвращает микрофризы при выполнении TRIM.

Первые два параметра продлевают ресурс SSD.

### Вход в окружение chroot

Делаем chroot и "грузимся" в систему:

```bash
arch-chroot /mnt
```

### Время и локаль

Редактируем `/etc/locale.gen`:

```bash
$ micro /etc/locale.gen
```

Нужно найти и расскоментировать (убрать в начале `#`) сл строки:

```
en_US.UTF-8 UTF-8
ru_RU.UTF-8 UTF-8
```

Генерируем локали:

```bash
$ locale-gen
Generating locales...
  ru_RU.UTF-8... done
  en_US.UTF-8... done
Generation complete.
```

Задаем локаль по-умолчанию:

```bash
localectl set-locale LANG=en_US.UTF-8
```

Смотрим список раскладок клавиатуры для консоли Linux (та в которую можно попасть, нажав <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>F1-6</kbd>):

```bash
localectl list-keymaps | grep ru
```

Загружаем раскладку:

```bash
loadkeys ruwin_alt_sh-UTF-8
```

Теперь мы можем по alt+shift переключать раскладку с английской на русскую.

Посмотрим шрифты для консоли:

```bash
ls /usr/share/kbd/consolefonts | less
```

Загрузим какой-нибудь шрифт с поддержкой кириллицы:

```bash
# 1080p
setfont ter-v18n
# 4k
setfont ter-v20b
```

Эти настройки нужно сохранить:

```bash
echo 'KEYMAP="ruwin_alt_sh-UTF-8"' >> /etc/vconsole.conf
 
# либо так
localectl set-keymap --no-convert ruwin_alt_sh-UTF-8

# И сохраняем шрифт
echo 'FONT="ter-v18n"' >> /etc/vconsole.conf
```

Ищем нужную временную зону:

```bash
$ timedatectl list-timezones | grep Mosc
Europe/Moscow
```

Задаем временную зону:

```bash
timedatectl set-timezone 'Europe/Moscow'
```

Включаем синхронизацию времени с NTP-сервером:

```bash
timedatectl set-ntp true
```

Опционально устанавливаем часы компьютера:

```bash
hwclock --systohc
```

###  Настройка имени хоста (машины)

В имени хоста можно использовать латинские символы, цифры, `-`, `_`, `.`... 

В качестве имени хоста можно указать:

* если у вас сервер, то доменное имя;
* _username_-laptop или _username_-pc _username_-LaptopModel, _username_-archlinux или _username_-arch;
* фамилию, кличку, звезду, планету... случайны набор символов;
* не указывать его, оставив по умолчанию **archlinux**.

Имя хоcта нужно для вашей идентификации в локальной сети. Это имя можно использовать вместо локального **ip-адреса**, который может измениться. Например, вы можете через VPN подключиться к локальной сети в офисе, а далее через `ssh your_hostname` к своей машине... 

```bash
hostnamectl set-hostname YOURHOSTNAME
```

Редактируем хосты:

```bash
micro /etc/hosts
```

Содержимое:

```hosts
127.0.0.1 localhost
::1 localhost
127.0.1.1 <YOUR_HOSTNAME>.localdomain <YOUR_HOSTNAME>
```

### Initramfs

Linux грузится с помощью образа **initramfs**: сначала файловая система монтируется в оперативную память (Initial-RAM-File-System), загружаются драйвера, монтируется реальная файловая система, и наконец мы получаем возможность войти в систему.

Редактируем настройки образа в файле `/etc/mkinitcpio.conf`:

```bash
micro /etc/mkinitcpio.conf
```

Добавляем в образ поддержку btrfs (не является частью ядра). `MODULES` и `BINARIES` должны выглядеть примерно так:

```conf
MODULES=(btrfs)
BINARIES=(/usr/bin/btrfs)
```

В хуки добавляем `encrypt btrfs` до filesystems:

```conf
HOOKS=(... encrypt btrfs filesystems ...)
```

Хуки — это скрипты с функцией `run_hook`, которые выполняются последовательно при загрузке **initrmafs**.

Пример:

```bash
$ cat /usr/lib/initcpio/hooks/btrfs
#!/usr/bin/ash

run_hook() {
    btrfs device scan
}

# vim: set ft=sh ts=4 sw=4 et:
```

* `encrypt` запрашивает пароль от зашифрованного устройства и добавляет его в `/dev/mapper`;
* `btrfs` — проверяет блочные устройства на наличие одноименной файловой системы;
* `filesystems` — монтирует файловую систему;
* ...

Изменим способ сжатия образа и уровень:

```bash
#COMPRESSION="lzma"
COMPRESSION="xz"
#COMPRESSION="lzop"
#COMPRESSION="lz4"

# COMPRESSION_OPTIONS
# Additional options for the compressor
COMPRESSION_OPTIONS=(-9)
```

Теперь сгенериреум образ:

```bash
mkinitcpio -p linux
```

### Добавление пользователя


Создаем пользователя:

```bash
useradd -m -G users -s /bin/zsh <YOUR_USERNAME>
```

* `-m` ‒ создать каталог пользователя в `/home`;
* `-G` ‒ дополнительные группы, передаваемые через запятую. Добавив себя в группу `systemd-journal`, вы сможете без sudo просматривать логи с помощью `journalctl`...

Устанавливаем для него пароль:

```bash
$ passwd <YOUR_USERNAME>
New password: 
Retype new password:
passwd: password updated successfully

```

В целях безопасности лочим пользователя root, чтобы из под него нельзя было авторизоваться:

```bash
$ passwd -l root
passwd: password changed.
```

Разрешаем sudo для себя (одноименной группы, создаваемой по умолчанию):

```bash
echo '%<YOUR_USERNAME> ALL=(ALL:ALL) ALL' > /etc/sudoers.d/<YOUR_USERNAME>
```

Так же можем отредактировать sudoers, разрешив пользователям в группе wheel доступ к sudo:

```bash
$ micro /etc/sudoers

# Нужно найти раскомментировать строку:
%wheel ALL=(ALL:ALL) ALL
```

Часто в инструкциях пользователя добавдяют в группу **sudo**. Группы **wheel** и **sudo** делают одно и то же: дают доступ к выполнению команды **sudo**. Так уж исторически сложилось, что в debian-based дистрибутивах используют группу **sudo**, а в RHEL ‒ **wheel**. 

### Загрузчик системы

Загружаться мы будем через systemd-boot. Для этого установим EFI:

```bash
bootctl install
```

Создаем загрузочную запись. Для начала сохраним PARTUUID шифрованного раздела в конфиг, так как его запомнить проблематично:

```bash
blkid -o value -s PARTUUID /dev/nvme0n1p2 > /boot/loader/entries/arch-ecrypted.conf
```

При монтировании через `/etc/fstab` лучше использовать **UUID**, так как они уникальны (**PARTUUID** уникален только для **GPT** таблицы).  Жесткие диски типа `/dev/sda` или `/dev/sdb`  могут изменить буквы при переподключении. Это правило не распространяется на [виртуальные блочные устройства](https://ru.wikipedia.org/wiki/Device_mapper) типа `/dev/mapper/cryprt`.

Отредактируем конфиг:

```bash
micro /boot/loader/entries/arch-ecrypted.conf
```

Он должен выглядеть примерно так:

```conf
title   Encrypted Arch Linux
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
linux   /vmlinuz-linux
options cryptdevice=PARTUUID=fa65a43e-eb75-48f0-aee1-975a50c2e00d:cryptroot:allow-discards root=/dev/mapper/cryptroot rootflags=subvol=/@ rw nvme_core.default_ps_max_latency_us=0
```

* Параметр `nvme_core.default_ps_max_latency_us=0` нужен для некоторых моделей **SSD M.2**. Без него файловая система через неопределенное время переходит в `read only`.
* `initrd  /amd-ucode.img` - это подгрузка микрокодов процессора для исправления различных уязвимостей. `/amd-ucode.img` заменяем на `/intel-ucode.img`.

Установите микрокоды проца (в зависимости от производителя):

```bash
pacman -Sy amd-ucode
# либо
pacman -Sy intel-ucode
```

Настроим загрузчик:

```bash
micro /boot/loader/loader.conf
```
```conf
timeout 4
default arch-ecrypted.conf
console-mode max
editor no
```

### Добавляем переменные окружения

`/etc/environment` — это лучшее место для задания переменных, которые будут установлены глобально для всех пользователей...

Сделаем редактором по-умолчанию **micro** для всех взамен старперского **vim** (мы его даже не стали устанавливать) из которого не могут выйти 95% пользователей Linux (`<ESC>`, `:qa!`, `<Enter>`).

```bash
echo 'EDITOR=micro' >> /etc/environment
```

---

Переменные окружения, которые должны быть доступны только для вас и приложений, запускаемых от вашего пользователя, в дальнейшем можно добавлять в `~/.zshenv`, `~/.zlogin`, `~/.xprofile`, `~/.profile` как `export KEY=VALUE`. Общие для всех переменные можно установить в сценариях `/etc/profiles.d/<filename>.sh`. 

Если система стартует через **systemd** (со `startx` не будет работать), то пользовательские переменные окружения в виде `KEY=VALUE` можно установить в `~/.config/environments.d/<filename>.conf` либо в `/etc/environment.d/<filename>.conf` (общие для всех).

### Выбор графического окружения (DE)

#### Xfce или крыса

```bash
pacman -Sy xfce4 xfce4-goodies network-manager-applet lightdm lightdm-gtk-greeter
systemctl enable lightdm
```

Плюсы:

* Выглядит минималистично... как Gnome 2, форком которого он и стал, но Gnome за это время уже сменил кучу версий Gtk.
* Легковесность — пакеты занимают мало места, и система потребляет мало ресурсов. В xfce по умолчанию менее 900 пакетов в то время как для KDE или Gnome их нужно на треть больше...
* Стабильность: разработчики что-то ломают нечасто.

Минусы:

* Вытекают из стабильности: баги не исправляют годами. Например, тот же **gnome-keyring**, будет у вас упорно запрашивать пароль даже если для связки ключей вы установите тот же пароль, что и для пользователя (эта проблема решается именно так в Gnome).
* Многие простые вещи, например, создание ярлыка на рабочем столе, требуют кучу дополнительных телодвижений (нужно создать Launcher, указать имя, выбрать исполняемый файл и иконку для него).
* Трудность настройки.
* Ограниченная поддержка HDPi.
* Не поддерживает Wayland (тут сомнительный минус, так как последний скорее всего так никогда и не победит **иксы**).
* Нет расширений как в Gnome, есть убогий аналог Plasmoid'ов.

Заключение: все так себе, но жить можно. Некоторые делают из Xfce конфетку, выбрасывая стандартные панели и пр.

#### Gnome

```bash
pacman -S gnome gnome-extra
systemctl enable gdm
```

Плюсы:

* Закос под MacOS с довольно таки минималистичным интерфейсом;
* Лучшая поддержка Wayland;
* Редко ломается...

Минусы:

* Без расширений не очень удобен в использовании.
* Расширения постоянно ломаются.
* Нужно отдельно настраивать внешний вид для приложений под Qt, например, ч/з [Kvantum](https://archlinux.org/packages/?name=kvantum).
* Потребляет ресурсов не меньше чем Windows.

Заключение: не с проста во многих дистрибутивах является DE по умолчанию, например, в Ubuntu, Fedora, что говорит о доверии со стороны разработчиков дистрибутивов, подтверждает тезис о стабильной работе самой системы, но не сторонних расширений...

#### Plasma/KDE или просто кеды

```bash
pacman -S plasma kde-applications
systemctl enable sddm
```

Плюсы:

* Похож на Windows 10.
* Темы можно устанавливать глобально для Qt и Gtk приложений.
* Настройка почти всего без ковыряния текстовых конфигов! Огромное количество настроек.

Минусы:

* Постоянные баги.
* С поддержкой Wayland проблемы.
* Потребляет много ресурсов примерно как Gnome.

Заключение: поддержка Wayland обычным пользователям не нужна, а с большинством багов можно смириться + Steam Deck работает на KDE Plasma, а значит есть надежда, что баги будут исправляться быстрее, как и появляться новые фичи, так как Габен занесет денег...

#### Настройка сети [ на целевом хосте ]

Включим менеджер сети:

```bash
systemctl enable NetworkManager
```

### Грузимся в систему

Можно не выходить, а выполнить что-то типа:

```bash
startx
systemctl start gdm
systemctl start sddm
```

Но если хочется проверить загрузку...

Выходим из chroot:

```bash
exit
```

Теперь можно перегрузиться и вытащить флешку:

```bash
reboot
```

# <a name="system-settings"></a> Настройка системы

## Управление пакетами

Для управления пакетами я советую использовать yay (yet another yaourt).

Главное преимущество Arch Linux в AUR, а поэтому нам нужен пакетный менеджер с его поддержкой. Раньше для этих целей использовали **yaourt**, но за прошедшие годы последний уступил пальму первенства.

```bash
$ cd /tmp
$ git clone https://aur.archlinux.org/yay-bin
$ cd yay-bin
$ makepkg -si
```

## Настройка SWAP/ZRAM

Ядру **Linux**, независимо от размера оперативной памяти, нужно периодически сбрасывать страницы памяти в **SWAP**.

Для экономии ресурса **SSD** **SWAP** можно размещать в сжатом виде в оперативной памяти (**ZRAM**).

Установка:

```bash
$ yay -S zram-generator-git zram-generator-defaults
```

Включение **ZRAM**:

```bash
$ sudo systemctl restart systemd-zram-setup@zram0
```

Рекомендованные настройки **SWAP** для **SSD**:

`/etc/sysctl.d/99-swappiness.conf`
```conf
vm.swappiness=100
vm.vfs_cache_pressure=10
```

Применяем настройки:

```bash
$ sudo sysctl --system
```

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
