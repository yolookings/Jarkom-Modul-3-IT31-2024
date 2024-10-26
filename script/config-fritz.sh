echo 'zone "marley.it31.com" {
        type master;
        file "/etc/bind/jarkom/marley.it31.com";
};

zone "eldia.it31.com" {
        type master;
        file "/etc/bind/jarkom/eldia.it31.com";
};' >/etc/bind/named.conf.local

mkdir /etc/bind/jarkom

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     marley.it31.com. root.marley.it31.com. (
                        2024051601      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      marley.it31.com.
@               IN      A       192.232.1.2 ; IP Annie Laravel Workerr' >/etc/bind/jarkom/marley.it31.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     eldia.it31.com.  eldia.it31.com.  (
                        2024051601      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
@               IN      NS      eldia.it31.com.
@               IN      A       192.232.2.4 ; IP Armin PHP Worker' >/etc/bind/jarkom/eldia.it31.com

echo 'options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };

        // dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 restart
