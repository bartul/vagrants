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

####################################################
# VARNISH DID NOT WORK, SO USING TO NGINX
####################################################

# echo -e '\e[0;32mCopying Varnish config'
# sudo cp /vagrant/varnish-config/varnish /etc/default/
# sudo cp /vagrant/varnish-config/default.vcl /etc/varnish/

# echo -e '\e[0;32mRestarting Varnish'
# sudo service varnish restart

# echo -e '\e[0;32mStarting Varnish (HACK)'
# sudo /usr/sbin/varnishd -f /etc/varnish/default.vcl -a :1337 -T 127.0.0.1:6082 -S /etc/varnish/secret -s malloc,256MB
# echo -e '\e[0;32mRebooting system'  
# sudo reboot -n