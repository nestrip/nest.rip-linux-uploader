#!/bin/bash
sudo pacman -S git --noconfirm
git clone https://github.com/nestrip/nest.rip-linux-uploader.git
cd nest.rip-linux-uploader
chmod +x install.sh
./install.sh