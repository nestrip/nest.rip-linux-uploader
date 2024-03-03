#!/bin/bash
sudo pacman -S --noconfirm curl jq inotify-tools
sudo rm -r -f $HOME/.nest
mkdir -p "${HOME}"/.config/systemd/user
mkdir -p $HOME/.nest
read -p "Enter your api key: " API_KEY
echo $API_KEY > $HOME/.nest/api_key
sudo cp -u uploader.sh $HOME/.nest/uploader.sh
sudo chmod +x $HOME/.nest/uploader.sh
sudo cp -u nest.service "${HOME}"/.config/systemd/user/nest.service
sudo systemctl daemon-reload
systemctl --user enable nest
systemctl --user start nest
echo Successfully installed nest.rip uploader service onto your device