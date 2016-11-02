#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

echo  -e '\e[0;32mRefresh system'
sudo apt-get update
sudo apt-get upgrade -y --force-yes -o Dpkg::Options::="--force-confnew"

echo  -e '\e[0;32mInstalling essentials'
sudo apt-get install curl vim -y --force-yes -o Dpkg::Options::="--force-confnew"

echo  -e '\e[0;32mInstaling scylla'
sudo wget -O /etc/apt/sources.list.d/scylla.list http://downloads.scylladb.com/deb/ubuntu/scylla-1.3-trusty.list

# Go back to full scylla package once karnel is on version >=3.15
sudo apt-get update
sudo apt-get install scylla-server scylla-tools scylla-jmx -y --force-yes -o Dpkg::Options::="--force-confnew"

echo  -e '\e[0;32mEnabling scylla developer mode'
sudo /usr/lib/scylla/scylla_dev_mode_setup --developer-mode 1

echo -e '\e[0;32mStarting scylla service'
sudo service scylla-server start
