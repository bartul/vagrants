#!/usr/bin/env bash

echo  -e '\e[0;32mRefresh system'
sudo apt-get update
sudo apt-get upgrade -y

echo  -e '\e[0;32mInstalling essentials'
apt-get install -y curl vim

echo  -e '\e[0;32mInstaling scylla'
sudo wget -O /etc/apt/sources.list.d/scylla.list http://downloads.scylladb.com/deb/ubuntu/scylla-1.2-trusty.list

sudo apt-get update
sudo apt-get install scylla -y --force-yes

echo  -e '\e[0;32mEnabling scylla developer mode'
sudo /usr/lib/scylla/scylla_dev_mode_setup --developer-mode 1

echo -e '\e[0;32mStarting scylla service'
sudo service scylla-server start