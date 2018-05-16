# DNS test:
netplan::interface { 'enp0s3':
  dns   => [ '8.8.8.8', '1.1.1.1' ],
}
