# OBSIDIAN install instruction for desktop and mobile devices
## First step
1. Первое что мы должны сделать это создать репозиторий в GitHub
2. Далее нужно создать #Personal-access-tokens-classic для входа через приложения. Это делается в общих настройках GitHub. В разделе [Developer settings - Tokens (classic)](https://github.com/settings/tokens) 
3. Наш токен на данный момент называется: "TokenForSync". В настройках токена выбираем два пункта: `admin:repo_hook` и `repo`. Ключ токена: `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`  This token has no expiration date.
## Linux Desktop installation instruction
1. Переходим в папку для репозиториев
```bash
cd /home/orr/.DATA/GITHUB
```
2. Клонируем репозиторий в эту папку
```bash
git clone https://github.com/Orr888/OrrObsidian.git
```
3. Переходим в папку склонированного репозитория
```bash
cd OrrObsidian
```
4. Записываем в конфигурационный файл наш логин и токен от GitHub. (`git remote add origin https://{username}:{password}@github.com/{username}/project.git` или `git remote set-url origin https://{username}:{password}@github.com/{username}/project.git`) В моем случае помогло:
```bash
git remote set-url origin https://orr888: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@github.com/Orr888/OrrObsidian.git
```
5. Затем записываем в конфиг файл имя и эмаил для коммита
```bash
  git config --global user.name "OrrArchPavilion"
  git config --global user.email orr888@gmail.com
```
6. И на конец проверяем записи в конфигурационном файле
```bash
git config --list
```
должно выйти следующее:
```Terminal_Print
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
user.name=OrrArchPavilion
user.email=orr888@gmail.com
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
remote.origin.url=https://orr888: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@github.com/Orr888/OrrObsidian.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.merge=refs/heads/main
```
7. Теперь открываем Obsidian и выбираем пункт "открыть папку как хранилище" и указываем путь к папке репозитория.
8. Ставим плагин "Obsidian Git" и активируем его.
9. В палитре команд вводим: `Obsidian Git: Open source control view`
10. Пользуемся! :)

## Mobile app installation instruction
[Инструкция в интернете на английском](https://github.com/denolehov/obsidian-git/wiki/Installation)
1.  Убедитесь, что любые изменения на всех устройствах синхронизированы с удаленным репозиторием.
2.  Установите Obsidian на телефон.
3.  Создайте новое хранилище или укажите Obsidian в пустой каталог.
4.  На GitHub аутентификация должна выполняться с помощью #Personal-access-tokens-classic. Требуемые минимальные разрешения: «Доступ на чтение метаданных» и «Доступ на чтение и запись кода и статусов фиксации» для репозитория, который вы собираетесь использовать.
5.  В настройках Obsidian включите плагины сообщества. Просмотрите плагины для установки Obsidian Git.
6.  Включить Obsidian Git (на том же экране)
7.  Перейдите в раздел «Параметры плагина Obsidian Git» (внизу главной страницы настроек, в разделе «Плагины сообщества»).
8.  В разделе «Authentication/Commit Author» введите имя пользователя на вашем сервере GitHub (orr888) и ваш токен.
9.  Оставьте параметр относительного пути пустым (только для опытных пользователей).
10.  Выйдите из настроек плагина, откройте палитру команд `>_`, выберите «Obsidian Git: Clone an existing remote repo (Клонировать существующий удаленный репозиторий)».
11.  Заполните URL-адрес репо (https://github.com/Orr888/OrrObsidian.git) в текстовом поле и нажмите кнопку URL-адреса репо под ним.
12.  Следуйте инструкциям, чтобы определить папку для размещения репозитория и каталога .obsidian.
13.  Клон должен запуститься. Всплывающие уведомления (если они не отключены) будут отображать ход выполнения. Не выходите, пока не появится всплывающее окно с просьбой «Перезапустить Obsidian».

## .gitignore
Чтобы исключить файлы кеша из репозитория, создайте `.gitignore` файл в корне вашего хранилища и добавьте следующие строки:

```txt
# Чтобы исключить настройки Obsidian (включая конфигурации плагинов и горячих клавиш)
# .obsidian/

# Или исключаем только плагины
# .obsidian/plugins/

# Только для исключения кеша рабочей области
.obsidian/workspace.json

# Добавьте строки ниже, чтобы исключить настройки ОС и кеши.
.trash/
.DS_Store
```
