# Настройка темного режима Qt и Gtk приложений или [Dark mode switching](https://wiki.archlinux.org/title/Dark_mode_switching)

## 1. Установка приложения `kvantum` с темой `engine`, `qt5ct` и `qt6ct`.

```
yay -S kvantum qt5ct qt6ct
```
Послле установки приллложений:  

- Установите переменную среды `export QT_QPA_PLATFORMTHEME=qt5ct`  
- Альтернативно вы можете добавить `QT_QPA_PLATFORMTHEME=qt5ct` вашему `~/.profile`  
- Запустите qt5ct выберите «Fusion» в качестве темы и «darker» в качестве цветовой схемы.  
- Перезагрузитесь.  

## 3. Установка тем `gnome-themes-extra adwaita-qt6-git adwaita-qt5-git`

```
yay -S gnome-themes-extra adwaita-qt6-git adwaita-qt5-git
```

## 4. Установка [Yin-Yang](https://github.com/oskarsh/Yin-Yang "Автоматический ночной режим для KDE, Gnome, Budgie, VSCode, Atom и других")

```
yay -S yin-yang
```
