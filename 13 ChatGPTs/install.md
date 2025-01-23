# Применение темы

## Установите новую тему:
```
sudo plymouth-set-default-theme -R apple_logo
```

## Пересоздайте образ initramfs с новой темой:
```
sudo dracut -f
```

## Чтобы вернуться к оригинальной теме:
```
sudo plymouth-set-default-theme -R default
```

## Пересоздайте образ initramfs с новой темой:
```
sudo dracut -f
```

> Перезагружайте систему, чтобы увидеть изменения.
