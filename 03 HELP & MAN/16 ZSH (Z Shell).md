# ZSH (Z Shell)

## Zsh она же Z shell — одна из современных командных оболочек Unix. Мало кто знаком и использует все ее функции. Однако это и не требуется — фреймворк Oh My Zsh, который мы установим далее, позволит настраивать ее и кастомизировать с помощью тем и плагинов.

</br></br></br>

# Установка ZSH
```
yay -S zsh
```
## Делаем zsh оболочкой по умолчанию:
```
chsh -s `which zsh`
```
## Перезагружаемся чтобы изменения вступили в силу. Убедимся, что zsh является оболочкой по умолчанию:
```
echo $SHELL
```

</br></br></br>

# Установка Oh My Zsh
```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
## Выбор темы
### Чтобы установить тему из репозитория откройте файл ~/.zshrc, и в поле ZSH_THEME замените значение на имя понравившейся темы.
```
ZSH_THEME="agnoster"
```
## Установка Шрифтов Powerline
```
yay -S powerline-fonts
```
## Плагины
### Oh My Zsh поставляется в комплекте с плагинами, просто включите их. Каждый из них задокументирован в файле README в соответствующей `plugins/` папке. Включите плагин, добавив его имя в `plugins` массив в вашем `.zshrc` файле (находится в `$HOME` каталоге). Например, это позволяет `rails, git` и `ruby` плагинов, в таком порядке:
```
plugins=(rails git ruby)
```
## ПРИМЕЧАНИЕ: элементы в массивах zsh разделяются пробелами. **НЕ используйте запятые.**
## [Плагины Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins "Oh My Zsh поставляется в комплекте с плагинами, которые позволяют вам использовать преимущества многих видов функций вашей оболочки, просто включив их. Каждый из них задокументирован в файле README в соответствующей plugins/папке.")
## Чтобы установить сторонний плагин, его нужно предварительно скачать и положить в каталог сторонних плагинов ~/.oh-my-zsh/custom/plugins.

</br></br></br>

# Несколько полезных плагинов из репозитория Oh My Zsh:

- **archlinux** - добавляет некоторые псевдонимы и функции для работы с Arch Linux.
- **composer** - автодополнения и алиасы;
- **sudo** - если для выполнения команды потребовались права суперпользователя, плагин позволит не возвращаться в начало строки, а нажать два раза Esc, и он добавит sudo в начало команды.
- **compleat** - Этот плагин ищет завершение и загружает его.

## И пара интересных внешних плагинов:

## [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) — добавляет подсветку синтаксиса, подсвечивает команду если в написании допущена ошибка;

# Установка метод1
## Просто клонируйте этот репозиторий и создайте скрипт:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```
## Затем включите подсветку синтаксиса в текущей интерактивной оболочке:
```
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```
## [Есть ещё варианты установки на страничке плагина.](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
## [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — предугадывает команды на основе ранее вводимых.

# Установка метод 2
```
yay -S zsh-autosuggestions
```
## [Есть ещё варианты установки на страничке плагина.](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

