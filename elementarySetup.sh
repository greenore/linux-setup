#!/bin/bash

# Bugs
#-----

## If distro fails to identify Broadcom wireless adapter
#sudo apt-get install b43-fwcutter firmware-b43-installer

## Freya Beta 1 --> ctrl-alt-T no Terminal
#sudo update-alternatives --config x-terminal-emulator
#and choose pantheon-terminal in the list.

## Change Background
#sudo cp /usr/share/backgrounds/Blueprint.jpg /usr/share/backgrounds/Backup_Blueprint.jpg
#sudo cp /usr/share/backgrounds/Tunnel.jpg /usr/share/backgrounds/Blueprint.jpg
#sudo cp /usr/share/backgrounds/Leaves.jpg /usr/share/backgrounds/Blueprint.jpg
#sudo cp "/usr/share/backgrounds/The Coast.jpg" /usr/share/backgrounds/Blueprint.jpg
#sudo cp "/usr/share/backgrounds/Horseshoe Bend Sunset.jpg" /usr/share/backgrounds/Blueprint.jpg

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

# Install Elementary Tweaks
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
sudo apt-fast update && sudo apt-fast install elementary-tweaks

# sudo apt-fast install elementary-wallpaper-collection
sudo apt-fast install elementary-.*-theme elementary-.*-icons

## Virtualbox Guest Additions (for optimal interaction)
sudo apt-fast install virtualbox-guest-utils
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

# Install ssh-server
sudo apt-get install openssh-server

# Internet
#---------
# Install Browser
sudo apt-fast firefox

# Install flash plugin
sudo apt-fast install adobe-flashplugin

# Install java for browser
sudo apt-fast install icedtea-plugin

# Enable H.264 support for Firefox:
sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-fast update
sudo apt-fast install gstreamer0.10-ffmpeg

# Media
#------
# Install VLC Media Player
sudo apt-fast install vlc

# Audacity
sudo apt-fast install audacity

# Install Videoeditor (Openshot)
sudo add-apt-repository ppa:openshot.developers/ppa
sudo apt-fast install openshot openshot-doc

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
sudo apt-fast install ttf-mscorefonts-installer

## Data Science
#---------------
# Curl Dependencies
sudo apt-fast install libcurl4-openssl-dev 

# GEOS Dependencies
sudo apt-fast install libgeos-dev

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

# Brackets
sudo add-apt-repository ppa:webupd8team/brackets
sudo apt-fast update
sudo apt-fast install brackets

# Atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-fast update
sudo apt-fast install atom

## System Settings
#-----------------
# Install menulibre
sudo apt-fast install menulibre

# Install gparted
sudo apt-fast install gparted

# Install Multimedia Codecs and Enable DVD Playback
sudo apt-add-repository ppa:mc3man/trusty-media
sudo apt-fast update
sudo apt-fast install ubuntu-restricted-extras ffmpeg gstreamer0.10-plugins-ugly libavcodec-extra-54 libvdpau-va-gl1 libmad0 mpg321 gstreamer1.0-libav

# Install Plugin Flash Player and Pepper Flash
sudo apt-fast install flashplugin-installer pepperflashplugin-nonfree

# Install JAVA
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-fast update
sudo apt-fast install oracle-java9-installer

# Install Support for Archive Formats and Restricted Extras
sudo apt-fast unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip

# Install Graphic Editor
sudo apt-fast install gimp inkscape

# Install Skype
sudo apt-fast install skype

#For Laptop: Install TLP for Improve Battery Life and Reduce Overheating
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-fast update
sudo apt-fast install tlp tlp-rdw
sudo tlp start

# Cleanup
#--------
sudo apt-fast autoremove
sudo apt-fast autoclean
sudo apt-fast clean
