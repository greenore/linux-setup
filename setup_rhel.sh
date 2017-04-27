#!/bin/bash

# System 
#-------

## Add repository
#su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm'

# Upgrade system
sudo yum update -y
sudo yum upgrade -y

# User add
sudo useradd tim
sudo passwd tim

# Install system stuff
sudo yum install wget -y
#sudo yum install htop -y

sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/nano-2.3.1-10.el7.x86_64.rpm
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/screen-4.1.0-0.23.20120314git3c2946.el7_2.x86_64.rpm	
#sudo wget ftp://195.220.108.108/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/h/htop-2.0.2-2.fc26.x86_64.rpm
#sudo wget ftp://195.220.108.108/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/n/ncurses-libs-6.0-8.20170212.fc26.i686.rpm

sudo yum localinstall screen-4.1.0-0.23.20120314git3c2946.el7_2.x86_64.rpm	
sudo yum localinstall nano-2.3.1-10.el7.x86_64.rpm
#sudo yum localinstall htop-2.0.2-2.fc26.x86_64.rpm
#sudo yum localinstall ncurses-libs-6.0-8.20170212.fc26.i686.rpm

# Microsoft R Open
sudo wget https://mran.microsoft.com/install/mro/3.3.3/microsoft-r-open-3.3.3.tar.gz
tar -xf microsoft-r-open-3.3.3.tar.gz
cd microsoft-r-open/
sudo ./install.sh

## Install R dependencies
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texinfo-tex-5.1-4.el7.x86_64.rpm
sudo yum localinstall texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm



sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-base-2012-38.20130427_r30134.el7.noarch.rpm
sudo yum localinstall texlive-base-2012-38.20130427_r30134.el7.noarch.rpm

sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-kpathsea-bin-svn27347.0-38.20130427_r30134.el7.x86_64.rpm
sudo yum localinstall texlive-kpathsea-bin-svn27347.0-38.20130427_r30134.el7.x86_64.rpm
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-kpathsea-lib-2012-38.20130427_r30134.el7.x86_64.rpm

sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm

sudo yum localinstall texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm
sudo yum localinstall texinfo-tex-5.1-4.el7.x86_64.rpm

## Install R
#sudo yum install R -y

# Maybe run the following R command
sudo R CMD javareconf

# Rstudio dependencies
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/psmisc-22.20-11.el7.x86_64.rpm
sudo yum localinstall psmisc-22.20-11.el7.x86_64.rpm	

# RStudio Server
wget https://download2.rstudio.org/rstudio-server-rhel-1.0.143-x86_64.rpm
sudo yum install --nogpgcheck rstudio-server-rhel-1.0.143-x86_64.rpm

# Cleanup
sudo yum autoremove -y
