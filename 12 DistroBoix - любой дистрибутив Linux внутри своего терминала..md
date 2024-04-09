# [⭐️ Ссылка на видео по теме "Как использовать AUR в любом дистрибутиве Linux"](https://www.youtube.com/watch?v=RHOcNRWiL4g)

> [distrobox-create - описание](https://github.com/89luca89/distrobox/blob/main/docs/usage/distrobox-create.md)

## ⭐️ После установки Distrobox (дополнително нужно установить `podman` или `docker` или `lilipod`) необходимо создать директорию по пути `/etc/containers` и поместить в неё файл `policy.json`.

> Этот файл необходим для работы `Podman` и `Docker`, и он содержит политики безопасности для контейнеров.

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

> Эти команды создадут файл `policy.json` с базовой политикой безопасности, которая позволяет всем контейнерам запускаться.

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
> 
> Дополнително:  
> --image/-i: изображение, которое будет использоваться в качестве контейнера по умолчанию: ${container_image_default}  
> --name/-n: имя дистрибутива по умолчанию: ${container_name_default}  
> --hostname: имя хоста для дистрибутива по умолчанию: <имя-контейнера>.$(uname -n)  
> --pull/-p: извлечь изображение, даже если оно существует локально (подразумевается --yes)  
> --yes/-Y: неинтерактивно, извлекать изображения без запроса  
> --root/-r: запустить podman/docker/lilipod с правами root. Обратите внимание: если вам нужен root, это предпочтительный вариант. путь через «sudo distrobox» (примечание: если для получения root-прав необходимо использовать программу, отличную от   «sudo», укажите его через переменную env DBX_SUDO_PROGRAM или переменную конфигурации distrobox_sudo_program)  
> --clone/-c: имя контейнера дистрибутива, который будет использоваться в качестве основы для нового контейнера. это будет полезно либо для переименования существующего дистрибутива, либо для создания нескольких копий. той же среды.  
> --home/-H: выберите собственный домашний каталог для контейнера. Полезно, чтобы избежать засорения дома хоста временными файлами.  
> --volume: дополнительные тома для добавления в контейнер  
> --additional-flags/-a: дополнительные флаги для передачи команде менеджера контейнеров  
> --additional-packages/-ap: дополнительные пакеты для установки во время первоначальной настройки контейнера.  
> --init-hooks: дополнительные команды, выполняемые во время инициализации контейнера.  
> --pre-init-hooks: дополнительные команды, которые необходимо выполнить перед инициализацией контейнера.  
> --init/-I: использовать систему инициализации (например, systemd) внутри контейнера. это сделает процессы хоста невидимыми изнутри контейнера. (предполагается --unshare-process) могут потребоваться дополнительные пакеты в зависимости от образа   контейнера: https://github.com/89luca89/distrobox/blob/main/docs/useful_tips.md#using-init-system-inside-a-distrobox  
> --nvidia: попытаться интегрировать драйверы nVidia хоста в гостевую систему  
> --unshare-devsys: не использовать совместно хост-устройства и каталоги sysfs с хоста  
> --unshare-groups: не пересылать дополнительные группы пользователя в контейнер  
> --unshare-ipc: не использовать пространство имен ipc совместно с хостом  
> --unshare-netns: не разделять сетевое пространство имен с хостом  
> --unshare-process: не разделять пространство имен процесса с хостом  
> --unshare-all: активировать все флаги отмены общего доступа ниже  
> --compatibility/-C: показать список совместимых изображений  
> --help/-h: показать это сообщение  
> --no-entry: не создавать запись контейнера в списке приложений   
> --dry-run/-d: печатать только сгенерированную команду менеджера контейнеров  
> --verbose/-v: показать больше подробностей  
> --version/-V: показать версию  
>   
> --absolutely-disable-root-password-i-am-really-positive-sure: ⚠️ ⚠️ при настройке корневого дистрибутива установка пароля пользователя будет пропущена, и он останется пустым. ⚠️ ⚠️    
>    

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
