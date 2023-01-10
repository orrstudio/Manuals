# Установка Microsoft шрифтов

Использование шрифтов с раздела Windows
Если есть примонтированный раздел с установленной Windows, можно использовать шрифты Windows, ссылаясь на них.

Например, если раздел `Windows C:\` смонтирован в `/windows` :

```
sudo ln -s /windows/Windows/Fonts /usr/share/fonts/WindowsFonts
```

Затем, обновите кэш `fontconfig`:

```
fc-cache
```

Далее устанавливаем шрифты из АУР

```
yay -S ttf-ms-fonts
```

```
yay -S ttf-tahoma
```

```
yay -S ttf-windows
```

```
git clone https://aur.archlinux.org/ttf-vista-fonts.git
```

Поле загрузки входим в терминал из той же папки куда загрузили. Входим в папку которую загрузили и запускаем:

```
makepkg
```

Должно все поставиться, но я ещё скопировал сами шрифты после установки в папку где лежат шрифты Microsoft: `/usr/share/fonts/TTF`

