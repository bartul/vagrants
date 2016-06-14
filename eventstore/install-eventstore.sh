#!/usr/bin/env bash

echo  -e '\e[0;32mInstalling essentials'
apt-get update 
apt-get install -y curl
apt-get install -y vim

echo -e '\e[0;32mInstalling Eventstore'
curl -s https://packagecloud.io/install/repositories/EventStore/EventStore-OSS/script.deb.sh | sudo bash
sudo apt-get install eventstore-oss -y

echo -e '\e[0;32mInstalling Varnish'
apt-get install apt-transport-https
curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.1" | sudo tee -a /etc/apt/sources.list.d/varnish-cache.list
apt-get update
apt-get install varnish -y

echo -e '\e[0;32mStarting Eventstore'
sudo service eventstore start

echo -e '\e[0;32mCopying Varnish config'
sudo cp /vagrant/varnish-config/varnish /etc/default/
sudo cp /vagrant/varnish-config/default.vcl /etc/varnish/

# echo -e '\e[0;32mRestarting Varnish'
# sudo service varnish restart

echo -e '\e[0;32mStarting Varnish (HACK)'
sudo /usr/sbin/varnishd -f /etc/varnish/default.vcl -a :1337 -T 127.0.0.1:6082 -S /etc/varnish/secret -s malloc,256MB
# echo -e '\e[0;32mRebooting system'  
# sudo reboot -n