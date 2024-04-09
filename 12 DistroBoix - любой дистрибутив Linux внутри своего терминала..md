# [⭐️ Ссылка на видео "Как использовать AUR в любом дистрибутиве Linux"](https://www.youtube.com/watch?v=RHOcNRWiL4g)

## ⭐️ После установки Distrobox (дополнително нужно установить podman или docker или lilipod) необходимо создать директорию по пути `/etc/containers` и поместить в неё файл `policy.json`.

> Этот файл необходим для работы Podman и Docker, и он содержит политики безопасности для контейнеров.

```bash
sudo mkdir -p /etc/containers
echo '{
  "default": [
    {
      "type": "insecureAcceptAnything"
    }
  ],
  "transports":
    {
      "docker-daemon":
        {
          "": [{"type":"insecureAcceptAnything"}]
        }
    }
}' | sudo tee /etc/containers/policy.json
```

> Эти команды создадут файл policy.json с базовой политикой безопасности, которая позволяет всем контейнерам запускаться.

## ⭐️ Команды создания контейнера в Distrobox

> [Срисок дистрибутивов поддерживаемых Distrobox-ом](https://repology.org/project/distrobox/versions)

```bash
distrobox-create -i archlinux --name arch
distrobox-create -i archlinux --name arch --nvidia
distrobox-create -i archlinux --name arch --init
distrobox-create -i archlinux --name arch --nvidia --init
distrobox-create -i archlinux --name archlinux --nvidia --init --home ~/ArchHome
```

> Где:  
> --name arch - это название контейнера. Оно может быть любым.  
> --nvidia - загружает контейнера с драйвеоами Nvidia  
> --init - загружает контейнера с systemd  
> --home ~/ArchHome - создает контейнер со своей домашней директорией `ArchHome`  

## ⭐️ Команды запуска контейнера в Distrobox

```bash
distrobox enter arch
```

## ⭐️ Команды удаления контейнера из Distrobox

```bash
distrobox-stop arch
distrobox-rm arch
```

## ⭐️ Команды экспорта Distrobox приложений в вашу хост-систему

```bash
distrobox-export -a [application-name]
distrobox-export -b /usr/bin/[binary]
```

## ⭐️ Установка `yay` в контейнере Distrobox-а

```bash
pacman -S --needed git base-devel
git clone https:// aur . archlinux . org /yay.git
cd yay
makepkg -si
```

## ⭐️ Использование yay и pacman для установки программного обеспечения в контейнере Distrobox

```bash
yay [package-name]
pacman -Syu [package-name]
```

## ⭐️ Использование yay и pacman для удаления программного обеспечения и его зависимостей из контейнера Distrobox.
> ⚠️ Не используйте это в вашей хост-системе, так как это может привести к неработоспособности вашей системы. Используйте внутри контейнера Distrobox, это не нанесет никакого вреда вашей хост-системе.

```bash
yay -Rs [packagename]
pacman -Rs [packagename]
```
