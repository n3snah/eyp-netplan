# DNS test:
netplan::interface { 'enp0s3':
  dns => [ '1.1.1.1', '8.8.8.8' ],
}
