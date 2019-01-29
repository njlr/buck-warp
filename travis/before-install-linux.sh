#!/bin/bash

sudo apt-get install -y equivs openjdk-8-jdk

wget -O buck.deb https://github.com/facebook/buck/releases/download/v2018.10.29.01/buck.2018.10.29.01_all.deb
sudo dpkg -i buck.deb
buck --version
