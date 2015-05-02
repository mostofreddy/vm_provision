#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# Apache'
echo "#----------------------------------------------------------------------#"

APACHE_VERSION="2.2.29"
APACHE_URL="http://apache.xfree.com.ar/httpd/httpd-"${APACHE_VERSION}".tar.gz"

wget ${APACHE_URL}
tar -zxvf httpd-${APACHE_VERSION}.tar.gz

cd httpd-${APACHE_VERSION}

./configure \
   --prefix=/usr/local/apache2 \
    --enable-mods-shared=all \
    --enable-so \
    --enable-ssl \
    --with-included-apr \
    --enable-proxy

make

sudo make install

sudo cp /vagrant/bootstrap/modules/conf/httpd.conf /usr/local/apache2/conf/httpd.conf

if [ ! -f "/etc/init.d/httpd" ]; then
    sudo cp /vagrant/bootstrap/modules/conf/initd_apache /etc/init.d/httpd
    sudo chmod 755 /etc/init.d/httpd
    sudo chkconfig httpd on
fi

cd ..
rm "httpd-"${APACHE_VERSION}".tar.gz"
rm "httpd-"${APACHE_VERSION} -Rf
