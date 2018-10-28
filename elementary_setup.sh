# SOFTWARE
#---------
# Gimp
# Firefox
# Chrome
# Gparted
# Inkscaped
# Menueditor
# VLC
# RStudio
# Brackets
# VSCode
# WPS
# Openshot

#!/bin/bash

# Bugs
#-----

## If distro fails to identify Broadcom wireless adapter
#sudo apt-get install b43-fwcutter firmware-b43-installer

## Freya Beta 1 --> ctrl-alt-T no Terminal
#sudo update-alternatives --config x-terminal-emulator
#and choose pantheon-terminal in the list.

## Add SSH 
# ssh-add /location_to_the_key_file/xxxxxx.pem

# System 
#-------
# Add apt
sudo add-apt-repository ppa:saiarcot895/myppa
sudo apt-get update
sudo apt-get install apt

# Upgrade system
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade

# Kernel upgrade (vivid is the 15.04 version...)
sudo apt-get install --install-recommends linux-generic-lts-vivid

# Install Elementary Tweaks
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
sudo apt update && sudo apt install elementary-tweaks

# sudo apt install elementary-wallpaper-collection
sudo apt install elementary-.*-theme elementary-.*-icons

## Virtualbox Guest Additions (for optimal interaction)
sudo apt install virtualbox-guest-utils
usermod -a -G vboxsf tim
usermod -a -G vboxsf rstudio-server
mkdir /home/tim/R
ln -s /media/sf_R /home/tim
# unlink /home/tim/sf_R

## Configure Guests
# Temporary
ifconfig eth1 192.168.56.101 netmask 255.255.255.0 up

# Permamently
sudo nano /etc/network/interfaces

## Add
# The host-only network interface
auto eth1
iface eth1 inet static
address 192.168.56.101
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

# Internet
#---------
# Install Browser
sudo apt install firefox

# Install flash plugin
sudo apt install adobe-flashplugin

# Install java for browser
sudo apt install icedtea-plugin

# Enable H.264 support for Firefox:
sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt update
sudo apt install gstreamer0.10-ffmpeg

# Media
#------
# Install VLC Media Player
sudo apt install vlc

# Silverlight Installation
sudo add-apt-repository ppa:pipelight/stable
sudo apt update && sudo apt-get install pipelight-multi
sudo pipelight-plugin --enable silverlight

# Audacity
sudo apt install audacity

# Install Videoeditor (Openshot)
sudo add-apt-repository ppa:openshot.developers/ppa
sudo apt install openshot openshot-doc

# Office
#-------
# Install WPS-Office
mkdir ~/Downloads/wps-office
cd ~/Downloads/wps-office
wget -c http://kdl.cc.ksosoft.com/wps-community/download/a18/wps-office_9.1.0.4961~a18p1_amd64.deb     # WPS-Office
wget -c http://kdl.cc.ksosoft.com/wps-community/download/a15/wps-office-fonts_1.0_all.deb              # Fonts
wget -c http://kdl.cc.ksosoft.com/wps-community/download/a15/wps-office-mui-de_9.1.0.4751~a15_all.deb  # German Language
wget -c http://kdl.cc.ksosoft.com/wps-community/download/a15/wps-office-mui-fr_9.1.0.4751~a15_all.deb  # French Language
sudo dpkg -i wps-office*

# Spell checker
wget -c http://wps-community.org/download/dicts/de_DE.zip
wget -c http://wps-community.org/download/dicts/fr_FR.zip

unzip de_DE.zip 
unzip fr_FR.zip
rm de_DE.zip 
rm fr_FR.zip
sudo mv de_DE /opt/kingsoft/wps-office/office6/dicts/
sudo mv fr_FR /opt/kingsoft/wps-office/office6/dicts/

# Installs Microsoft Core Fonts (Arial,Times New Roman and  many more)
sudo apt install ttf-mscorefonts-installer

## Data Science
#---------------
# Curl Dependencies
sudo apt install libcurl4-openssl-dev 

# GEOS Dependencies
sudo apt install libgeos-dev

# RODBC Dependencies
sudo apt install libiodbc2 libiodbc2-dev

# R Dependencies
sudo apt install libxft-dev

# Install R-Base
sudo add-apt-repository ppa:marutter/rrutter
sudo apt update
sudo apt install r-base

# RStudio Server
sudo nano /etc/rstudio/rserver.conf
rsession-which-r=/usr/lib64/RRO-3.2.0/R-3.2.0/bin/R

# Install latex
sudo apt install texlive texlive-latex-extra

# Brackets
sudo add-apt-repository ppa:webupd8team/brackets
sudo apt update
sudo apt install brackets

# Atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom

## System Settings
#-----------------
# Install menulibre
sudo apt install menulibre

# Install gparted
sudo apt install gparted

# Install Multimedia Codecs and Enable DVD Playback
sudo apt-add-repository ppa:mc3man/trusty-media
sudo apt update
sudo apt install ubuntu-restricted-extras ffmpeg gstreamer0.10-plugins-ugly libavcodec-extra-54 libvdpau-va-gl1 libmad0 mpg321 gstreamer1.0-libav

# Install Plugin Flash Player and Pepper Flash
sudo apt install flashplugin-installer pepperflashplugin-nonfree

# Install JAVA
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java9-installer

# Install Support for Archive Formats and Restricted Extras
sudo apt unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip

# Install Graphic Editor
sudo apt install gimp inkscape

# Install Skype
sudo apt install skype

#For Laptop: Install TLP for Improve Battery Life and Reduce Overheating
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw
sudo tlp start

# Backup
#-------
sudo add-apt-repository ppa:deja-dup-team/testing
sudo apt update
sudo apt install deja-dup

# Adding Deja-dup support to Files
# With Sudo Create dejadup-restore.contract in /usr/share/contractor

[Contractor Entry]  
Name=Restore missing files in folder  
Icon=edit-find  
Description=Restores missing files in folder using dejadup  
MimeType=inode/directory  
Exec=deja-dup --restore-missing %U  
Gettext-Domain=deja-dup

# Create dejadup-revert.contract
[Contractor Entry]  
Name=Revert to previous version...  
Description=Revert to a previous version  
Icon=edit-find  
MimeType=application/octet-stream  
Exec=deja-dup --restore %U  
Gettext-Domain=deja-dup

# Cleanup
#--------
sudo apt autoremove
sudo apt autoclean
sudo apt clean
