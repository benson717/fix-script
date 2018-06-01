#!/bin/bash

cd ~/
sudo desire-cli stop
sudo rm -fr desire/
sudo git clone https://github.com/lazyboozer/desire
cd desire
sudo ./autogen.sh
sudo ./configure --without-gui --disable-tests
sudo make
sudo make install
sudo desired
