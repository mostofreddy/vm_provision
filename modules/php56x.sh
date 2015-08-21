#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# PHP installing'
echo "#----------------------------------------------------------------------#"

PHP_VERSION="5.6.7"
PHP_URL="http://ar2.php.net/get/php-"${PHP_VERSION}".tar.gz/from/this/mirror"

echo ""
echo "Dependencies"
echo "------------------------------------"
# dependencies
sudo yum install -y re2c
sudo yum install -y libxml2-devel
sudo yum install -y openssl-devel
sudo yum install -y libcurl-devel
sudo yum install -y libjpeg-devel
sudo yum install -y libpng-devel
sudo yum install -y freetype-devel
sudo yum install -y libicu-devel
sudo yum install -y readline-devel
sudo yum install -y libxslt-devel

wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
sudo rpm -i rpmforge-release-0.5.3-1.el6.rf.*.rpm
sudo yum install -y libmcrypt-devel && rm rpmforge-release-0.5.3-1.el6.rf.*.rpm

echo ""
echo "Download package"
echo "------------------------------------"
# PHP
wget ${PHP_URL}

mv mirror php-${PHP_VERSION}.tar.gz

tar xvzf php-${PHP_VERSION}.tar.gz

rm -Rf php-${PHP_VERSION}.tar.gz

echo ""
echo "Run configure"
echo "------------------------------------"

cd php-${PHP_VERSION}

./configure \
--prefix=/usr/local/php/php_${PHP_VERSION} \
--with-apxs2=/usr/local/apache2/bin/apxs \
--disable-all \
--enable-phar \
--enable-session \
--enable-filter \
--enable-soap \
--enable-sockets \
--enable-bcmath \
--enable-ftp \
--enable-tokenizer \
--with-readline \
--with-zlib \
--with-curl \
--with-pear \
--enable-static \
--enable-cli \
--enable-json \
--with-iconv \
--enable-ctype \
--enable-posix \
--enable-ipv6 \
--enable-calendar \
--enable-mbstring \
--with-mcrypt \
--with-mhash \
--enable-dom \
--enable-xml \
--enable-libxml \
--enable-simplexml \
--with-libxml-dir=/usr/bin \
--enable-xmlwriter \
--enable-xmlreader \
--with-xsl \
--with-gettext \
--enable-intl \
--enable-mysqlnd \
--with-mysql=mysqlnd \
--with-mysqli=mysqlnd \
--with-sqlite3 \
--enable-pdo \
--with-pdo-mysql=mysqlnd \
--with-pdo-sqlite \
--enable-mysqlnd-compression-support \
--with-openssl \
--with-openssl-dir=/usr/bin \
--with-openssl-dir \
--enable-inline-optimization \
--with-zend-vm=GOTO \
--enable-re2c-cgoto \
--with-gd \
--with-freetype-dir \
--with-jpeg-dir \
--with-png-dir

echo ""
echo "Run make"
echo "------------------------------------"
make

echo ""
echo "Run make install"
echo "------------------------------------"
sudo make install

echo ""
echo "PHP configure"
echo "------------------------------------"
sudo cp php.ini-development /usr/local/php/php_${PHP_VERSION}/lib/php.ini

sudo mkdir /usr/local/php/php_${PHP_VERSION}/modules

sudo mv /usr/local/apache2/modules/libphp5.so /usr/local/php/php_${PHP_VERSION}/modules/

sudo ln -s /usr/local/php/php_${PHP_VERSION} /usr/local/php/php

sudo ln -s /usr/local/php/php/modules/libphp5.so /usr/local/apache2/modules/

sudo ln -s /usr/local/php/php/bin/* /usr/bin/

sudo sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ America\/Argentina\/Buenos\_Aires/g' /usr/local/php/php/lib/php.ini

sudo sed -i 's/\;error\_log\ \=\ php\_errors\.log/error\_log\ \=\ \/tmp\/php\_errors\.log/g' /usr/local/php/php/lib/php.ini

cd ${VAGRANT_HOME}

rm php-${PHP_VERSION} -Rf
