# efibootmgr

## Для установки

```bash
$ yay -S efibootmgr
```

## Для просмотра текущего порядка агрузки

```bash
$ sudo efibootmgr -v
BootCurrent: 0001
Timeout: 0 seconds
BootOrder: 3002,3001,2001,0002,0001
Boot0001* rEFInd Boot Manager	HD(1,GPT,91788eff-05ab-45cb-ba20-1a7d8815de17,0x800,0x100000)/File(\EFI\refind\refind_x64.efi)
Boot0002* Microsoft Windows 10 HD(1,GPT,91788eff-05ab-45cb-ba20-1a7d8815de17,0x800,0x100000)/File(\EFI\Microsoft\Boot\bootmgfw.efi)
Boot2001* USB Drive (UEFI)	RC
Boot3001* EFI Internal Hard Disk
Boot3002* EFI Solid State Disk	RC
```

## Для изменения порядка агрузки

```bash
$ sudo efibootmgr -o 3002,3001,2001,0001,0002
BootCurrent: 0001
Timeout: 0 seconds
BootOrder: 3002,3001,2001,0002,0001
Boot0001* rEFInd Boot Manager	HD(1,GPT,91788eff-05ab-45cb-ba20-1a7d8815de17,0x800,0x100000)/File(\EFI\refind\refind_x64.efi)
Boot0002* Microsoft Windows 10 HD(1,GPT,91788eff-05ab-45cb-ba20-1a7d8815de17,0x800,0x100000)/File(\EFI\Microsoft\Boot\bootmgfw.efi)
Boot0002* Microsoft Windows 10
Boot2001* USB Drive (UEFI)	RC
Boot3001* EFI Internal Hard Disk
Boot3002* EFI Solid State Disk	RC
```

## Для создании новой записи

```bash
efibootmgr -c -L "Arch linux" -l '\vmlinuz-linux' -u "root=/dev/sda2 rw initrd=\initramfs-linux.img enforcing=0"
```
или
```bash
sudo efibootmgr --create --part 1 --label "Linux" --loader '\efi\boot\bootx64.efi'
```
