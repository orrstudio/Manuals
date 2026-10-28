# Настройка темного режима Qt и Gtk приложений и [Dark mode switching](https://wiki.archlinux.org/title/Dark_mode_switching) и [GTK](https://wiki.archlinux.org/title/GTK)

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

## 2. Установка тем `gnome-themes-extra` `adwaita-qt6-git` `adwaita-qt5-git` и `xdg-desktop-portal-gtk`

```
yay -S gnome-themes-extra adwaita-qt6-git adwaita-qt5-git xdg-desktop-portal-gtk
```

## 3. Установка [Yin-Yang](https://github.com/oskarsh/Yin-Yang "Автоматический ночной режим для KDE, Gnome, Budgie, VSCode, Atom и других ")

```
yay -S yin-yang
```

## 4. [Oomox theme designer](https://github.com/themix-project/themix-gui "Oo-mox — графическое приложение для создания различных цветовых вариаций тем Numix и Flat-Plat (GTK 2 и 3), тем значков Archdroid и Gnome-Colors. Также позволяет создавать предварительно масштабированные темы GTK 2 для дисплеев HiDPI. ")

```bash
flatpak install flathub com.github.themix_project.Oomox
```

## 5. [nwg-look](https://github.com/nwg-piotr/nwg-look "Редактор настроек GTK3 адаптирован для работы в среде wlroots ")

```
yay -S nwg-look
```

Запускать нужно в терминале.
