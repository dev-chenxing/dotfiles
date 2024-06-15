#!/usr/bin/bash

sudo pacman -S powerline-fonts
git clone --recursive https://github.com/andresgongora/synth-shell.git $HOME/synth-shell
$HOME/synth-shell/setup.sh
rm -rf $HOME/synth-shell
cp synth-shell/synth-shell-prompt.config $HOME/.config/synth-shell