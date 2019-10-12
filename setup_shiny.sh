#!/bin/bash

# Install necessary packages globally
sudo su - \
-c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""

sudo su - \
-c "R -e \"install.packages('rmarkdown', repos='https://cran.rstudio.com/')\""

# Install shiny server
sudo apt install gdebi-core -y
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.12.933-amd64.deb
sudo gdebi shiny-server-1.5.12.933-amd64.deb
