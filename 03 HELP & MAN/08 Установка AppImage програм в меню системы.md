# [AppImageLauncher](https://github.com/TheAssassin/AppImageLauncher)

# [Ручное создание ярлыка с иконкой для приложения AppImage.](https://www.maketecheasier.com/create-desktop-file-linux/)

Файл .desktop — это просто ярлык, который используется для запуска приложения в Linux.  
Файл «.desktop» — это, по сути, простой текстовый файл, содержащий информацию о программе. Обычно он помещается в `~/.local/share/applications` или `/usr/share/applications/` в зависимости от того, хотите ли вы, чтобы программа запуска была доступна только для локальной учетной записи или для всех.   
Содержание этого файла:
```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/path/to/executable
Name=Name of Application
Icon=/path/to/icon
```

Вам нужно изменить поле «`Exec`» на путь к исполняемому файлу и поле «`Name`» на имя приложения. Большинство программ предоставят иконку где-нибудь в архиве, так что не забудьте включить и ее.   

Сохраните файл в папке «`~/.local/share/applications`» как «`имя-приложения.desktop`». Папка «`.local`» — это скрытая папка в вашем домашнем каталоге, и вам нужно включить режим «`Показать скрытые файлы`», чтобы просмотреть ее. Если вы хотите, чтобы он был доступен глобально, выполните в терминале следующую команду:

```
sudo mv ~/.local/share/applications/<application-name.desktop> /usr/share/applications/
```
То есть перемещаем файл в глобальную папку ярлыков. Конечно, не забудьте изменить `<application-name.desktop>` на фактическое имя файла .desktop.  

Сделав это, приложение будет готово к использованию.

# [Регистрация файлов AppImage в качестве настольного приложения (Вариант 2)](https://qastack.ru/ubuntu/902672/registering-appimage-files-as-a-desktop-app)

Создайте файл Название_программы.desktop, который указывает на приложение - вот пример .desktop для Open Video Downloader (openvd.desktop):
```
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Open Video Downloader
Comment=Open Video Downloader for Desktop
Icon=/home/orr/.openvd/icon.png
Exec=/home/orr/.openvd/openvd.AppImage
Terminal=false
StartupWMClass=openvd
Categories=Office;
```
Поместите этот файл в: `~/.local/share/applications`