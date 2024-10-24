# Качаем и устанавливаем с сайта производителя по их же схемам. 

> Далее проходим процедуру лечения и кодирования видео для импорта в Давинчи.
> [DaVinci Resolve НЕ ЗАПУСКАЕТСЯ](https://www.youtube.com/watch?v=9scpXdp1PxI)

## Чтобы посмотреть в консоли почему не запускается Давинчи, нужно запустить ее в терминале:

```bash
cd /opt/resolve/bin/
./resolve
```
должна выйти такая ошибка:
```bash
./resolve: symbol lookup error: /usr/lib/libpango-1.0.so.0: undefined symbol: g_once_init_leave_pointer
```

Удаляем мешающие библиотеки: 
```bash
sudo rm /opt/resolve/libs/libglib-2.0.so*
```
```bash
sudo rm /opt/resolve/libs/libgio-2.0.so*
```
```bash
sudo rm /opt/resolve/libs/libgmodule-2.0.so*
```

## Не импортируются mp4 файлы

Нужно конвертировать видео в формат DaVinci Resolve перед импортом. Для этого есть програ с графическим интерфейсом [WinFF](https://github.com/WinFF/winff) которая пользуется FFmpeg-ом и конвертирует все и вся.

```bash
yay -S winff-qt6
```

Но нам понадобиться импортировать в эту прогу еще и новые [параметры](https://github.com/Ephiderium/Konstantin/tree/main) в которых указаны значения импорта для Resolve. Скачиваем файл `winff_resolve_diolinux_.xml` у кости, меняем расширемние на .wff и импортируем из параметров WinFF. [ВидеоОбзор по теме](https://www.youtube.com/watch?v=BCjGr_jUyag).

## Далее процедура лечения.

[Статья на форуме про лечение. Там же код запускаемый в кончоли для лечения.](https://rutracker.org/forum/viewtopic.php?p=86562692#86562692)

[Качай отсюда последнюю стабильную версию (19)](https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion)
или отсюда
[С сайта производитея](https://www.blackmagicdesign.com/products/davinciresolve)

Далее код для лечения. Если не подходит поищи на [форуме](https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion). Всегда есть варианты.  

Мне подощел этот:  

```bash
sudo perl -pi -e 's/\x74\x7b\xe8\x61\x26\x00\x00/\xeb\x7b\xe8\x61\x26\x00\x00/g' /opt/resolve/bin/resolve
```
