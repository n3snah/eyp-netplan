netplan::interface { 'all':
  match      => true,
  match_name => '*',
  dns        => [ '1.1.1.1', '8.8.8.8' ],
  search     => [ 'demo.vm' ],
}
