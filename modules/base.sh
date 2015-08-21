#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# Base'
echo "#----------------------------------------------------------------------#"

# Variables
VAGRANT_HOME="/home/vagrant"
VAGRANT_ROOT="/vagrant"

# Actualiza el sistema
sudo yum -y update
sudo yum -y upgrade

# Basicos de desarrollo
sudo yum groupinstall -y "Development Tools"

# Utils
sudo yum install -y tar
