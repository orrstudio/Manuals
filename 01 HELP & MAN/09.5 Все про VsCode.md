# Visual Studio Code

## Vs Code PLUGINS

- [CHEAT.SH Snippet for VS Code](https://github.com/mre/vscode-snippet "Расширение Visual Studio Code для cheat.sh. Быстро и легко находите фрагменты кода для любого языка прямо в вашей IDE.")
- All Autocomplete
- Auto Close Tag
- Auto Complete Tag
- Auto Rename Tag
- GitHub Theme
- Indent one space
- Indenticator
- JavaScript (ES6) code snippets
- jshint (есть настрока для этого плагина. смотреть видео с описанием: https://www.youtube.com/watch?v=rRiTxn15Q3Y&list=PLQEds1ESt7csjTThaq8xzdf0Axxhyk5mL)
- Live Server
- Multiple cursor case preserver
- Open Browser Preview
- Prettier - Code formatter
- Python Indent
- React - Javascript snippets
- Russian Language Pack for Visual Studio Code
- Sass
- Simple icons

## Отключение встроенного git в VS Code

1) В левой панели раздел "Расширения" -> "Отображать встроенные расширения"
2) Находим расширение Git и все ненужные, нажимаем "Отключить"

## Конфигурационный файл VsCode

```config
# json.json
{
  "workbench.startupEditor": "none",
  "workbench.colorTheme": "GitHub Dark Default",
  "files.autoSave": "afterDelay",
  "editor.formatOnSave": true,
  "notebook.compactView": false,
  "editor.fontSize": 18,
  "editor.scrollbar.verticalScrollbarSize": 16,
  "editor.multiCursorModifier": "ctrlCmd",
  "editor.guides.bracketPairs": "active",
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "workbench.iconTheme": "minimalistic-icons",
  "editor.quickSuggestions": {"other": true, "comments": true, "strings": true}
}
```

## Решение ПРОБЛЕМЫ "каталоги открываются в VSCode"?

Существует файл `/usr/share/applications/mimeinfo.cache`. В нем хранятся ассоциации между mime-типами и приложениями. Его редактирование исправляет проблему, НО такое решение является временным, так как этот файл генерируется при каждом обновлении системы из `*.desktop` файлов.

Удалить в этом фале нужно схожие этим строчкам:
```
code-oss.desktop;
application/x-code-oss-workspace=code-oss.desktop;
x-scheme-handler/code-oss=code-oss-url-handler.desktop;
```

Еще нужно отредактировать MimeType (я его просто закомментировал) в `/usr/share/applications/visual-studio-code.desktop` и обновить `mimeinfo.cache`:
```
sudo nano /usr/share/applications/visual-studio-code.desktop
MimeType=text/plain;inode/directory;
sudo update-desktop-database /usr/share/applications
```
