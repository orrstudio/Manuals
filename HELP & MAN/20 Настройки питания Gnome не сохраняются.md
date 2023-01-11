# Настройки питания Gnome не сохраняются

## Для изменения времени выключении экрана на "никогда"
```
gsettings set org.gnome.desktop.session idle-delay 0
```
## Поведение кнопки питания для выключения
```
gsettings set org.gnome.settings-daemon.plugins.power power-button-action interactive
```
## поведение кнопки питания для выключения "ничего не делать"
```
gsettings set org.gnome.settings-daemon.plugins.power power-button-action nothing
```