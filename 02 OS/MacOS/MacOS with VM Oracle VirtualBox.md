# MacOS with VM Oracle VirtualBox

## [How to install Mac OS in Ubuntu / Linux using Virtual Box](https://www.youtube.com/watch?v=pl2llo4eWYg)  

### Prerequisites  

 - Virtual Box (6.1)
 - Mac OS
 - PC with 8GB of RAM or higher
 - At least 30GB of extra space

### VM settings for Mac OS  

```
VBoxManage modifyvm "Mac OS" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "Mac OS" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "Mac OS" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "Mac OS" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "macOS"
VBoxManage setextradata "Mac OS" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "Mac OS" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
```

### Set Full Screen  

```
VBoxManage setextradata "Mac OS" VBoxInternal2/EfiGraphicsResolution 1920x1080
```

## [How to Run macOS on Linux - Oracle VirtualBox](https://www.youtube.com/watch?v=V8bXWcqzpCc&t=65s)  

Commands from video:  
```
VBoxManage.exe modifyvm "VM NAME" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "VM NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac19,3"
VBoxManage setextradata "VM NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "VM NAME" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "macOS"
VBoxManage setextradata "VM NAME" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "VM NAME" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
```

