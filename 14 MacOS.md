# Создание загрузочной флешки MacOS

Для создании загрузочной флешки используем программу с официального сайта [balenaEtcher](https://etcher.balena.io/)  

> Работает под любую операционную систему (MacOS, Windows, Linux).  
> Программу не обязательно устанавливать, есть портативные варианты как для 32 битной так и для 64 битной систем Linux и Windows.  
> Скачиваем zip файл для Linux, распаковываем и пользуемся.  
> Аналогично и для иных систем.  
> В случае Линукс и Виндовс понадобиться утилита dmg2img для [преобразования dmg файлов в img](https://www.youtube.com/watch?v=4c8o-54jVy8).  

Далее скачиваем образ загрузочного диска MacOS.  
- [MacOS-HighSierra10.13](https://disk.yandex.ru/d/BU9ZvcG5yIbuNQ) - лежит по этой ссылке. Файл называется "bckup.img".
- Есть вариант [образы MacOS на официальном сайте Apple](https://support.apple.com/ru-ru/101578). Можно использовать только версии ниже HighSierra, так как если ставить версии выше то без патчей драйвера на видео карту и другое не встанут.  

# MacOS версий выше HighSierra 10.13 с патчем OpenCore.

- [OpenCore Legacy Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher) - это программа устанавливается на Mac, загружает новую версию Операционной системы не поддерживаемой Mac и создает флешку для установки. После установки патчит систему чтобы поставились драйвера видео и другого оборудования.  

# X-Code
- [Список релизов X-Code с поддерживаемыми MacOS](https://xcodereleases.com/)  
- [Официальная документация по релизам X-Codes](https://developer.apple.com/documentation/xcode-release-notes/xcode-14_2-release-notes)  
- [Тут можео скачать старые версии X-Code и многого другого](https://developer.apple.com/download/all/)

# Dark Mode в macOS High Sierra

## Чтобы включить Dark Mode в macOS High Sierra 10.13 введите в терминале следующую команду:  

```
defaults write -g NSWindowDarkChocolate -bool TRUE
```

Перезагрузитесь.  

## Чтобы вернуть все обратно введите:  

```
defaults delete -g NSWindowDarkChocolate
```

Перезагрузитесь.  
