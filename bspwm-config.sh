#!/usr/bin/bash

mkdir $HOME/.config/{bspwm,sxhkd,polybar,picom,dunst}
cp -r bspwm $HOME/.config
chmod +x $HOME/.config/bspwm/bspwmrc
cp -r sxhkd $HOME/.config
chmod +x $HOME/.config/sxhkd/sxhkdrc
cp -r picom $HOME/.config
cp -r dunst $HOME/.config
cp -r polybar $HOME/.config

sudo pacman -S noto-fonts noto-fonts-cjk -y
paru -S ttf-symbola -y