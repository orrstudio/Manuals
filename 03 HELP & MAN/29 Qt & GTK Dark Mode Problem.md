# Настройте темный режим Qt приложений.

## Вариант 1. 

Установка приложения `kvantum` с темой `engine`, чья тема по умолчанию оформлена в темном режиме.
```
yay -S kvantum
```
Установите переменную среду
```
export QT_STYLE_OVERRIDE=kvantum
qtpass
```
или
```
QT_STYLE_OVERRIDE=kvantum qtpass
```

## Вариант 2. 

Установка `qt5ct`
```
yay -S qt5ct
```
- Установите переменную среды QT_QPA_PLATFORMTHEME=qt5ct
  - Если хотите, вы можете сделать это глобально, создав `/etc/environment.d/100qt5ct-dark-theme.conf` с текстом `QT_QPA_PLATFORMTHEME=qt5ct` внутри.
  - Альтернативно вы можете добавить `export QT_QPA_PLATFORMTHEME=qt5ct` вашему `~/.profile`
- Запустите qt5ct и один раз выберите «Fusion» в качестве темы и выберите «darker» цветовую схему в разделе `Appearance > Palette > Custom > Color scheme > "darker"`.
- Повторно войдите в систему, чтобы ваша DE была перезапущена с уже установленной темной средой.

Все приложения Qt теперь по умолчанию должны быть в темной теме!

## Вариант 3

Установка `qt6ct`
```
yay -S qt6ct
```
