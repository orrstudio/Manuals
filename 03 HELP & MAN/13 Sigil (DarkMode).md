# Sigil (DarkMode)

### Если вы хотите поэкспериментировать с темным режимом Sigil используйте в командной строке при запуске Sigil команду:

> FORCE\_SIGIL\_DARKMODE_PALETTE=1 sigil

### Если же вам это нравится и вы хотите сделать это постоянным, то открываем файл /bin/sigil или /usr/bin/sigil текстовым редактором nano под sudo.

### Вводим в конец файла после строки:

> export LD\_LIBRARY\_PATH

### следующую строку:

> export FORCE\_SIGIL\_DARKMODE_PALETTE=1

### сохраняемся (Ctrl + O) и выходим (Ctrl + X).

# Для добавления PageEdit во внешний редактор для Sigil добавляем путь в настройках:

> /bin/pageedit