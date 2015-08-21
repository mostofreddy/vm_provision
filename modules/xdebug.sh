#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# PHP xdebug module'
echo "#----------------------------------------------------------------------#"

sudo pecl install xdebug

# agrega la extension a php
sudo sed -i '/^; Dynamic Extensions ;$/,/^; Module Settings ;$/{H;//{x;/zend_extension="\/usr\/local\/php\/php\/lib\/php\/extensions\/no-debug-non-zts-20121212\/xdebug.so"/{p;d};/;;;\n/{s//&zend_extension="\/usr\/local\/php\/php\/lib\/php\/extensions\/no-debug-non-zts-20121212\/xdebug.so"\n/p}};d}' /usr/local/php/php/lib/php.ini
