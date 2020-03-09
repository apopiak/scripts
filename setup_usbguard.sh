#!/bin/bash
set -ex

# an interactive script to install and setup usbguard on ubuntu
# usbguard: https://usbguard.github.io/

# install usbguard and its associated applet (for GUI control)
sudo apt install usbguard usbguard-applet-qt

# generate a usb device policy based on currently plugged in devices
sudo usbguard generate-policy | sudo tee /etc/usbguard/rules.conf

# add your username to IPCAllowedUsers as described here:
# https://usbguard.github.io/documentation/configuration.html
echo "add your username (`whoami`) to IPCAllowedUsers"
echo "opening nano in 5sec..."
sleep 5
sudo nano /etc/usbguard/usbguard-daemon.conf

# start the service
sudo systemctl start usbguard.service

# start the service on system startup
sudo systemctl enable usbguard.service

# show service status for verification
systemctl status usbguard --no-pager