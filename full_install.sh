#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# VM provisioning - Full install'
echo "#----------------------------------------------------------------------#"


# Base
. /vagrant/bootstrap/modules/base.sh

# Iptables
. /vagrant/bootstrap/modules/iptables_disabled.sh
