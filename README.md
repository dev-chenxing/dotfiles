# 🗃️ dotfiles

The configuration files for my Arch Linux laptop. It also comes with a step-by-step guide to install and configure Arch Linux.

## Screenshots

![image](/screenshots/screenshot.png)

## Guides

### How to Install Arch Linux

> Written on May 21st, 2024

![Arch Linux Install](/screenshots/arch_linux_install.png)

Select `Arch Linux install medium (x86_64, BIOS)` to boot the Arch Linux install medium on BIOS.

![root@archiso](/screenshots/root@archiso.png)

To connect to Wi-Fi, use the `iwctl` utility

```bash
iwctl
```

With the `iwd` console, you can check the available devices in Station mode, get available networks, and connect to network

```bash
station list # List devices in station mode
station wlan0 get-networks # get networks for station wlan0
station wlan0 connect <"network name"> # connect to network
```

After you enter the correct Passphrase, the state of the device should now be `connected`. To exit the `iwc` console, enter

```bash
quit
```

Before we install and run the `archinstall`, we should probably sync the packages

```bash
pacman -Syy
pacman -S archinstall
archinstall
```

![archinstall](/screenshots/archinstall.png)

Set your Mirror Region to where you are.

Keep the Locales as it (us, en_US, UTF-8).

Select `Use a best-effort default partition layout` for partitioning, and select the hard drive to use. Select `ext4` for filesystem.

Leave the Disk encryption as empty.

Use `Grub` for the bootloader.

Specify your Hostname: `arch`

Add your user account, and `yes`, it should be a superuser. Confirm and exit.

For Profile, set `type` to `Desktop`, and select `Bspwm` as our desktop environment, and choose `sddm` as our Greeter. 

Choose `Pulseaudio` for audio server.

Additional packages to install: `firefox neofetch sxhkd polybar picom rofi dunst nitrogen alacritty lf`

Then, `Copy ISO network configuration to installation`.

Set your timezone.

Enable `multilib` as an optional additional repositories.

And we are good to go! 

**INSTALL!**

Then, select `no` when asked whether to chroot into the installation.

**REBOOT** and `Boot Existing OS` this time.