#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# Apache'
echo "#----------------------------------------------------------------------#"

APACHE_VERSION="2.2.31"
APACHE_URL="http://apache.xfree.com.ar/httpd/httpd-"${APACHE_VERSION}".tar.gz"

# apache deps
sudo yum install -y openssl-devel zlib-devel

# Descarga apache
wget ${APACHE_URL}
tar -zxvf httpd-${APACHE_VERSION}.tar.gz

# crea directorio htdocs por defecto y copia archivo index.html
mkdir ${VAGRANT_HOME}/htdocs
sudo cp ${VAGRANT_ROOT}/vm_provision/modules/conf/index.html ${VAGRANT_HOME}/htdocs/index.html

cd httpd-${APACHE_VERSION}

# Compilación
./configure \
   --prefix=/usr/local/apache2 \
    --enable-mods-shared=all \
    --enable-so \
    --enable-ssl \
    --with-included-apr \
    --enable-proxy

make

sudo make install

sudo cp /usr/local/apache2/conf/httpd.conf /usr/local/apache2/conf/httpd.conf.origin
sudo cp ${VAGRANT_ROOT}/vm_provision/modules/conf/apache_httpd.conf /usr/local/apache2/conf/httpd.conf

if [ ! -f "/etc/init.d/httpd" ]; then
    sudo cp ${VAGRANT_ROOT}/vm_provision/modules/conf/apache_initd /etc/init.d/httpd
    sudo chmod 755 /etc/init.d/httpd
    sudo chkconfig httpd on
fi

cd ..
rm "httpd-"${APACHE_VERSION}".tar.gz"
rm "httpd-"${APACHE_VERSION} -Rf
