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

# Install R-Base
sudo add-apt-repository ppa:marutter/rrutter
sudo apt-get update sudo apt-get install r-base

# Install menulibre
sudo apt-get install menulibre

# Install latex
sudo apt-get install texlive texlive-latex-extra

# Install gparted
sudo apt-get install gparted

# Install Multimedia Codecs and Enable DVD Playback
sudo apt-add-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install ubuntu-restricted-extras ffmpeg gstreamer0.10-plugins-ugly libavcodec-extra-54 libvdpau-va-gl1 libmad0 mpg321 gstreamer1.0-libav

# Enable DVD Playback
sudo /usr/share/doc/libdvdread4/install-css.s­h

# Install VLC Media Player
sudo apt-get install vlc

# Install Plugin Flash Player and Pepper Flash
sudo apt-get install flashplugin-installer pepperflashplugin-nonfree

# Install JAVA
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java9-installer

# Install Support for Archive Formats and Restricted Extras
sudo apt-get unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip

# Install Graphic Editor
sudo apt-get install gimp inkscape

# Install Elementary Tweak
sudo apt-add-repository ppa:mpstark/elementary-tweaks-daily
sudo apt-get install elementary-tweak

# Install Skype
sudo apt-get install skype

#For Laptop: Install TLP for Improve Battery Life and Reduce Overheating
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
sudo tlp start

# Cleanup
#--------
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get clean

