# Установка rEFInd в NixOS

```bash
sudo nix-shell -p refind efibootmgr
refind-install
```

- Вывод экрана установки

```bash
[nix-shell:/home/orr]# refind-install
ShimSource is none
Installing rEFInd on Linux....
ESP was found at /boot using vfat
Copied rEFInd binary files

Copying sample configuration file as refind.conf; edit this file to configure
rEFInd.

Creating new NVRAM entry
rEFInd is set as the default boot manager.
Creating //boot/refind_linux.conf; edit it to adjust kernel options.

Installation has completed successfully.
```

Пожалуйста, обратите внимание, что rEFInd не может использоваться как есть для загрузки NixOS; в NixOS нет механизма, позволяющего ему знать о поколениях. Однако его можно использовать как посредника или вторичный загрузчик, чтобы выбрать нераспознанные варианты загрузки.

