#!/usr/bin/env bash

echo  -e '\e[0;32mInstalling essentials'
apt-get update 
apt-get install -y curl
apt-get install -y vim

echo -e '\e[0;32mInstalling Eventstore'
curl -s https://packagecloud.io/install/repositories/EventStore/EventStore-OSS/script.deb.sh | sudo bash
sudo apt-get install eventstore-oss -y

echo -e '\e[0;32mStarting Eventstore'
sudo service eventstore start
# echo -e '\e[0;32mCopying custom RabbitMQ configuration' 
# sudo cp /vagrant/rabbitmq.config /etc/rabbitmq/rabbitmq.config

# echo -e '\e[0;32mEnabling RabbitMQ management plugin'  
# sudo rabbitmq-plugins enable rabbitmq_management
 
# echo -e '\e[0;32mRebooting system'  
# sudo reboot -n