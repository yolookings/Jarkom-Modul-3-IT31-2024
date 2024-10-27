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
- [Soal 9](#soal-9)
- [Soal 10](#soal-10)
- [Soal 11](#soal-11)
- [Soal 12](#soal-12)
- [Soal 13](#soal-13)

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

- Paradis (DHCP Relay)

```sh
apt-get update
apt-get install isc-dhcp-relay -y
```

- Tybur (DHCP Server)

```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server -y
dhcpd --version

echo INTERFACES="eth0" > /etc/default/isc-dhcp-serverm
```

- Warhammer (Database)

```sh
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install mariadb-server -y
service mysql start
```

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

![alt text](/img/zeke-ping.png)

![alt text](/img/erwin-ping.png)

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
service php7.0-fpm start

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

Karena Erwin meminta “laporan kerja Armin”, maka dari itu buatlah analisis hasil testing dengan 1000 request dan 75 request/second untuk masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:

1. Nama Algoritma Load Balancer
2. Report hasil testing pada Apache Benchmark
3. Grafik request per second untuk masing masing algoritma.
4. Analisis

Jalankan Testing Dengan
`ab -n 1000 -c 75 http://192.232.3.3/`

1. Round Robin

```sh
upstream worker {
	server 192.232.2.2; # IP Armin
	server 192.232.2.3; # IP Eren
	server 192.232.2.4; # IP Mikasa
}
```

![alt text](/img/rr.png)

2. Weighted Round Robin

```sh
upstream worker {
	server 192.232.2.2 weight=3;
	server 192.232.2.3 weight=2;
	server 192.232.2.4 weight=1;
}
```

![alt text](/img/w-rr.png)

3.  Least Connections

```sh
upstream worker {
  least_conn;
	server 192.232.2.2; # IP Armin
	server 192.232.2.3; # IP Eren
	server 192.232.2.4; # IP Mikasa
}
```

![alt text](/img/lc.png)

4. Weighted Least Connections

```sh
upstream worker {
  least_conn;
	server 192.232.2.2 weight=3; # IP Armin
	server 192.232.2.3 weight=2; # IP Eren
	server 192.232.2.4 weight=1; # IP Mikasa
}
```

![alt text](/img/w-lc.png)

5. IP Hash

```sh
upstream worker {
  ip_hash;
	server 192.232.2.2; # IP Armin
	server 192.232.2.3; # IP Eren
	server 192.232.2.4; # IP Mikasa
}
```

![alt text](/img/ip-hash.png)

## Soal 9

Dengan menggunakan algoritma Least-Connection, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 1000 request dengan 10 request/second, kemudian tambahkan grafiknya pada “laporan kerja Armin”.

Testing gunakan command

```sh
ab -n 1000 -c 75 http://192.232.3.3/
```

1 Worker

```sh
upstream worker {
    least_conn;
	  server 192.232.2.2;
  }
```

![alt text](/img/1-worker.png)

2 Worker

```sh
upstream worker {
    least_conn;
	  server 192.232.2.2;
    server 192.232.2.3;
  }
```

![alt text](/img/2-worker.png)

3 Worker

```sh
upstream worker {
    least_conn;
	  server 192.232.2.2;
    server 192.232.2.3;
    server 192.232.2.4;
  }
```

![alt text](/img/3-worker.png)

## Soal 10

Selanjutnya coba tambahkan keamanan dengan konfigurasi autentikasi di **Colossal** dengan dengan kombinasi username: “arminannie” dan password: “jrkmyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/supersecret/

**Di Colossal (Load Balancer):**

Bikin Folder supersecret

```sh
mkdir -p /etc/nginx/supersecret
```

Buat file `htpasswd` dengan username dan password yang telah ditentukan.

```sh
htpasswd -cb /etc/nginx/supersecret/htpasswd arminannie jrkmit31
```

Menjalankan service dari php-fpm dan nginx.

```sh
service php7.3-fpm start
service nginx start
```

Edit konfigurasi server pada file /etc/nginx/sites-available/load-balancer-it31.conf menjadi seperti berikut:

```sh
server {
	listen 80;

	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
				auth_basic "Restricted Content";
        auth_basic_user_file /etc/nginx/supersecret/htpasswd;
        proxy_pass http://worker;
	}
}
```

Kemudian Restart nginx dan php-fpm.

```sh
service nginx restart
service php7.0-fpm restart
```

script `lb_passwd`:

```sh
#!/bin/bash

# Membuat folder supersecret
echo "Membuat folder /etc/nginx/supersecret..."
mkdir -p /etc/nginx/supersecret

# Membuat file htpasswd dengan username dan password
echo "Menambahkan user 'arminannie' dengan password ke htpasswd..."
htpasswd -cb /etc/nginx/supersecret/htpasswd arminannie jrkmit31

# Menjalankan service php-fpm dan nginx
echo "Menjalankan php7.0-fpm dan nginx..."
service php7.0-fpm start
service nginx start

# Menambahkan konfigurasi autentikasi pada file load balancer
NGINX_CONF="/etc/nginx/sites-available/lb_php.conf"
echo "Mengedit konfigurasi server pada $NGINX_CONF..."

cat <<EOL > $NGINX_CONF
upstream worker {
	server 192.232.2.2; # IP Armin
	server 192.232.2.3; # IP Eren
	server 192.232.2.4; # IP Mikasa
}

server {
	listen 80;

	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		auth_basic "Restricted Content";
		auth_basic_user_file /etc/nginx/supersecret/htpasswd;
		proxy_pass http://worker;
		proxy_http_version 1.1;
		proxy_set_header Upgrade \$http_upgrade;
		proxy_set_header Connection 'upgrade';
		proxy_set_header Host \$host;
		proxy_cache_bypass \$http_upgrade;
	}
}
EOL

# Restart nginx dan php-fpm
echo "Me-restart nginx dan php7.3-fpm..."
service nginx restart
service php7.0-fpm restart

echo "Konfigurasi selesai. Load balancer dengan autentikasi telah diatur."
```

jalankan dengan

```
lynx 192.232.3.3
```

## Soal 11

Lalu buat untuk setiap request yang mengandung /titan akan di proxy passing menuju halaman `https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki `

**Di Colossal (Load Balancer):**

Edit konfigurasi `server` pada file `/etc/nginx/sites-available/lb_php` menjadi seperti berikut:

```sh
upstream worker {
	server 192.232.2.2; # IP Armin
	server 192.232.2.3; # IP Eren
	server 192.232.2.4; # IP Mikasa
}

server {
	listen 80;

	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		auth_basic "Restricted Content";
		auth_basic_user_file /etc/nginx/supersecret/htpasswd;
		proxy_pass http://worker;
	}

	location /titan {
		auth_basic "Restricted Content";
		auth_basic_user_file /etc/nginx/supersecret/htpasswd;
		proxy_pass https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki;
		proxy_set_header X-Real-IP \$remote_addr;
		proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto \$scheme;
	}

}
```

Restart service nginx dan php-fpm.

```
service nginx restart
service php7.0-fpm restart
```

Script `lb11.sh` :

```sh
#!/bin/bash

# Menambahkan konfigurasi autentikasi pada file load balancer
NGINX_CONF="/etc/nginx/sites-available/lb_php"
echo "Mengedit konfigurasi server pada $NGINX_CONF..."

cat <<EOL > $NGINX_CONF
upstream worker {
	server 192.232.2.2; # IP Armin
	server 192.232.2.3; # IP Eren
	server 192.232.2.4; # IP Mikasa
}

server {
	listen 80;

	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		auth_basic "Restricted Content";
		auth_basic_user_file /etc/nginx/supersecret/htpasswd;
		proxy_pass http://worker;
	}

	location /titan {
		auth_basic "Restricted Content";
		auth_basic_user_file /etc/nginx/supersecret/htpasswd;
		proxy_pass https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki;
		proxy_set_header X-Real-IP \$remote_addr;
		proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto \$scheme;
	}

}

EOL

# Restart nginx dan php-fpm untuk menerapkan konfigurasi baru
echo "Me-restart nginx dan php7.3-fpm..."
service nginx restart
service php7.0-fpm restart

echo "Konfigurasi selesai. Load balancer dengan autentikasi telah diatur."
```

Jalankan dengan :

```
lynx 192.168.3.3/titan
```

![alt text](/img/11.png)

## Soal 12

Selanjutnya Colossal ini hanya boleh diakses oleh client dengan IP [Prefix IP].1.77, [Prefix IP].1.88, [Prefix IP].2.144, dan [Prefix IP].2.156.

**Di Colossal (Load Balancer):**

Edit konfigurasi `server` pada file `/etc/nginx/sites-available/lb_php` menjadi seperti berikut:

```sh

upstream worker {
	server 192.232.2.2; # IP Armin
	server 192.232.2.3; # IP Eren
	server 192.232.2.4; # IP Mikasa
}

server {
	listen 80;

	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		allow 192.232.1.77;
		allow 192.232.1.88;
		allow 192.232.2.144;
		allow 192.232.2.156;
		deny all;

		auth_basic "Restricted Content";
		auth_basic_user_file /etc/nginx/supersecret/htpasswd;
		proxy_pass http://worker;
	}

	location /titan {
		auth_basic "Restricted Content";
		auth_basic_user_file /etc/nginx/supersecret/htpasswd;
		proxy_pass https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki;
		proxy_set_header X-Real-IP \$remote_addr;
		proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto \$scheme;
	}

}
```

```sh
ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
```

config pada tybur (zeke saja buat test)

```sh
echo 'host Zeke{
        hardware ethernet fa:61:fb:1a:8d:5b;
        fixed-address 192.246.1.77;
}
' >> /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
```

script `lb12.sh`:

```sh
#!/bin/bash

# Menambahkan konfigurasi autentikasi pada file load balancer
NGINX_CONF="/etc/nginx/sites-available/lb_php"
echo "Mengedit konfigurasi server pada $NGINX_CONF..."

cat <<EOL > $NGINX_CONF

upstream worker {
	server 192.232.2.2; # IP Armin
	server 192.232.2.3; # IP Eren
	server 192.232.2.4; # IP Mikasa
}

server {
	listen 80;
  server_name eldia.it31.com www.eldia.it31.com;
	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		allow 192.232.1.77;
		allow 192.232.1.88;
		allow 192.232.2.144;
		allow 192.232.2.156;
		deny all;

		auth_basic "Restricted Content";
		auth_basic_user_file /etc/nginx/supersecret/htpasswd;
		proxy_pass http://worker;
	}

	location /titan {
		auth_basic "Restricted Content";
		auth_basic_user_file /etc/nginx/supersecret/htpasswd;
		proxy_pass https://attackontitan.fandom.com/wiki/Attack_on_Titan_Wiki;
		proxy_set_header X-Real-IP \$remote_addr;
		proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto \$scheme;
	}

}


EOL

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

# Restart nginx dan php-fpm untuk menerapkan konfigurasi baru
echo "Me-restart nginx dan php7.0-fpm..."
service nginx restart
service php7.0-fpm restart

echo "Konfigurasi selesai. Load balancer dengan autentikasi telah diatur."
```

cek `hwaddress ether 22:57:51:c6:dc:a6` di node zeke dan `hwaddress ether 32:19:e1:f4:cd:39` di node erwin

![alt text](/img/12-ip-a.png)
config pada tybur (zeke saja buat test)

```sh
echo 'host Zeke{
        hardware ethernet 22:57:51:c6:dc:a6;
        fixed-address 192.232.1.77;
}
host Erwin {
    hardware ethernet 32:19:e1:f4:cd:39;
    fixed-address 192.232.2.144;
}
' >> /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
```

jalankan script, kemudian tes `192.232.3.3` di collosal untuk mengetes forbiddennya
![alt text](/img/12.png)

## Soal 13

Melihat perlawanan yang sengit dari kaum eldia, kaum marley pun memutar otak dan mengatur para worker di marley.
Karena mengetahui bahwa ada keturunan marley yang mewarisi kekuatan titan, Zeke pun berinisiatif untuk menyimpan data data penting di Warhammer, dan semua data tersebut harus dapat diakses oleh anak buah kesayangannya, Annie, Reiner, dan Berthold.

- agar lebih mudah kita dapat membuat script untuk `database server` pada `Warhammer` dengan nama `sql.sh`

```sh
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
echo "$mysql" > /etc/mysql/my.cnf

service mysql restart
```

- setelah itu jalankan `sql.sh`

```sh
bash sql.sh
```

- lalu kita cek database tersebut pada `Annie, Bertholdt, Reiner` sebagai worker laravel nya, untuk itu buat script untuk para worker bernama `laravel-worker.sh`

```sh
echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install mariadb-client -y
service mysql start
```

- setelah itu, maka kita dapat untuk menjalankan command untuk masuk ke databasenya untuk melakukan test pada ketiga `worker laravel` tersebut:

```sh
mysql --host=192.232.3.4 --port=3306 --user=kelompokit31 --password=passwordit31
```

- dan saat sudah masuk ke database, kita dapat melihatnya menggunakan command untuk masing masing worker:

```sh
USE DATABASES;
```

- Annie

  ![alt text](/img/annie-testing.png)

- Berthold

  ![alt text](/img/ber-testing.png)

- Reiner

  ![alt text](/img/rein-testing.png)
