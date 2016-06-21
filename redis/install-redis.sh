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

echo  -e '\e[0;32mInstalling nginx'
sudo -s
nginx=stable # use nginx=development for latest development version
ubuntu=trusty # Replace this with your ubuntu version!
echo "deb http://ppa.launchpad.net/nginx/$nginx/ubuntu $ubuntu main" > /etc/apt/sources.list.d/nginx-$nginx-$ubuntu.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
apt-get update
apt-get install -y nginx


echo  -e '\e[0;32mCopying nginx config'
sudo cp /vagrant/nginx-config/default /etc/nginx/sites-enabled/default

echo  -e '\e[0;32mReload nginx config'
sudo nginx -s reload

