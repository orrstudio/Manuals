# [DaVinci Resolve НЕ ЗАПУСКАЕТСЯ](https://www.youtube.com/watch?v=9scpXdp1PxI)

## Чтобы посмотреть в консоли почему не запускается Давинчи, нужно запустить ее в терминале:

```bash
cd /opt/resolve/bin/
./resolve
```
должна выйти такая ошибка:
```bash
./resolve: symbol lookup error: /usr/lib/libpango-1.0.so.0: undefined symbol: g_once_init_leave_pointer
```

## Решение ошибки в DaVinci Resolve `symbol lookup error: /usr/bin/libpango-1.0.so.0: undefined symbol: g_once_init_leave_pointer`

Удаляем мешающие библиотеки: 
```bash
sudo rm /opt/resolve/libs/libglib-2.0.so*
sudo rm /opt/resolve/libs/libgio-2.0.so*
sudo rm /opt/resolve/libs/libgmodule-2.0.so*
```
