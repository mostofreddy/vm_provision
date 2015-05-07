#!/bin/bash

echo "#----------------------------------------------------------------------#"
echo '# PHPQATOOLS installing'
echo "#----------------------------------------------------------------------#"

echo ""
echo "PHPUnit"
echo "------------------------------------"

composer global require "phpunit/phpunit=4.5.*"
sudo ln -s /home/vagrant/.composer/vendor/bin/phpunit /usr/bin/phpunit

echo ""
echo "PHPCS"
echo "------------------------------------"

composer global require "squizlabs/php_codesniffer=*"
sudo ln -s /home/vagrant/.composer/vendor/bin/phpcs /usr/bin/phpcs

