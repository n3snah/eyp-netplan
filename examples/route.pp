netplan::route { '69.69.69.0/24':
  gw  => '1.1.1.1',
  dev => 'enp0s3',
}
