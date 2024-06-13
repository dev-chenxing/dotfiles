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

-   Set your Mirror Region to where you are.
-   Keep the Locales as it (us, en_US, UTF-8).
-   Select `Use a best-effort default partition layout` for partitioning, and select the hard drive to use. Select `ext4` for filesystem.
-   Leave the Disk encryption as empty.
-   Use `Grub` for the bootloader.
-   Specify your Hostname: `arch`
-   Add your user account (Remember you **password**!), and `yes`, it should be a superuser. Confirm and exit.
-   For Profile, set `type` to `Desktop`, and select `Bspwm` as our desktop environment, and choose `sddm` as our Greeter.
-   Choose `Pulseaudio` for audio server.
-   Additional packages to install: `firefox neofetch sxhkd polybar picom rofi dunst nitrogen alacritty lf thunar git`
-   Then, `Copy ISO network configuration to installation`.
-   Set your timezone.
-   Enable `multilib` as an optional additional repositories.

And we are good to go!

**INSTALL!**

Then, select `yes` when asked whether to chroot into the installation.

Now we need to do the basic configuration for bspwm, or else you will be getting a black screen upon logging in.

```bash
su - <"username"> # login into your user
```

Then, clone this repository to `HOME`

```bash
git clone https://github.com/dev-chenxing/dotfiles.git
```

Run the `./post-installation` script

```bash
cd dotfiles`
chmod +x ./post-installation
./post-installation
```

This will initialize the configuration files for `bspwm`, `sxhkd`, `picom`, `polybar`, and `dunst`

Next, we will make some changes to these configuration files.

First, add the auto start applications to `bspwm/bspwmrc`

```bash
nano bspwm/bspwmrc
```

```
# auto start applications
nitrogen --restore &
polybar &
picom --config $HOME/.config/picom/picom.conf &
dunst &
```

`Ctrl-S` to save, `Ctrl-X` to exit.

Next, edit keybindings

```bash
nano sxhkd/sxhkdrc
```

First, change the `terminal emulator` to `alacritty`

```
# terminal emulator
super + Return
    alacritty
```

Change the `program launcher` to `rofi` and rebind it to `super + d`

```
# program launcher
super + d
    rofi -show drun
```

And we will leave the rest as it for now.

![sxhkdrc](/screenshots/sxhkdrc.png)

Now exit from chroot and our installation is completed.

```bash
exit # logout from [username@archiso ~]$
exit # exit from [username@archiso /]$
exit # exit from [root@archiso /]#
```

**REBOOT** and `Boot existing OS` this time.

```bash
reboot
```

If you follow the instructions above, right now you should be greeted by the default `sddm` display manager.

![sddm](/screenshots/sddm.png)

Once you have successfully logged in to your user account, your desktop should look like what's below

![bspwm](/screenshots/bspwm.png)

`Win + Enter` to bring up the terminal.

### How to Setup Chinese Input Method

> Written on May 23rd, 2024

We are going to use `fcitx5` for our input method and `Noto Sans Mono CJK` for our font

```bash
sudo pacman -Sy fcitx5-im
sudo pacman -Sy fcitx5-chinese-addons
sudo pacman -S noto-fonts-cjk
```

Set the IM modules environment variables and reboot

```bash
sudo nano /etc/environment
```

```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```

![etc_environment](/screenshots/etc_environment.png)

`Win + D` to launch Rofi and run the _Fcitx 5 Configuration_. Click on the `Run Fcitx 5` button.

On the right panel, search input method `Pinyin` and double click on it to set it as Current Input Method.

Then go to the `Global Options` section, remove the `Enumerate Input Method Group Forward/Backward` keybinds and change the `Trigger Input Method` keybind to `Super+Space`.

Apply the changes and go back to the `Input Method` section. Select `Pinyin` and click on the `Configure` button.

-   Enable Cloud Pinyin
-   Configure Cloud Pinyin:
    -   Minimum Pinyin Length: 2
    -   Backend: Baidu
-   Previous Candidate: Left
-   Next Candidate: Right

![fcitx5](/screenshots/fcitx5.png)

One last step to set is to add fcitx5 to the list of auto start applications

```bash
nano .config/bspwm/bspwmrc
```

```
# auto start applications
nitrogen --restore &
polybar &
picom --config $HOME/.config/picom/picom.conf &
dunst &
fcitx5 -d &
```

We also need to edit the locale file

```bash
sudo nano /etc/locale.gen`
```

Uncomment lines:

```
zh_CN.UTF-8 UTF-8
zh_HK.UTF-8 UTF-8
zh_TW.UTF-8 UTF-8
```

### Install VSCode

- To install the open source version: `pacman -S code`
- 