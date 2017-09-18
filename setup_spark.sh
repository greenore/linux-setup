#!/bin/bash

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

# Cleanup
#--------
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt clean -y









# Spark
mkdir -p downloads
cd downloads
sudo wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
tar -xvzf spark-2.1.0-bin-hadoop2.7.tgz
cd spark-2.1.0-bin-hadoop2.7

# Create and launch AMI

# Start the Master node


# Start Slave node
sudo bash spark-2.1.0-bin-hadoop2.7/sbin/start-slave.sh spark://spark-2.1.0-bin-hadoop2.7:7077


