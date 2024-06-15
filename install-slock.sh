#!/usr/bin/bash

git clone https://git.suckless.org/slock $HOME/slock
cp slock/config.def.h $HOME/slock
cd $HOME/slock
sudo make install
cd ..
rm -rf slock