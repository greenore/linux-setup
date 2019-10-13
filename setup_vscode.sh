#!/bin/bash
wget https://github.com/cdr/code-server/releases/download/1.1156-vsc1.33.1/code-server1.1156-vsc1.33.1-linux-x64.tar.gz
tar -xvzf code-server1.1156-vsc1.33.1-linux-x64.tar.gz
cd code-server1.1156-vsc1.33.1-linux-x64
sudo chmod +x code-server
./code-server
