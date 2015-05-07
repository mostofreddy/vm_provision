#!/bin/bash 

echo "#----------------------------------------------------------------------#"
echo '# Mysql'
echo "#----------------------------------------------------------------------#"

sudo yum install -y mysql mysql-server

sudo service mysqld start

TMPF=`mktemp`
cat >"$TMPF"<<-EOF

Y
123
123
Y
Y
Y
Y


EOF
mysql_secure_installation < $TMPF
