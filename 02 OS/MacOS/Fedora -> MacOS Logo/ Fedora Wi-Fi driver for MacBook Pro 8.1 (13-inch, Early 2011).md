https://chatgpt.com/share/6792b52f-e6ec-8001-b9f6-869e8f4e60ff


---
created: 2025-01-24T02:02:34 (UTC +04:00)
tags: []
source: https://chatgpt.com/c/6792b4d6-4498-8001-beba-13ed6bfb1cc4
author: 
---

# Wi-Fi драйвер для Fedora

> ## Excerpt
> A conversational AI system that listens, learns, and challenges

---
В Fedora по умолчанию включены только открытые компоненты, но можно включить поддержку проприетарного программного обеспечения и драйверов. Вот как это сделать:

___

## **1\. Добавление RPM Fusion репозиториев**

RPM Fusion предоставляет доступ к проприетарным драйверам и программному обеспечению.

### Установите RPM Fusion Free и Nonfree:

```
bashsudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

```

После этого база пакетов обновится автоматически.

___

## **2\. Установка проприетарных драйверов**

### Для видеокарт NVIDIA:

```
bashsudo dnf install akmod-nvidia

```

> Пакет `akmod-nvidia` автоматически соберёт и установит драйверы NVIDIA для вашей системы.

Если у вас старое оборудование NVIDIA, установите более старую версию драйверов:

```
bashsudo dnf install xorg-x11-drv-nvidia-390xx akmod-nvidia-390xx

```

### Для Broadcom Wi-Fi:

Если вы используете чип Broadcom:

```
bashsudo dnf install broadcom-wl

```

___

## **3\. Установка проприетарного мультимедиа-кодеков**

Fedora не включает многие кодеки (например, MP3, H.264, H.265, AAC). После добавления RPM Fusion выполните:

```
bashsudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

```

___

## **4\. Установка Steam, Wine и других игровых инструментов**

Для Steam:

```
bashsudo dnf install steam

```

Для Wine:

```
bashsudo dnf install wine

```

___

## **5\. Установка других проприетарных программ**

### Google Chrome:

```
bashsudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable

```

### Microsoft Edge:

```
bashsudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf install microsoft-edge-stable

```

___

## **6\. Установка Flatpak приложений**

Flatpak предоставляет доступ к дополнительным приложениям, включая проприетарные. Убедитесь, что Flatpak настроен:

```
bashsudo dnf install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

```

Установите приложения через Flatpak (например, Spotify):

```
bashflatpak install flathub com.spotify.Client

```

___

## **7\. Проверка и обновление системы**

После настройки всех источников выполните обновление:

```
bashsudo dnf upgrade --refresh

```

___

Теперь Fedora будет поддерживать и проприетарные драйверы, и софт. Для удобства вы можете использовать менеджер приложений, такой как GNOME Software, для поиска и установки программ.
