# Изменение пароля суперпользователя

> Если вы не знаете пароль суперпользователя (root), то вам потребуется перезагрузиться в режиме live CD/USB, чтобы получить доступ к файловой системе и изменить пароль суперпользователя. 

## Вот шаги, которые нужно выполнить:

- Перезагрузите компьютер и загрузитесь с live CD/USB.
- Откройте терминал.
- Смонтируйте корневую файловую систему с правами на запись. 

```
mount -o remount,rw /
```

Теперь вы можете изменить пароль суперпользователя, используя команду passwd

```
passwd
```

- Введите новый пароль и подтвердите его.
- После изменения пароля перезагрузите компьютер и войдите в систему с новым паролем.


