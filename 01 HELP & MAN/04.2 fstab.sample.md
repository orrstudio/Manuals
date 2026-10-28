# Static information about the filesystems.
# See fstab(5) for details.

# /dev/sda - ATA Hitachi HTS54101 - GPT - 1 Tb

# <device>  <dir> <type> <options> <dump> <fsck>

# /dev/sda1 - [EFI System Partition] - FAT32 - 512 Mb - boot, esp
  /dev/sda1 /boot vfat   defaults  0      2

# /dev/sda2 - [Arch Linux] - ROOT - 150 Gb
  UUID=39712764-cbc7-486f-83de-7eae9b8b4120  /  btrfs  rw,relatime,compress=zstd:3,space_cache=v2,autodefrag,subvolid=256,subvol=/@  0  0

# /dev/sda3 - [DATA] - /HOME - 469 Gb
  UUID=b5415b2f-04f7-406b-bb56-648dca27ccf0  /home/orr/.DATA   ext4   defaults   0  0
# /dev/sda4 - []
# Non

# /dev/sda5 - [linux swap] - SWAP - 12 Gb
# UUID=55fefca1-aaf5-46e4-9c1f-f396ada8dd99  none   swap   defaults   0  0

# /dev/sda6 - [Ms Windows 8] - C:\ - 300 Gb
# UUID=36987F9F716EDE2C	  /run/media/WINDOWS/   ntfs-3g   defaults   0  0

# TMPFS
  tmpfs	/dev/shm	tmpfs   rw,nodev,nosuid,size=12G   0  0
  tmpfs	/tmp		tmpfs   rw,nodev,nosuid,size=12G   0  0
