echo 'subnet 192.232.3.0 netmask 255.255.255.0 {
    option routers 192.232.3.1;
}

subnet 192.232.4.0 netmask 255.255.255.0 {
    option routers 192.232.4.1;
}

subnet 192.232.1.0 netmask 255.255.255.0 {
    range 192.232.1.5 192.232.1.25;
    range 192.232.1.50 192.232.1.100;
    option routers 192.232.1.2;
}

subnet 192.232.2.0 netmask 255.255.255.0 {
    range 192.232.2.09 192.232.2.27;
    range 192.232.2.81 192.232.2.243;
    option routers 192.232.2.4;
}' >/etc/dhcp/dhcpd.conf
