#!/bin/bash

## Add SSH 
# ssh-add /location_to_the_key_file/xxxxxx.pem

# System 
#-------
# Add apt-fast
sudo add-apt-repository ppa:saiarcot895/myppa
sudo apt-get update
sudo apt-get install apt-fast

# Upgrade system
sudo apt-fast update
sudo apt-fast upgrade
sudo apt-fast dist-upgrade

## Virtualbox Guest Additions (for optimal interaction)
sudo apt-fast install virtualbox-guest-utils
usermod -a -G vboxsf tim
usermod -a -G vboxsf rstudio-server
mkdir /home/tim/R
ln -s /media/sf_R /home/tim
# unlink /home/tim/sf_R

## Configure Guests
sudo nano /etc/network/interfaces

## Add
# The host-only network interface
auto eth1
iface eth1 inet static
address 192.168.56.102
netmask 255.255.255.0
network 192.168.56.0
broadcast 192.168.56.255

# Set in virtualbox in the network settings the port forwarding
# Host IP (leave emtpy):
# Host Port: 8787
# Guest IP: 192.168.56.101
# Guest Port: 8787

# Install ssh-server
sudo apt-get install openssh-server

# Installs Microsoft Core Fonts (Arial,Times New Roman and  many more)
sudo apt-fast install ttf-mscorefonts-installer

## Install Node
sudo apt-fast install nodejs
sudo apt-fast install npm

## If the link is missing execute Node.js
sudo ln -s /usr/bin/nodejs /usr/local/bin/node

## Samba File server
sudo apt-fast install -y samba samba-common python-glade2 system-config-samba

# Conf file
sudo nano /etc/samba/smb.conf
[node-shared]
   path = /this/folder/is/shared
   guest ok = yes
   browseable = yes
   read only = no
   create mask = 0777
   directory mask = 0777
   force create mode = 777
   force directory mode = 777
   force security mode = 777
   force directory security mode = 777

sudo service smbd restart

# Cleanup
#--------
sudo apt-fast autoremove
sudo apt-fast autoclean
sudo apt-fast clean
