netplan::route { '69.69.69.0/24':
  gw  => '1.1.1.1',
  dev => 'enp0s3',
}

netplan::route { '69.69.70.0/24':
  gw  => '1.1.1.1',
  dev => 'enp0s3',
}
