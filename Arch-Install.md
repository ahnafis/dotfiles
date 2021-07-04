# Arch Linux Installation Guide For Me

## Keyboard layout
```bash
loadkeys us
```

## Verify the boot mode
To verify boot mode, list the `efivar` directory
```bash
ls /sys/firmware/efi/efivars
```

## Connect to internet
To entering into `iwd`
```
iwctl
```
To list the devices
```
iwd# device list
```
To scan the device for getting networks
```
iwd# station <device name> scan
```
To get networks
```
iwd# station <device name> get-networks
```
To Connect to desired network
```
iwd# station <device name> connect <SSID>
```
```
passphrase: <password>
```
Check the internet with `ping` command
```
ping google.com
```

## Update system clock
```
timedatectl set-ntp true
```

## Partition the disk
To show the partitions
```
lsblk
```
To show the partitions with more details
```
lsblk -f
```
Enter to the `cfdisk` to edit the disk
```
cfdisk /dev/<the disk to be partitioned>
```
Example layouts:  
For BIOS with MBR
```
        Disk partitions     Mount point     Partitions type     Suggested size
/dev/sda
    |__ /dev/sda1           [SWAP]          Linux swap          More than 512 MB    
    |__ /dev/sda2           /mnt            Linux (root)        Remainder of the disk
```
For UEFI with GPT
```
        Disk partitions     Mount point                 Partitions type         Suggested size
/dev/sda
    |__ /dev/sda1           /mnt/boot or /mnt/efi       EFI system partitions   At least 260 MB
    |__ /dev/sda2           [SWAP]                      Linux swap              More than 512 MB    
    |__ /dev/sda3           /mnt                        Linux (root)            Remainder of the disk
```
## Format the partitions
Format the root partitions
```
mkfs.ext4 /dev/root_partition
```
Format the swap partitions
```
mkswap /dev/swap_partition
```
Format the efi partition
```
mkfs.fat -F32 /dev/efi_partition
```

## Mounting the filesystems
Mount the root partitions
```
mount /dev/root_partition   /mnt
```
Mount the swap partitions
```
swapon /dev/swap_partition
```

## Installation
Select the mirrors
```
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
```
Install essential packages
```
pacstrap /mnt base linux linux-firmware vim intel-ucode
```

## Configuring the system
### Fstab
```
genfstab -U /mnt >> /mnt/etc/fstab
```
### Chroot
```
arch-chroot /mnt
```

### Time zone
```
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```
Run hwclock to generate /etc/adjtime
```
hwclock --systohc
```

### Localization
```
vim /etc/locale.gen
```
Uncomment `en_US.UTF-8 UTF-8` and other needed locales  
Generate locales
```
locale-gen
```
```
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
```
### Set the keyboard layout
```
echo "KEYMAP=us" >> /etc/vconsole.conf
```

### Network Configuration
```
echo "hostname" >> /etc/hostname
```
```
vim /etc/hosts
```
and add them to this file
```
127.0.0.1	localhost
::1 		localhost
127.0.1.1	hostname.localdomain	hostname
```

### Root password
```
passwd
```

### Adding user
```
useradd -m username
```
Set password for `username`
```
passwd username
```
Add user to wheel
```
usermod -aG wheel username
```
Install sudo with `pacman` (`pacman -S sudo`) and uncomment `%wheel ALL=(ALL) ALL` in `sudoers` file. To edit `sudoers` file run this
```
EDITOR=vim visudo
```

### Install needed packages
```
pacman -S git mtools dosfstools os-prober dialog ntfs-3g xdg-utils xdg-user-dirs reflector networkmanager pulseaudio pulseaudio-bluetooth pavucontrol alsa-utils base-devel
```

### Installing the bootloader
Installing the `grub` package on the system
```
pacman -S grub
```
Installing `grub` bootloader on the disk
```
grub-install /dev/sda
```
Making a configuration file for `grub`
```
grub-mkconfig -o /boot/grub/grub.cfg
```

### Finishing up
Exit from the arch-chroot with `exit` command and unmount all partitions with `umount -a` and then run `reboot` to reboot


## Post installations 