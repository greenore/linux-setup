#!/bin/bash

## Add SSH 
# ssh-add /location_to_the_key_file/xxxxxx.pem

# System 
#-------
## Configure Guests
sudo nano /etc/network/interfaces

## Add
# The host-only network interface
auto eth1
iface eth1 inet static
address 192.168.56.104
netmask 255.255.255.0
network 192.168.56.0
broadcast 192.168.56.255

# Set in virtualbox in the network settings the port forwarding
# Host IP (leave emtpy):
# Host Port: 8787
# Guest IP: 192.168.56.101
# Guest Port: 8787sudo

# Add apt-fast
sudo add-apt-repository ppa:saiarcot895/myppa
sudo apt-get update
sudo apt-get install apt-fast

# Upgrade system
sudo apt-fast update
sudo apt-fast upgrade
sudo apt-fast dist-upgrade

# Kernel upgrade (vivid is the 15.04 version...)
sudo apt-get install --install-recommends linux-generic-lts-vivid

# Install ssh-server
sudo apt-get install openssh-server

# Installs Microsoft Core Fonts (Arial,Times New Roman and  many more)
sudo apt-fast install ttf-mscorefonts-installer

## Install Node
sudo apt-fast install nodejs
sudo apt-fast install npm

## If the link is missing execute Node.js
sudo ln -s /usr/bin/nodejs /usr/local/bin/node
sudo ln -s /usr/bin/nodejs /usr/bin/node

## Install ionic & cordova
sudo npm install -g cordova ionic

## Samba File server
# See https://www.liberiangeek.net/2014/07/ubuntu-tips-create-samba-file-server-ubuntu-14-04/ for more
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

## Adduser
#The first time you add a linux user (adduser) you need to add them to smbpasswd as well.
sudo smbpasswd -a <user>
# when prompted for a password use the same password you used with adduser. After this the smb password should be updated
# automatically when you change the linux password with sudo passwd <user>

## Change folder permission
sudo chmod -R 0755 /this/folder/is/shared
sudo chown -R nobody:nogroup /this/folder/is/shared

sudo service smbd restart

## Git
sudo apt-fast install git

# Cleanup
#--------
sudo apt-fast autoremove
sudo apt-fast autoclean
sudo apt-fast clean
