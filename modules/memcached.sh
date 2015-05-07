#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# Memcached'
echo "#----------------------------------------------------------------------#"

MEMCACHED_VERSION="1.4.22"
MEMCACHED_CONF_OPTS="--enable-64bit --disable-dtrace --disable-coverage --disable-docs"
MEMCACHED_URL="http://memcached.org/files/memcached-"${MEMCACHED_VERSION}".tar.gz"


wget $MEMCACHED_URL
tar -zxvf memcached-${MEMCACHED_VERSION}.tar.gz

cd memcached-${MEMCACHED_VERSION}
./configure $MEMCACHED_CONF_OPTS
make
sudo make install

# move mmc scripts
if [ ! -d "/usr/share/memcached" ]; then
    sudo mkdir /usr/share/memcached
    sudo cp scripts /usr/share/memcached/scripts -Rf
fi

# mmc conf
if [ ! -f "/etc/memcached.conf" ]; then
    sudo cp /vagrant/bootstrap/modules/conf/memcached.conf /etc/memcached.conf
fi

# mmc init.d
if [ ! -f "/etc/init.d/memcached" ]; then
    sudo cp /vagrant/bootstrap/modules/conf/initd_memcached /etc/init.d/memcached
    sudo chmod 755 /etc/init.d/memcached
    sudo chkconfig memcached on
fi

cd ..
rm memcached-${MEMCACHED_VERSION}.tar.gz
rm memcached-${MEMCACHED_VERSION} -Rf
