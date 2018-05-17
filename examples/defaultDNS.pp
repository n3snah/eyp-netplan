netplan::interface { 'all':
  dev        => 'resolversallinterfaces',
  match      => true,
  match_name => '*',
  dns        => [ '1.1.1.1', '8.8.8.8' ],
  search     => [ 'demo.vm' ],
}
