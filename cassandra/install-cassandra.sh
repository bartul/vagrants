#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

echo  -e '\e[0;32mSetting system timezone'
sudo echo "#UTC" > /etc/timezone  

echo  -e '\e[0;32mAdd repos and refresh system'
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get upgrade -y --force-yes -o Dpkg::Options::="--force-confnew"

echo  -e '\e[0;32mInstalling essentials'
apt-get install curl vim zip unzip -y --force-yes -o Dpkg::Options::="--force-confnew"   

echo  -e '\e[0;32mInstaling java'
sudo apt-get install openjdk-8-jdk -y --force-yes -o Dpkg::Options::="--force-confnew"

echo  -e '\e[0;32mInstaling cassandra'
echo "deb http://www.apache.org/dist/cassandra/debian 36x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo apt-get update
sudo apt-get install cassandra -y --force-yes -o Dpkg::Options::="--force-confnew"

echo  -e '\e[0;32mInstaling cassandra done'

