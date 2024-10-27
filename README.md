# Jarkom-Modul-2-IT31-2024

## Anggota Kelompok IT31 :

| Nama Lengkap         | NRP        |
| -------------------- | ---------- |
| Maulana Ahmad Zahiri | 5027231010 |
| Dzaky Faiq Fayyadhi  | 5027231047 |

## Daftar isi

- [Topology](#topology)
- [Configuration](#configuration)
- [Installation](#installation)
- [Soal 1](#soal-1)
- [Soal 2](#soal-2)
- [Soal 3](#soal-3)
- [Soal 4](#soal-4)
- [Soal 5](#soal-5)
- [Soal 6](#soal-6)
- [Soal 7](#soal-7)
- [Soal 8](#soal-8)

## Topology

![alt text](/img/topology.png)

### Prefix IP IT31 : 192.232

## Configuration

- Paradis (DHCP Relay)

```bash
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
  address 192.232.1.1
  netmask 255.255.255.0

auto eth2
iface eth2 inet static
  address 192.232.2.1
  netmask 255.255.255.0

auto eth3
iface eth3 inet static
  address 192.232.3.1
  netmask 255.255.255.0

auto eth4
iface eth4 inet static
  address 192.232.4.1
  netmask 255.255.255.0

up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.232.0.0/16
```

- Tybur (DHCP Server)

```bash
auto eth0
iface eth0 inet static
  address 192.232.4.2
  netmask 255.255.255.0
  gateway 192.232.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Fritz (DNS Server)

```bash
auto eth0
iface eth0 inet static
  address 192.232.4.3
  netmask 255.255.255.0
  gateway 192.232.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Warhammer (Database)

```bash
auto eth0
iface eth0 inet static
  address 192.232.3.4
  netmask 255.255.255.0
  gateway 192.232.3.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Beast (Load Balancer Laravel)

```bash
auto eth0
iface eth0 inet static
  address 192.232.3.2
  netmask 255.255.255.0
  gateway 192.232.3.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Colossal (Load Balancer PHP)

```bash
auto eth0
iface eth0 inet static
  address 192.232.3.3
  netmask 255.255.255.0
  gateway 192.232.3.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Annie (Laravel Worker)

```bash
auto eth0
iface eth0 inet static
  address 192.232.1.2
  netmask 255.255.255.0
  gateway 192.232.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Berthold (Laravel Worker)

```bash
auto eth0
iface eth0 inet static
  address 192.232.1.3
  netmask 255.255.255.0
  gateway 192.232.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Reiner (Laravel Worker)

```bash
auto eth0
iface eth0 inet static
  address 192.232.1.4
  netmask 255.255.255.0
  gateway 192.232.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Mikasa (PHP Worker)

```bash
auto eth0
iface eth0 inet static
  address 192.232.2.2
  netmask 255.255.255.0
  gateway 192.232.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Eren (PHP Worker)

```bash
auto eth0
iface eth0 inet static
  address 192.232.2.3
  netmask 255.255.255.0
  gateway 192.232.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Armin (PHP Worker)

```bash
auto eth0
iface eth0 inet static
  address 192.232.2.4
  netmask 255.255.255.0
  gateway 192.232.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

- Zeke (Client)

```bash
auto eth0
iface eth0 inet static
  address 192.232.1.5
  netmask 255.255.255.0
  gateway 192.232.1.1

up echo nameserver 192.232.4.3 > /etc/resolv.conf // IP DNS Server
up echo nameserver 192.168.122.1 >> /etc/resolv.conf

```

- Erwin (Client)

```bash
auto eth0
iface eth0 inet static
  address 192.232.2.5
  netmask 255.255.255.0
  gateway 192.232.2.1

up echo nameserver 192.232.4.3 > /etc/resolv.conf // ip DNS Server
up echo nameserver 192.168.122.1 >> /etc/resolv.conf
```

## Installation

```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server -y
dhcpd --version

echo INTERFACES="eth0" > /etc/default/isc-dhcp-serverm
```

-

## Soal 1

Pulau Paradis telah menjadi tempat yang damai selama 1000 tahun, namun kedamaian tersebut tidak bertahan selamanya. Perang antara kaum Marley dan Eldia telah mencapai puncak. Kaum Marley yang dipimpin oleh Zeke, me-register domain name marley.yyy.com untuk worker Laravel mengarah pada Annie. Namun ternyata tidak hanya kaum Marley saja yang berinisiasi, kaum Eldia ternyata sudah mendaftarkan domain name eldia.yyy.com untuk worker PHP (0) mengarah pada Armin.

- pertama agar lebih mudah kita dapat membuat script untuk memasang konfigurasi nantinya, pada DNS Server kita namakan script dengan file `config-fritz.sh` :

```bash
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

```

- setelah menjalankan script maka akan terbuat konfigurasi sesuai dengan script seperti berikut
  ![alt text](/img/fritz.sh.png)

- lalu setelahnya kita dapat melakukan `ping marley.it31.com` pada client `Zeke` dan `ping eldia.it31.com` pada client `Erwin` :

![alt text](image.png)

![alt text](image-1.png)

## Soal 2

Jauh sebelum perang dimulai, ternyata para keluarga bangsawan, Tybur dan Fritz, telah membuat kesepakatan sebagai berikut:

Semua Client harus menggunakan konfigurasi ip address dari keluarga Tybur (dhcp).

Client yang melalui bangsa marley mendapatkan range IP dari `[prefix IP].1.05 - [prefix IP].1.25` dan `[prefix IP].1.50 - [prefix IP].1.100 (2)`

- pada Paradis (DHCP Relay) kita dapat membuat script bernama `paradis.sh` yang mengarah ke Tybur (DHCP Server)

```bash
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay start

relay="SERVERS=\"192.232.4.2\"
INTERFACES=\"eth1 eth2 eth3 eth4\"
OPTIONS=\"\"
"
echo "$relay" >/etc/default/isc-dhcp-relay

echo net.ipv4.ip_forward=1 >/etc/sysctl.conf

service isc-dhcp-relay restart

```

- lalu jalankan `paradis.sh`

```bash
bash paradis.sh
```

- setalah script diatas dijalankan, kita dapat masuk ke Tybur (DHCP Server) dan membuat script `subnet.sh` untuk setup subnet marley, sebelumnya bisa diingat bahwa subnet selalu berakhiran `[ip].0`

```bash
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
}' > /etc/dhcp/dhcpd.conf
```

## Soal 3

Client yang melalui bangsa eldia mendapatkan range IP dari [prefix IP].2.09 - [prefix IP].2.27 dan [prefix IP].2 .81 - [prefix IP].2.243

- setelah tadi setup subnet dari `marley` maka sekarang kita setup subnet untuk `eldia`. kita dapat menambahkan pada script `subnet.sh`

```bash
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

```

## Soal 4

Client mendapatkan DNS dari keluarga Fritz dan dapat terhubung dengan internet melalui DNS tersebut

- lalu setelah setup subnet pada marley dan eldia pada file `subnet.sh` sebelumnya, maka kita selanjutnya dapat setup untuk `option-domain-name-servers`

```bash
echo 'subnet 192.232.3.0 netmask 255.255.255.0 {
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
}

subnet 192.232.2.0 netmask 255.255.255.0 {
    range 192.232.2.09 192.232.2.27;
    range 192.232.2.81 192.232.2.243;
    option routers 192.232.2.4;
    option broadcast-address 192.232.2.255;
    option domain-name-servers 192.232.4.3;
}' >/etc/dhcp/dhcpd.conf


```

- lalu setup option pada fritz (DNS Server) pada script `fritz.sh`

```bash
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
```

## Soal 5

Dikarenakan keluarga Tybur tidak menyukai kaum eldia, maka mereka hanya meminjamkan ip address ke kaum eldia selama 6 menit. Namun untuk kaum marley, keluarga Tybur meminjamkan ip address selama 30 menit. Waktu maksimal dialokasikan untuk peminjaman alamat IP selama 87 menit.

- untuk menambahkan waktu limit, kita dapat menambahkan limit pada script sebelumnya, agar lebih mudah kita dapat membuat script untuk limit itu sendiri bernama `limit.sh` :

```bash
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

```

- kemudian jalankan `limit.sh` agar dapat menjalankan Tybur (DHCP Server)

```bash
bash limit.sh
```

- lalu tes telnet pada client `Erwin` dan `Zeke` , akan tetapi sebelumnya node kedua client tersebut dapat dimatikan, lalu di nyalakan kembali.

![alt text](/img/zeke-dhcp.png)

![alt text](/img/erwin-dhcp.png)

## Soal 6

Armin berinisiasi untuk memerintahkan setiap worker PHP untuk melakukan konfigurasi virtual host untuk website berikut https://intip.in/BangsaEldia dengan menggunakan php 7.3

- agar lebih mudah kita dapat membuat script dengan nama `php-worker.sh
` untuk menginstall PHP pada `Armin` (PHP Worker)

```sh
#!/bin/bash

# Tambahkan nameserver
echo nameserver 192.232.2.4 >>/etc/resolv.conf
apt-get update
apt-get install nginx -y
apt-get install lynx -y
apt-get install php php-fpm -y
apt-get install wget -y
apt-get install unzip -y
service nginx start
service php7.3-fpm start

wget -O '/var/www/eldia.it31.com' 'https://drive.google.com/uc?export=download&id=1ufulgiWyTbOXQcow11JkXG7safgLq1y-'
unzip -o /var/www/eldia.it31.com -d /var/www/
rm /var/www/eldia.it31.com
mv /var/www/modul-3 /var/www/eldia.it31.com

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/eldia.it31.com
ln -s /etc/nginx/sites-available/eldia.it31.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

echo 'server {
     listen 80;
     server_name _;

     root /var/www/eldia.it31.com;
     index index.php index.html index.htm;

     location / {
         try_files $uri $uri/ /index.php?$query_string;
     }

     location ~ \.php$ {
         include snippets/fastcgi-php.conf;
         fastcgi_pass unix:/run/php/php7.3-fpm.sock;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
         include fastcgi_params;
     }
 }' >/etc/nginx/sites-available/eldia.it31.com

service nginx restart

```

- lalu setelah itu jalankan `php-worker-armin`

```sh
bash php-worker-armin
```

- setelah itu kita beralih ke client, kemudian agar bisa menampilkan php nya kita dapat menginstall `lynx` terlebh dahulu pada client

```sh
apt install lynx
```

- lalu kita dapat lakukan test lynx pada localhost

```sh
lynx localhost
```

![alt text](/img/lynx-localhost.png)

- kemudian bisa juga test lynx pada client dengan command :

```sh
lynx http://eldia.it31.com
```

![alt text](/img/lynx-zeke.png)

## Soal 7

Dikarenakan Armin sudah mendapatkan kekuatan titan colossal, maka bantulah kaum eldia menggunakan colossal agar dapat bekerja sama dengan baik. Kemudian lakukan testing dengan 6000 request dan 200 request/second.

- pada Fritz (DNS Server) kita dapat mengkonfigurasi untuk menuju ke Colossal (Load Balancer PHP), dengan membuat script `config-lb` dan jalankan script tersebut

```sh
echo 'zone "marley.it31.com" {
        type master;
        file "/etc/bind/jarkom/marley.it31.com";
};

zone "eldia.it31.com" {
        type master;
        file "/etc/bind/jarkom/eldia.it31.com";
};' > /etc/bind/named.conf.local

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
@               IN      A       192.232.3.3 ; IP Colossal' > /etc/bind/jarkom/marley.it31.com

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
@               IN      NS      eldia.it03.com.
@               IN      A       192.232.3.3 ; IP Colossal' > /etc/bind/jarkom/eldia.it31.com

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
```

- kemudian beralih ke Colossal, kita dapat membuat configurasi menggunakan script `colossal.sh` untuk mengatur load-balancernya

```sh
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install apache2-utils php7.0 php-fpm -y
apt-get install nginx -y
apt-get install lynx -y
```

- lalu untuk konfigurasi di load balencer nya menggunakan script `config-colossal.sh`

```sh
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo '
upstream worker {
    server 192.232.2;
    server 192.232.3;
    server 192.232.4;
}

server {
    listen 80;
    server_name eldia.it31.com www.eldia.it31.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    location / {
        proxy_pass http://worker;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
' > /etc/nginx/sites-available/lb_php

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```

- lalu kita coba di client `Erwin` sebelumnya dengan memasuki script `erwin-lb.sh` berikut :

```sh
apt update
apt install lynx -y
apt install htop -y
apt install apache2-utils -y
apt-get install jq -y
```

```sh
bash erwin-lb.sh
```

- kemudian kita lakukan `apache bencmark` pada client `Erwin`

```sh
ab -n 6000 -c 200 http://eldia.it31.com/
```

![alt text](/img/ab-lb.png)

![alt text](/img/ab-lb-req.png)

## Soal 8
