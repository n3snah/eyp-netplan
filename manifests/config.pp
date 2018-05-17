class netplan::config inherits netplan {

  file { '/etc/netplan':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => $netplan::netplan_dir_purge,
    purge   => $netplan::netplan_dir_purge,
  }

}
