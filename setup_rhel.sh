#!/bin/bash
# Script for an offline installation of R on a redhat environment.

# System 
#-------
sudo su
#passwd root

## Add repository
su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm'
exit

## Upgrade system
#sudo yum update -y
#sudo yum upgrade -y

## User add
sudo useradd tim
sudo passwd tim

## Mkdir
mkdir downloads
cd downloads

## Install system stuff
sudo yum install --downloadonly --downloaddir ./ htop -y
sudo yum install --downloadonly --downloaddir ./ nano -y
sudo yum install --downloadonly --downloaddir ./ screen -y
sudo yum install --downloadonly --downloaddir ./ wget -y
sudo yum install --downloadonly --downloaddir ./ git -y
sudo yum localinstall *

## Install R dependencies
# Texlive
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm
sudo yum localinstall --downloadonly --downloaddir ./ texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm
sudo yum localinstall --downloadonly --downloaddir ./ texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm
sudo yum localinstall *

# Texinfo
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texinfo-tex-5.1-4.el7.x86_64.rpm
sudo yum localinstall --downloadonly --downloaddir ./ texinfo-tex-5.1-4.el7.x86_64.rpm
sudo yum localinstall --downloadonly --downloaddir ./ texinfo*
sudo yum localinstall *

# Fonts
sudo yum install --downloadonly --downloaddir ./ curl cabextract xorg-x11-font-utils fontconfig
sudo wget https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo yum localinstall *

## Install R
sudo yum install --downloadonly --downloaddir ./ R
sudo yum localinstall *

## Microsoft R Open
#sudo wget https://mran.microsoft.com/install/mro/3.3.3/microsoft-r-open-3.3.3.tar.gz
#tar -xf microsoft-r-open-3.3.3.tar.gz
#cd microsoft-r-open/
#sudo ./install.sh

# Maybe run the following R command
sudo R CMD javareconf

# Rstudio dependencies
sudo yum install --downloadonly --downloaddir ./ psmisc
sudo yum localinstall *

# RStudio Server
wget https://download2.rstudio.org/rstudio-server-rhel-1.0.143-x86_64.rpm
sudo yum install --nogpgcheck rstudio-server-rhel-1.0.143-x86_64.rpm

# Cleanup
# sudo yum autoremove -y
