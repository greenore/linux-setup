#!/bin/bash
# Script for an offline installation of R on a redhat environment.

# System 
#-------
## Add repository
sudo su
su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm'
exit

## Upgrade system
sudo yum update -y
#sudo yum upgrade -y

## Mkdir
mkdir downloads
cd downloads

## Install system stuff
sudo yum install --downloadonly --downloaddir ./ htop -y
sudo yum install --downloadonly --downloaddir ./ nano -y
sudo yum install --downloadonly --downloaddir ./ screen -y
sudo yum install --downloadonly --downloaddir ./ wget -y
sudo yum install --downloadonly --downloaddir ./ git -y

## Install R dependencies
# Curl
sudo yum install --downloadonly --downloaddir ./ libcurl-devel -y

# XML
sudo yum install --downloadonly --downloaddir ./ libxml2-devel -y

# SSL
sudo yum install --downloadonly --downloaddir ./ openssl-devel -y

# Texlive
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm
sudo yum localinstall --downloadonly --downloaddir ./ texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm -y
sudo yum localinstall --downloadonly --downloaddir ./ texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm -y
sudo yum install --downloadonly --downloaddir ./ texlive -y
sudo wget ftp://195.220.108.108/linux/centos/7.3.1611/os/x86_64/Packages/texlive-framed-svn26789.0.96-38.el7.noarch.rpm
sudo wget ftp://195.220.108.108/linux/centos/7.3.1611/os/x86_64/Packages/texlive-titling-svn15878.2.1d-38.el7.noarch.rpm

# Texinfo
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texinfo-tex-5.1-4.el7.x86_64.rpm
sudo yum localinstall --downloadonly --downloaddir ./ texinfo-tex-5.1-4.el7.x86_64.rpm -y
sudo yum localinstall --downloadonly --downloaddir ./ texinfo* -y

# Fonts
sudo yum install --downloadonly --downloaddir ./ curl cabextract xorg-x11-font-utils fontconfig -y
sudo wget https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

## Install R
sudo yum install --downloadonly --downloaddir ./ R -y

# Rstudio dependencies
sudo yum install --downloadonly --downloaddir ./ psmisc -y

# RStudio Server
wget https://download2.rstudio.org/rstudio-server-rhel-1.0.143-x86_64.rpm