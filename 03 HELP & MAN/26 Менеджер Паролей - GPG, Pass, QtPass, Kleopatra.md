# [GPG](https://gnupg.org/) (GnuPG) 

> Утилита для шифрования файлов.  

## [Полное описание установки GPG](https://habr.com/ru/articles/358182/)

Часто используемые команды

- генерировать новый gpg ключ
```
gpg --full-gen-key
```
- просмотр списка ключей
```
gpg --list-keys
```
- просмотр списка public ключей
```
gpg -k
```
- просмотр списка privat ключей
```
gpg -K
```
- экспорт public ключа в файл ~/public.key.gpg
```
gpg --output ~/public.key.gpg --armor --export orr888@gmail.com
```
- экспорт privat ключа в файл ~/privat.key.gpg
```
gpg --output ~/privat.key.gpg --armor --export-secret-keys orr888@gmail.com
```
- Импорт ключей
```
gpg --import ~/название_фала_с_ключем.gpg
```
- удаление ключа privat
```
gpg --delete-secret-keys orr888@gmail.com
```
- удаление ключа public
```
gpg --delete-keys orr888@gmail.com
```

> Так же управлять ключами можно программой Seahorse.

## [GUI для GPG - Seahorse](https://wiki.gnome.org/Apps/Seahorse)

- Управляйте своими ключами и связкой ключей.
- Синхронизируйте свои ключи и связку ключей с серверами ключей.
- Подпишите ключи и опубликуйте.
- Кэшируйте свою парольную фразу, чтобы вам не приходилось постоянно ее вводить.
- Сделайте резервную копию ваших ключей и брелока.
- Добавьте изображение в любом формате, поддерживаемом GDK, в качестве идентификатора фотографии OpenGPG.
- Создавайте ключи SSH, настраивайте их, кэшируйте.
- И многое другое...

> Создатели GnuPG for Android рекомендуют использовать [OpenKeychain](https://www.openkeychain.org/).

# [Pass](https://www.passwordstore.org/) 

Video Tutorials
- [PASS — лучший менеджер паролей](https://www.youtube.com/watch?v=NM1eYYyk2WE)
- [👑 Шифруем файлы и пароли аки Царь с GPG и Pass!](https://www.youtube.com/watch?v=I2mwqC6HGGE)

Cкрипт написанный на bash, использующий GPG шифрование и синхронизацию между устройствами при помощи git. В pass каждый пароль находится внутри gpg зашифрованного файла, имя которого является названием веб-сайта или ресурса, требующего пароль. Все пароли живут в ~/.password-store, и pass предоставляет несколько удобных команд для добавления, редактирования, генерации и получения паролей. Это очень короткий и простой сценарий оболочки. Он способен временно помещать пароли в буфер обмена и отслеживать изменения паролей с помощью git. 

## [Полное описание установки Pass](https://habr.com/ru/articles/479540/)

Команды  

- созданный каталог '/home/orr/.password-store'
- инифицирование ключа для password-store
```
pass init orr888@gmail.com
```
- просмотр списка паролей в форме дерева
```
pass
```

## GUI для Pass [QtPass](https://qtpass.org/) 

- Использование pass или git и gpg2 напрямую
- Кроссплатформенность: Linux, BSD, OS X и Windows.
- Использование собственных виджетов и иконок, где это возможно.
- Чтение хранилищ паролей доступа
- Расшифровка и отображение пароля и связанной с ним информации
- Редактирование и добавление паролей и информации
- Обновление в репозиторий git и из него
- Выбор пользователя для каждой папки для шифрования нескольких получателей
- Параметры конфигурации для серверных частей и расположения исполняемых файлов/папок
- Копирование пароля в буфер обмена
- Настраиваемые параметры защиты плеч при серфинге
- Простая регистрация для новых пользователей
- Экспериментальная поддержка WebDAV
- Гораздо более

## GUI для Pass и GPG [Kleopatra](https://apps.kde.org/kleopatra/) 

- Менеджер сертификатов и единый криптографический графический интерфейс 

# [PASS IMPORT](https://github.com/roddhjav/pass-import#readme)

> Утилита импорта паролей из сторонних баз паролей.

# Pасширения для браузеров Google Chrome и FireFox

## Pасширение для браузера [Browserpass](https://github.com/browserpass)
> Для установки Browserpass, необходимо установить два его компонента: 
- [browserpass-extension - Браузерное расширение](https://chromewebstore.google.com/detail/browserpass/naepdomgkenhinolocfifgehidddafch)
- [browserpass-native - Клиентское приложение](https://github.com/browserpass/browserpass-native#installation)
## Pасширение для браузера [PassFF](https://github.com/passff)
> Для установки PassFF, необходимо установить два его компонента:
- [PassFF - Браузерное расширение](https://addons.mozilla.org/ru/firefox/addon/passff/)
- [PassFF Хост-приложение для WebExtension](https://github.com/passff/passff-host)


# [Интеграция с Android](https://habr.com/ru/articles/479540/)

- Реализация GPG под Android называется [OpenKeychain](https://www.openkeychain.org/). Для её настройки достаточно зайти в меню "управление ключами" и импортировать ключ (приватную часть).  
- Реализация PASS под Android называется [Password Store](https://github.com/android-password-store/Android-Password-Store) сокращенно PasswordStore. Ссылку на нее можно найти прям в приложении [OpenKeychain](https://play.google.com/store/apps/details?id=org.sufficientlysecure.keychain) или в PlayMarket

Устанавливаем и запускаем PasswordStore. Прежде чем синхронизировать хранилище паролей, заходим в меню "Настройки".  
Там нам понадобятся следующие пункты:

## Изменить настройки сервера git. 
- URL репозитория: git@github.com:orrstudio/pass.git (указан на странице репозитория pass)
- Ветка: main (обязвтельно меняем на маин, а то потом он не меняется, придется удалять приложение и заново ставить)
- Тип авторизации: SSH КЛЮЧ
- Сохраняем.
- Импортируем ssh ключ (id_ed25519) приватную часть (он должен быть так же на гитхабе)
- Клонируем.
- ГОТОВО!
- Настраиваем Автозаполнение в настройках приложения.
