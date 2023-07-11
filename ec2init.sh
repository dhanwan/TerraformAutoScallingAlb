#!/bin/bash

sudo apt update && sudo apt-get upgrade -y
sudo apt-get install nginx -y
echo "This is Deployed by this ASG Template" >> /var/www/html/index.html