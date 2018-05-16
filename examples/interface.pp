netplan::interface { 'enp0s3':
  dhcp4 => true,
  dns   => [ '8.8.8.8', '1.1.1.1' ],
}
