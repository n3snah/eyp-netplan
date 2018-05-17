netplan::route { '69.69.69.0/24':
  gw  => '192.168.56.1',
  dev => 'enp0s8',
}

netplan::route { '69.69.70.0/24':
  gw  => '192.168.56.1',
  dev => 'enp0s8',
}
