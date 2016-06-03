#!/usr/bin/env bash

# apt-get update
# apt-get upgrade

echo  -e '\e[0;32mInstalling nginx'
sudo -s
nginx=stable # use nginx=development for latest development version
ubuntu=trusty # Replace this with your ubuntu version!
echo "deb http://ppa.launchpad.net/nginx/$nginx/ubuntu $ubuntu main" > /etc/apt/sources.list.d/nginx-$nginx-$ubuntu.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
apt-get update 
apt-get install -y nginx

echo  -e '\e[0;32mInstalling essentials'
apt-get install -y curl
apt-get install -y vim

echo  -e '\e[0;32mCopying nginx config for static web site'
sudo cp /vagrant/nginx-config/default /etc/nginx/sites-enabled/default

echo  -e '\e[0;32mReload nginx config'
sudo nginx -s reload 
