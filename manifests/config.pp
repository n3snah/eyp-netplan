class netplan::config inherits netplan {

  file { '/etc/netplan':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}
