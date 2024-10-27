mysql -e "CREATE USER 'kelompokit31'@'%' IDENTIFIED BY 'passwordit31';"
mysql -e "CREATE USER 'kelompokit31'@'marley.it31.com' IDENTIFIED BY 'passwordit31';"
mysql -e "CREATE DATABASE dbkelompokit31;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'kelompokit31'@'%';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'kelompokit31'@'marley.it31.com';"
mysql -e "FLUSH PRIVILEGES;"

mysql="[mysqld]
skip-networking=0
skip-bind-address
"
echo "$mysql" >/etc/mysql/my.cnf

service mysql restart
