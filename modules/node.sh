#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# Installing Node'
echo "#----------------------------------------------------------------------#"

curl -sL https://rpm.nodesource.com/setup > node-install.sh
sudo bash node-install.sh
rm node-install.sh

sudo yum install -y nodejs
