# Настройка темного режима Qt и Gtk приложений или [Dark mode switching](https://wiki.archlinux.org/title/Dark_mode_switching)

## 1. Установка приложения `kvantum` `qt5ct` и `qt6ct`.

```
yay -S kvantum qt5ct qt6ct
```
[Настройка приложений Qt 5/6 в средах, отличных от KDE Plasma](https://wiki.archlinux.org/title/Qt#Configuration_of_Qt_5/6_applications_under_environments_other_than_KDE_Plasma):  

- Установите переменную среды `export QT_QPA_PLATFORMTHEME=qt5ct:qt6ct`  
- Альтернативно вы можете добавить `QT_QPA_PLATFORMTHEME=qt5ct:qt6ct` вашему `~/.profile`  
- В qt5ct и qt6ct выберите «Fusion» в качестве темы и «darker» в качестве цветовой схемы.
- В kvantum установите тему `engine`
- Перезагрузитесь.  

## 2. Установка тем `gnome-themes-extra adwaita-qt6-git adwaita-qt5-git`

```
yay -S gnome-themes-extra adwaita-qt6-git adwaita-qt5-git
```

## 3. Установка [Yin-Yang](https://github.com/oskarsh/Yin-Yang "Автоматический ночной режим для KDE, Gnome, Budgie, VSCode, Atom и других")

```
yay -S yin-yang
```

>
> Чтобы посмотреть какая тема установлена для Gtk введите в командной строке:
> `gsettings get org.gnome.desktop.interface gtk-theme`
> 
