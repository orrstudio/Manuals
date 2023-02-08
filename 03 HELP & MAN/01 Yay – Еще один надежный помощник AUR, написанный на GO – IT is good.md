Пакетным менеджером по-умолчанию для Arch Linux является pacman. Для подсветки вывода pacman в `/etc/pacman.conf` нужно раскомментировать `Color`. Пользовательским репозиторием является [AUR](https://aur.archlinux.org/).

Чтобы не собирать пакеты вручную можно поставить yay:
# Установка yay
```bash
sudo pacman -Syyu
sudo pacman -S git
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
sudo chown -R orr:orr ./yay-bin
cd yay-bin
makepkg -si
sudo yay -Syu
```

```bash
# To include development packages during the upgrade run.
$ yay -Syu --devel --timeupdate
```

# Работа с Пакетами
```bash
# Установить пакет
$ yay -S <package>

# Удалить пакет
$ yay -Rns <package>

# Обновить все установленные пакеты
$ yay -Syu

# Обновить в т.ч. с пакетами для разработчика
$ yay -Syu --devel --timeupdate

# Очистить кеш
$ yay -Sc

# Удалить все ненужные зависимости
$ yay -Yc

# Статистика по пакетами
$ yay -Ps

# Generates development package DB used for devel updates
$ yay -Y --gendb

# Ошибки с удалением зависимостей

$ yay -Rns gnome-extra
checking dependencies...
error: failed to prepare transaction (could not satisfy dependencies)
:: nautilus: removing nautilus-sendto breaks dependency 'nautilus-sendto'
$ yay -Rdd nautilus-sendto
```
