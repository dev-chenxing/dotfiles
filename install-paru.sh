#!/usr/bin/bash

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
rm -rf paru