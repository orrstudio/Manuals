---
created: 2025-01-18T23:39:52 (UTC +04:00)
tags: []
source: https://schneegans.de/windows/unattend-generator/usage/
author: 
---

# Используйте файлы autounattend.xml для установки Windows 10/11.

> ## Excerpt
> Программа установки Windows автоматически выполнит поиск autounattend.xml файлы в разных местах, включая корневые папки  каждого съемного диска  . Таким образом, вам не требуется стороннее программное обеспечение и не нужно изменять файлы .iso или .wim. Просто используйте исходный файл .iso от Microsoft, например Win11_24H2_English_x64.isoи выполните следующие действия:

---
Программа установки Windows автоматически выполнит поиск `autounattend.xml` файлы в разных местах, включая корневые папки [каждого съемного диска](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-setup-automation-overview?view=windows-11#implicit-answer-file-search-order) . Таким образом, вам не требуется стороннее программное обеспечение и не нужно изменять файлы .iso или .wim. Просто используйте исходный файл .iso от Microsoft, например `Win11_24H2_English_x64.iso`и выполните следующие действия:

### Установка Windows с DVD-диска

1.  Заполните [форму](https://schneegans.de/windows/unattend-generator/) , затем нажмите кнопку кнопка.
2.  Скопируйте `autounattend.xml` файл в корневую папку USB-накопителя и подключите его к компьютеру.
3.  Загрузитесь с DVD-привода, чтобы начать автоматическую установку.

### Установка Windows с USB-накопителя

1.  Заполните [форму](https://schneegans.de/windows/unattend-generator/) , затем нажмите кнопку кнопка.
2.  Скопируйте `autounattend.xml` файл в корневую папку USB-накопителя, содержащего файлы установки Windows, и подключите его к компьютеру. ( `autounattend.xml` файл будет находиться в той же папке, что и `setup.exe`.)
3.  Загрузитесь с USB-накопителя, чтобы начать автоматическую установку.

### Установка Windows на виртуальную машину в VMware Workstation

1.  Заполните [форму](https://schneegans.de/windows/unattend-generator/) , обязательно установите флажок _Установить VMware Tools_ , затем нажмите кнопку кнопка.
2.  Создайте свою виртуальную машину. Если VMware использует _Easy Install_ , удалите диск, на котором `autoinst.flp` или `autoinst.iso` прилагаются: ![](https://schneegans.de/windows/unattend-generator/vmware.png)
3.  Attach the following images to your VM as optical drives:
    -   The Windows installation image, such as `Win11_24H2_English_x64.iso`
    -   The VMware Tools image, which can be found at `C:\Program Files (x86)\VMware\VMware Workstation\windows.iso`
    -   The `unattend.iso` image downloaded earlier
4.  Start the VM to begin the unattended installation.

### To install Windows on a virtual machine in Oracle VirtualBox

1.  Fill out [the form](https://schneegans.de/windows/unattend-generator/), make sure to check _Install Oracle VirtualBox Guest Additions_, then click the button.
2.  Create your VM. Since we want to use our own `autounattend.xml` file and not the one provided by VirtualBox, check the _Skip Unattended Installation_ setting: ![](https://schneegans.de/windows/unattend-generator/virtualbox-basic.png)
3.  Attach the following images to your VM as optical drives:
    
    -   The Windows installation image, such as `Win11_24H2_English_x64.iso`
    -   The Guest Additions image, which can be found at `C:\Program Files\Oracle\VirtualBox\VBoxGuestAdditions.iso`
    -   The `unattend.iso` image downloaded earlier
    
    ![](https://schneegans.de/windows/unattend-generator/virtualbox-settings.png)
4.  Start the VM to begin the unattended installation.

### To install Windows on a virtual machine in Proxmox VE

1.  Fill out [the form](https://schneegans.de/windows/unattend-generator/), make sure to check _Install VirtIO Guest Tools and QEMU Guest Agent_, then click the button.
2.  Upload these .iso files to Proxmox:
    -   The Windows installation image, such as `Win11_24H2_English_x64.iso`
    -   The `virtio-win-*.iso` image, which contains the `virtio-win-guest-tools.exe` installer and can be downloaded in its [latest stable](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso) or its [most recent](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso) version
    -   The `unattend.iso` image downloaded earlier
3.  Create your VM and configure its CD/DVD drives as follows: ![](https://schneegans.de/windows/unattend-generator/proxmox-hardware.png)
4.  Start the VM to begin the unattended installation.

### To install Windows on a virtual machine in Hyper-V

1.  Fill out [the form](https://schneegans.de/windows/unattend-generator/), then click the button. (Note that there is no option to install the `vmguest.iso` image because it is [no longer needed or included](https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/manage/manage-hyper-v-integration-services#keep-integration-services-up-to-date) in Hyper-V.)
2.  Create your VM.
3.  Add an additional DVD drive to the VM and attach the `unattend.iso` image downloaded earlier: ![](https://schneegans.de/windows/unattend-generator/hyper-v.png)
4.  Start the VM to begin the unattended installation.

## Troubleshooting

`autounattend.xml` files generated by this service work with any version of Windows 10 and Windows 11, including 24H2, in both _ConX_ and legacy setup modes. When an answer file is not processed as expected, check for the following:

-   Tools like Ventoy or Rufus might insert their own `autounattend.xml` file into the Windows Setup files that is higher up in the [search order](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-setup-automation-overview?view=windows-11#implicit-answer-file-search-order) and thus takes preference over your `autounattend.xml` file.
-   Use the original Windows [10](https://www.microsoft.com/software-download/windows10) or [11](https://www.microsoft.com/software-download/windows11) .iso images from Microsoft, like `Win11_24H2_English_x64.iso`. There is hardly a reason to modify .iso or .wim files anyway – use custom scripts in your `autounattend.xml` file instead.
-   When you edit an `autounattend.xml` file manually, make sure it contains a `<?xml version='1.0' encoding='utf-8' standalone='yes' ?>` XML declaration and does **not** contain a UTF-8 byte-order mark.

The unattended installation writes error messages and other output to various log files:

| Path | Phase | Contents |
| --- | --- | --- |
| 
-   `X:\Windows\setupact.log`
-   `X:\Windows\setuperr.log`

 | Windows PE | Windows Setup logs for PE phase. Inspect these files when Windows Setup does not seem to apply your `autounattend.xml` file. |
| 

-   `X:\diskpart.log`

 | Windows PE | Output of `diskpart` script to partition and format your hard drive. |
| 

-   `C:\Windows\Setup\Scripts\Specialize.log`
-   `C:\Windows\Setup\Scripts\DefaultUser.log`
-   `C:\Windows\Setup\Scripts\FirstLogon.log`
-   `%TEMP%\UserOnce.log`

 | After Windows has been installed | Output of custom scripts, WLAN setup and various other configuration actions. |
| 

-   `C:\Windows\Temp\remove-packages.log` (previously)
-   `C:\Windows\Temp\remove-features.log` (previously)
-   `C:\Windows\Temp\remove-caps.log` (previously)
-   `C:\Windows\Setup\Scripts\RemovePackages.log`
-   `C:\Windows\Setup\Scripts\RemoveFeatures.log`
-   `C:\Windows\Setup\Scripts\RemoveCapabilities.log`

 | After Windows has been installed | Logs results of bloatware removal. |
| 

-   `C:\Windows\Setup\Scripts\SetComputerName.log`

 | After Windows has been installed | Output of PowerShell script that sets your computer's name. |
