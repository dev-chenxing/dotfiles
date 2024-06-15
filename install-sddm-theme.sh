#!/usr/bin/bash

paru -S where-is-my-sddm-theme-git
sudo cp sddm/sddm.conf /etc
sudo cp -r sddm/where_is_my_sddm_theme /usr/share/sddm/themes