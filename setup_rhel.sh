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
sudo yum upgrade -y

## Mkdir
mkdir downloads
cd downloads

## Install system stuff
sudo yum install --downloadonly --downloaddir ./ htop -y
sudo yum install --downloadonly --downloaddir ./ nano -y
sudo yum install --downloadonly --downloaddir ./ screen -y
sudo yum install --downloadonly --downloaddir ./ wget -y
sudo yum install --downloadonly --downloaddir ./ git -y
sudo yum install --downloadonly --downloaddir ./ zip -y
sudo yum install --downloadonly --downloaddir ./ unzip -y
sudo yum localinstall * -y

## Install R dependencies
# Stringi
sudo yum install --downloadonly --downloaddir ./ libicu-devel -y
sudo yum localinstall * -y

# Curl
sudo yum install --downloadonly --downloaddir ./ libcurl-devel -y
sudo yum localinstall * -y

# XML
sudo yum install --downloadonly --downloaddir ./ libxml2-devel -y
sudo yum localinstall * -y

# SSL
sudo yum install --downloadonly --downloaddir ./ openssl-devel -y
sudo yum localinstall * -y

# Geos
wget ftp://rpmfind.net/linux/epel/7/x86_64/g/geos-devel-3.4.2-2.el7.x86_64.rpm
wget ftp://rpmfind.net/linux/epel/7/x86_64/g/geos-3.4.2-2.el7.x86_64.rpm
sudo yum localinstall * -y

# Texlive
#sudo yum install --downloadonly --downloaddir ./ perl-Digest-MD5 -y
#sudo yum localinstall * -y
#wget http://www.pirbot.com/mirrors/ctan/systems/texlive/Images/texlive.iso
#sudo mount -t iso9660 -o ro,loop,noauto texlive.iso /mnt 
#sudo /mnt/install-tl

sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm
sudo yum localinstall --downloadonly --downloaddir ./ texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm -y
sudo yum localinstall --downloadonly --downloaddir ./ texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm -y
sudo yum install --downloadonly --downloaddir ./ texlive -y
sudo yum localinstall * -y

sudo wget ftp://195.220.108.108/linux/centos/7.3.1611/os/x86_64/Packages/texlive-framed-svn26789.0.96-38.el7.noarch.rpm
sudo wget ftp://195.220.108.108/linux/centos/7.3.1611/os/x86_64/Packages/texlive-titling-svn15878.2.1d-38.el7.noarch.rpm
sudo yum localinstall * -y

# Texinfo
sudo wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texinfo-tex-5.1-4.el7.x86_64.rpm
sudo yum localinstall --downloadonly --downloaddir ./ texinfo-tex-5.1-4.el7.x86_64.rpm -y
sudo yum localinstall --downloadonly --downloaddir ./ texinfo* -y
sudo yum localinstall * -y

# Fonts
sudo yum install --downloadonly --downloaddir ./ curl cabextract xorg-x11-font-utils fontconfig -y
sudo wget https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo yum localinstall * -y

## Install R
sudo yum install --downloadonly --downloaddir ./ R -y
sudo yum localinstall * -y

## Microsoft R Open
#sudo wget https://mran.microsoft.com/install/mro/3.3.3/microsoft-r-open-3.3.3.tar.gz
#tar -xf microsoft-r-open-3.3.3.tar.gz
#cd microsoft-r-open/
#sudo ./install.sh

# Maybe run the following R command
sudo R CMD javareconf

# Rstudio dependencies
sudo yum install --downloadonly --downloaddir ./ psmisc -y
sudo yum localinstall * -y

# RStudio Server
wget https://download2.rstudio.org/rstudio-server-rhel-1.0.143-x86_64.rpm
sudo yum install --nogpgcheck rstudio-server-rhel-1.0.143-x86_64.rpm -y

## Enable Swapping
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo chmod 600 /var/swap.1
sudo /sbin/swapon /var/swap.1

# Cleanup
sudo yum clean all
sudo yum autoremove -y

## User add
sudo useradd tim
sudo passwd tim
