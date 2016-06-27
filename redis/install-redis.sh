#!/usr/bin/env bash

echo  -e '\e[0;32mRefresh system'
sudo apt-get update
sudo apt-get upgrade -y

echo  -e '\e[0;32mInstalling essentials'
apt-get install -y curl
apt-get install -y vim

echo  -e '\e[0;32mInstaling redis package'
echo "deb http://packages.dotdeb.org squeeze all" | sudo tee /etc/apt/sources.list.d/dotdeb.org.list
wget --quiet -O - http://www.dotdeb.org/dotdeb.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install redis-server -y

echo  -e '\e[0;32mCopying redis config'
sudo cp /vagrant/redis.conf /etc/redis/

echo  -e '\e[0;32mRestarting redis service'
sudo service redis-server restart

