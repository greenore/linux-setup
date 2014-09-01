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

# System 
#-------
# Upgrade system
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

# Install Elementary Tweaks
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
sudo apt-get update && sudo apt-get install elementary-tweaks

# sudo apt-get install elementary-wallpaper-collection
sudo apt-get install elementary-.*-theme elementary-.*-icons

# Internet
#---------
# Install Browser
sudo apt-get firefox

# Install flash plugin
sudo apt-get install adobe-flashplugin

# Install java for browser
sudo apt-get install icedtea-plugin

# Enable H.264 support for Firefox:
sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install gstreamer0.10-ffmpeg

# Media
#------
# Install VLC Media Player
sudo apt-get install vlc

# Audacity
sudo apt-get install audacity

# Install additional codecs to run all sorts of media
sudo apt-get install flashplugin-installer gsfonts-x11 libxine1-ffmpeg gxine mencoder mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6
sudo apt-get install ffmpeg gstreamer0.10-ffmpeg gstreamer0.10-sdl gstreamer-dbus-media-service 
sudo apt-get install totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 libjpeg-progs flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview flac libmpeg3-1 mpeg3-utils mpegdemux liba52-0.7.4-dev libquicktime2
sudo apt-get install gstreamer0.10-fluendo-mp3 gstreamer0.10-gnonlin gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly totem-plugins-extra gstreamer-tools ubuntu-restricted-extras

# Install support for archive formats
sudo apt-get install unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip
sudo apt-get install lha

# Apple iTunes compatibility codec
sudo apt-get install libavcodec-extra-53

# To enable DVD support
sudo apt-get install libdvdread4
sudo /usr/share/doc/libdvdread4/install-css.sh

# Install Videoeditor (Openshot)
sudo add-apt-repository ppa:openshot.developers/ppa
sudo apt-get install openshot openshot-doc

# Office
#-------
# Install WPS-Office
mkdir ~/Downloads/wps-office
cd ~/Downloads/wps-office
wget -c http://37.247.55.101/a15/wps-office_9.1.0.4751~a15_i386.deb         # WPS-Office
wget -c http://37.247.55.101/a15/wps-office-fonts_1.0_all.deb               # Fonts
wget -c http://37.247.55.101/a15/wps-office-mui-de_9.1.0.4751~a15_all.deb   # German Language
wget -c http://37.247.55.101/a15/wps-office-mui-fr_9.1.0.4751~a15_all.deb   # French Language
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
sudo apt-get install ttf-mscorefonts-installer

## Install GIMP
#sudo add-apt-repository ppa:otto-kesselgulasch/gimp
#sudo apt-get update && sudo apt-get install gimp

# Install R-Base
sudo add-apt-repository ppa:marutter/rrutter
sudo apt-get update sudo apt-get install r-base

# Install menulibre
sudo apt-get install menulibre

# Install latex
sudo apt-get install texlive texlive-latex-extra

# Install gparted
sudo apt-get install gparted

# Screenshot Tool
sudo apt-get install shutter

# Cleanup
#--------
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get clean

