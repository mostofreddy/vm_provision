#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# Base'
echo "#----------------------------------------------------------------------#"


sudo yum -y update
sudo yum -y upgrade

sudo yum groupinstall -y "Development Tools"

sudo yum install -y tar

