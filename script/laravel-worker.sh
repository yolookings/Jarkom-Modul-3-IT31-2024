echo nameserver 192.168.122.1 >/etc/resolv.conf

apt-get update
apt-get install mariadb-client -y
service mysql start
