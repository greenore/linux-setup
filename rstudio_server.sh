#!/bin/bash

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

# Kernel upgrade (vivid is the 15.04 version...)
sudo apt-get install --install-recommends linux-generic-lts-vivid

## Virtualbox Guest Additions (for optimal interaction)
sudo apt-fast install virtualbox-guest-utils
usermod -a -G vboxsf tim
usermod -a -G vboxsf rstudio-server
mkdir /home/tim/R
ln -s /media/sf_R /home/tim
# unlink /home/tim/sf_R

## Configure Virtual Guests
sudo nano /etc/network/interfaces

## Add
# The host-only network interface (Virtualbox)
auto eth1
iface eth1 inet static
address 192.168.56.101
netmask 255.255.255.0
network 192.168.56.0
broadcast 192.168.56.255

## Configure WLAN (Server)
auto wlan0
iface wlan0 inet dhcp
       wpa-ssid network-name
       wpa-psk pre-shared-key
       wpa-ap-scan 1
       wpa-scan-ssid 1

sudo ifup -v wlan0

# Set in virtualbox in the network settings the port forwarding
# Host IP (leave emtpy):
# Host Port: 8787
# Guest IP: 192.168.56.101
# Guest Port: 8787

# Install ssh-server
sudo apt-get install openssh-server

# Installs Microsoft Core Fonts (Arial,Times New Roman and  many more)
sudo apt-fast install ttf-mscorefonts-installer

## Data Science
#---------------
# Curl Dependencies
sudo apt-fast install libcurl4-openssl-dev 

# GEOS Dependencies
sudo apt-fast install libgeos-dev

# RODBC Dependencies
sudo apt-fast install libiodbc2 libiodbc2-dev

# R Dependencies
sudo apt-fast install libxft-dev

# Install R-Base
sudo add-apt-repository ppa:marutter/rrutter
sudo apt-fast update
sudo apt-fast install r-base

# RStudio Server
sudo nano /etc/rstudio/rserver.conf
rsession-which-r=/usr/lib64/RRO-3.2.0/R-3.2.0/bin/R

# Install latex
sudo apt-fast install texlive texlive-latex-extra

# Install OpenJDK
sudo apt-fast install default-jdk

## Maybe run the following R command
sudo R CMD javareconf
sudo /usr/lib64/RRO-3.2.0/R-3.2.0/bin/R CMD javareconf

# Install Oracle JAVA
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-fast update
sudo apt-fast install oracle-java8-installer

# Swap file
# see https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04

# Cleanup
#--------
sudo apt-fast autoremove
sudo apt-fast autoclean
sudo apt-fast clean
