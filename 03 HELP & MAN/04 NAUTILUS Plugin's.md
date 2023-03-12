# Настройки боковой панели

xdg-user-dirs-update

```bash
sudo nano ~/.config/user-dirs.dirs
```
```txt
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run.
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
# 
# Этот файл написан xdg-user-dirs-update
# Если вы хотите изменить или добавить каталоги, просто отредактируйте 
# интересующую вас строку. Все локальные изменения будут сохранены при 
# следующем запуске.
# Формат: XDG_xxx_DIR="$HOME/yyy", где yyy – это экранированный оболочкой 
# путь относительно домашнего каталога, или XDG_xxx_DIR="/yyy", 
# где /yyy – абсолютный путь. Никакой другой формат не поддерживается.
#
XDG_DESKTOP_DIR="$HOME/IMF-Teams"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/TEMPLATES"
XDG_SCREENSHOTS_DIR="$HOME/SCREENSHOTS"
XDG_DOCUMENTS_DIR="$HOME/DOCUMENTS"
XDG_MUSIC_DIR="$HOME/MUSIC"
XDG_PICTURES_DIR="$HOME/PICTURES"
XDG_VIDEOS_DIR="$HOME/VIDEOS"
XDG_GITHUB_DIR="$HOME/GITHUB"
XDG_APPIMAGES_DIR="$HOME/.AppImages"
XDG_PASSWORDSTORE_DIR="$HOME/.password-store"
```
Default settings for user directories
```bash
sudo nano /etc/xdg/user-dirs.defaults
```
```text
# Default settings for user directories
# The values are relative pathnames from the home directory and
# will be translated on a per-path-element basis into the users locale
#
# Настройки по умолчанию для пользовательских каталогов
# Значения являются относительными путями из домашнего каталога и будут 
# переведены для каждого элемента пути в языковой стандарт пользователя.
#
DESKTOP=IMF-Teams
DOWNLOAD=Downloads
TEMPLATES=TEMPLATES
SCREENSHOTS=SCREENSHOTS
DOCUMENTS=DOCUMENTS
MUSIC=MUSIC
PICTURES=PICTURES
VIDEOS=VIDEOS
GITHUB=GITHUB
APPIMAGES=.AppImages
PASSWORDSTORE=.password-store
#
#
# Another alternative is (Другая альтернатива):
# MUSIC=Documents/Music
# PICTURES=Documents/Pictures
# VIDEOS=Documents/Videos
```
Для того чтобы при перезагрузке не переопределялись папки нужно отредактировать:
```bash
sudo nano /etc/xdg/user-dirs.conf
```
```txt
# This controls the behaviour of xdg-user-dirs-update which is run on user login.
# You can also have per-user config in ~/.config/user-dirs.conf, or specify
# the XDG_CONFIG_HOME and/or XDG_CONFIG_DIRS to override this
#
# Это управляет поведением xdg-user-dirs-update, который запускается при входе 
# пользователя в систему.
# Вы также можете иметь конфигурацию для каждого пользователя 
# в ~/.config/user-dirs.conf или указать XDG_CONFIG_HOME 
# и/или XDG_CONFIG_DIRS, чтобы переопределить это.
#

enabled=False

# This sets the filename encoding to use. You can specify an explicit
# encoding, or "locale" which means the encoding of the users locale
# will be used
# Это устанавливает используемую кодировку имени файла. 
# Вы можете указать явную кодировку или «локаль», что означает - будет 
# использоваться кодировка локали пользователя.

filename_encoding=UTF-8
```

# 1 - NAUTILUS as ROOT - "Открыть как Администратор"

## 1.1 - Устанавливаем плагин под названием `nautilus-admin` или `nautilus-admin-gtk4`. Это дает вам меню правой кнопки мыши «открыть или редактировать как администратор».

## 1.2 - В nautilus вы также можете просто отредактировать адресную строку. Нажмите `Ctrl+L`, чтобы переключиться в режим редактирования. Затем вводите `admin://` в адресную строку перед адресом. Приглашение аутентификации запросит ваш пароль, и вуаля, вы можете просматривать как root любую папку.
 - вдобавок: так же, как вы вводите admin://, можно использовать и другие протоколы прямо в адресной строке. Например: Хотите получить доступ к общему ресурсу Windows? Используйте smb://префикс
### Пример:
```
smb://192.168.0.102/Downloads
admin:///home/orr/Downloads
```
## 1.3 - Tакже можно использовать клавиатуру для «просмотра» папок в nautilus. Откройте nautilus и начните печатать. Например, введите: `/usr/share` (если вы хотите перейти к /usr/share) nautilus предложит имя папки. Используйте TAB клавишу для автозаполнения - как в терминале. 

# 2 - Плагин "быстрый просмотр фото и видео" в проводнике NAUTILUS
```
sushi
```

# 3 - Плагин "изменение размера и поворот изображения" для контекстного меню 
```
imagemagick nautilus-image-converter
```

# 4 - [Плагин для быстрого копирования путей к файлам/Samba.](https://github.com/ronen25/nautilus-copypath)

# 5 - Для того, чтобы адресная строка отображалась постоянно выполните:
```
gsettings set org.gnome.nautilus.preferences always-use-location-entry true
```
