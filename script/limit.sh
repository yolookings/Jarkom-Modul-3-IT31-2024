echo INTERFACESv4="eth0" >/etc/default/isc-dhcp-server

echo 'authoritative;

subnet 192.232.3.0 netmask 255.255.255.0 {
    option routers 192.232.3.1;
    option broadcast-address 192.232.3.255;
}

subnet 192.232.4.0 netmask 255.255.255.0 {
    option routers 192.232.4.1;
    option broadcast-address 192.232.4.255;
}

subnet 192.232.1.0 netmask 255.255.255.0 {
    range 192.232.1.5 192.232.1.25;
    range 192.232.1.50 192.232.1.100;
    option routers 192.232.1.2;
    option broadcast-address 192.232.1.255;
    option domain-name-servers 192.232.4.3;
    default-lease-time 1800; // limit marley
    max-lease-time 5220;
}

subnet 192.232.2.0 netmask 255.255.255.0 {
    range 192.232.2.09 192.232.2.27;
    range 192.232.2.81 192.232.2.243;
    option routers 192.232.2.4;
    option broadcast-address 192.232.2.255;
    option domain-name-servers 192.232.4.3;
    default-lease-time 360; // limit eldia
    max-lease-time 5220;
}' >/etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
