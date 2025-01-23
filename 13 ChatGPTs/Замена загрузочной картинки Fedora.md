> created: 2025-01-24T02:57:43 (UTC +04:00)  
> source: https://chatgpt.com/c/6792c0a0-7a60-8001-8c21-14195140dd1f  

# Замена загрузочной картинки Fedora

> Чтобы заменить загрузочную картинку Fedora на анимацию загрузки с белым яблоком на черном фоне, нужно изменить тему загрузчика **Plymouth**, который отвечает за отображение экрана во время загрузки. Вот пошаговая инструкция:

## 1. **Создание изображения белого яблока**

1. Найдите или создайте изображение белого яблока на черном фоне в формате PNG. Размер 1920x1080.
2. Сохраните его в: `/usr/share/plymouth/themes/apple_logo/apple-logo.png`.

## 2. **Установка необходимых инструментов**

Убедитесь, что пакет Plymouth установлен:

```
sudo dnf install plymouth plymouth-system-theme
```

## 3. **Создание кастомной темы**

1. Создайте папку для новой темы:
    
```
sudo mkdir -p /usr/share/plymouth/themes/apple_logo
```
    
2. Перенесите изображение яблока в эту папку:

```
sudo cp /путь/к/apple-logo.png /usr/share/plymouth/themes/apple_logo/
```
    
3. Создайте файл конфигурации темы:
```
sudo nano /usr/share/plymouth/themes/apple_logo/apple_logo.plymouth
```
    
Вставьте следующий текст:
```
[Plymouth Theme]
Name=Apple Logo
Description=Loading screen with Apple logo
ModuleName=script
    
[script]
ImageDir=/usr/share/plymouth/themes/apple_logo
ScriptFile=/usr/share/plymouth/themes/apple_logo/apple_logo.script
```
    
4.  Создайте файл сценария:
```
sudo nano /usr/share/plymouth/themes/apple_logo/apple_logo.script
```
    
Вставьте следующий код:
```
lua# Assign the logo image
image = Image("apple-logo.png")
    
# Set the screen to black
screen_width, screen_height = Window.GetSize()
Window.SetBackgroundTopColor(0, 0, 0)  # Black
Window.SetBackgroundBottomColor(0, 0, 0)  # Black
    
# Center the logo
image_width, image_height = image:GetSize()
x = (screen_width - image_width) / 2
y = (screen_height - image_height) / 2
image:Draw(x, y)
```
    
## 4. **Применение темы**

1. Установите новую тему:
```
sudo plymouth-set-default-theme -R apple_logo
```
    
2. Пересоздайте образ initramfs с новой темой:
```
sudo dracut -f
```
    
## 5. **Перезагрузка и тестирование**

Перезагрузите систему, чтобы увидеть изменения:
```
sudo reboot
```

## 6. **Дополнительно**

Если хотите вернуться к оригинальной теме, используйте команду:

```
bashsudo plymouth-set-default-theme -R default
sudo dracut -f
sudo reboot
```

Это вернет стандартную тему Fedora.
