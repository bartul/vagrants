#!/usr/bin/env bash

echo  -e '\e[0;32mInstaling mongodb'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org

sudo sed --in-place '/bindIp: 127.0.0.1/d' /etc/mongod.conf

sudo service mongod restart

export LC_ALL=C

