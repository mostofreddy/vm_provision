#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# Composer'
echo "#----------------------------------------------------------------------#"

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/bin/composer
