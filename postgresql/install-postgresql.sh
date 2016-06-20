#!/usr/bin/env bash

echo  -e '\e[0;32mRefresh system'
sudo apt-get update
sudo apt-get upgrade -y

echo  -e '\e[0;32mInstalling essentials'
apt-get install -y curl
apt-get install -y vim

echo  -e '\e[0;32mInstaling postgresql'
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-9.5 -y

# echo  -e '\e[0;32mStarting postgresql'
# sudo /usr/local/etc/init.d/postgresql start