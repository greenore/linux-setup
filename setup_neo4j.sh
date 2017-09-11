#!/bin/bash

# System 
#-------
# Add repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

# Upgrade system
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

# Install ssh-server
sudo apt install openssh-server libssl-dev libxml2-dev -y

# Installs Microsoft Core Fonts (Arial,Times New Roman and  many more)
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install ttf-mscorefonts-installer -y

# Curl Dependencies
sudo apt install libcurl4-openssl-dev  -y

## Install system management
sudo apt install htop -y

# Install OpenJDK
sudo apt install default-jdk -y

## Git
sudo apt install git -y

# Neo4J
#---------------
#sudo apt-get install gdebi-core -y
#cd ..
#wget https://download2.rstudio.org/rstudio-server-1.0.136-amd64.deb
#sudo gdebi rstudio-server-1.0.136-amd64.deb

# Cleanup
#--------
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt clean -y
