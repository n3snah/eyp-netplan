netplan::route { '69.69.69.0/24':
  gw  => '10.0.2.2/32',
  dev => 'enp0s8',
}

netplan::route { '69.69.70.0/24':
  gw  => '10.0.2.2/32',
  dev => 'enp0s8',
}
