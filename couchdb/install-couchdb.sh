#!/usr/bin/env bash

echo  -e '\e[0;32mRefresh system'
sudo apt-get update
sudo apt-get upgrade -y

echo  -e '\e[0;32mInstalling essentials'
apt-get install -y curl
apt-get install -y vim

echo  -e '\e[0;32mInstaling couchdb'
sudo apt-get install couchdb -y
sudo apt-get update
sudo apt-get -y install build-essential erlang-base-hipe erlang-dev erlang-manpages erlang-eunit erlang-nox libicu-dev libmozjs185-dev libcurl4-openssl-dev
wget http://mirrors.advancedhosters.com/apache/couchdb/source/1.6.1/apache-couchdb-1.6.1.tar.gz
tar -zxvf apache-couchdb-*.tar.gz
cd apache*
./configure
make && sudo make install
sudo adduser --disabled-login --disabled-password --no-create-home --gecos "" couchdb
sudo chown -R couchdb:couchdb /usr/local/var/lib/couchdb
sudo chown -R couchdb:couchdb /usr/local/var/log/couchdb
sudo chown -R couchdb:couchdb /usr/local/var/run/couchdb
sudo chown -R couchdb:couchdb /usr/local/etc/couchdb
sudo chmod 0770 /usr/local/var/lib/couchdb/
sudo chmod 0770 /usr/local/var/log/couchdb/
sudo chmod 0770 /usr/local/var/run/couchdb/
sudo chmod 0770 /usr/local/etc/couchdb/*.ini
sudo chmod 0770 /usr/local/etc/couchdb/*.d
sudo ln -s /usr/local/etc/logrotate.d/couchdb /etc/logrotate.d/couchdb
sudo ln -s /usr/local/etc/init.d/couchdb /etc/init.d
sudo update-rc.d couchdb defaults

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

# echo  -e '\e[0;32mStarting couchdb'
# sudo /usr/local/etc/init.d/couchdb start