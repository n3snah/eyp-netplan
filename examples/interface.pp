# DNS test:
netplan::interface { 'enp0s3':
  dns       => [ '1.1.1.1' ],
  dhcp4     => false,
  addresses => [ '10.0.2.15/24' ],
}
