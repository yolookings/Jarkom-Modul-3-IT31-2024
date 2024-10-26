echo 'subnet 192.232.3.1 netmask 255.255.255.0 {
    option routers 192.232.3.1;
    option broadcast-address 192.232.3.255;
}

subnet 192.232.4.1 netmask 255.255.255.0 {
    option routers 192.232.4.1;
    option broadcast-address 192.232.4.255;
}

subnet 192.232.1.1 netmask 255.255.255.0 {
    range 192.232.1.5 192.232.1.25;
    range 192.232.1.50 192.232.1.100;
    option routers 192.232.1.2;
    option broadcast-address 192.232.1.255;
    option domain-name-servers 192.232.4.3;
}

subnet 192.232.2.1 netmask 255.255.255.0 {
    range 192.232.2.09 192.232.2.27;
    range 192.232.2.81 192.232.1.243;
    option routers 192.232.2.4;
    option broadcast-address 192.232.2.255;
    option domain-name-servers 192.232.4.3;
}' >/etc/dhcp/dhcpd.conf
