#!/bin/bash
set -ex

# a script to create and register a swap file
# tested on Ubuntu 19.10, should work on any linux
fpath=$1
size=$2

# create swapfile
sudo dd if=/dev/zero of=$fpath bs=1024 count=$size

# change ownership to root and make it non-readable to other users
sudo chown root:root $fpath
sudo chmod 0600 $fpath

# register swapfile with os
sudo mkswap $fpath

# and turn it on
sudo swapon $fpath

# register the swapfile with the os for startup
echo "$fpath	swap	swap	sw	0	0" | sudo tee -a /etc/fstab

# print out swaps
cat /proc/swaps
