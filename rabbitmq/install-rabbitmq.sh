#!/usr/bin/env bash

echo -e '\e[0;32mInstalling RabbitMQ'
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.deb.sh | sudo bash
sudo apt-get install rabbitmq-server -y

echo -e '\e[0;32mCopying custom RabbitMQ configuration' 
sudo cp /vagrant/rabbitmq.config /etc/rabbitmq/rabbitmq.config

echo -e '\e[0;32mEnabling RabbitMQ management plugin'  
sudo rabbitmq-plugins enable rabbitmq_management
 
echo -e '\e[0;32mRebooting system'  
sudo reboot -n