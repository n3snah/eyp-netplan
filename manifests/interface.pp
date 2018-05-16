define netplan::interface (
                            $dev              = $name,
                            $match            = false,
                            $match_name       = undef,
                            $match_macaddress = undef,
                            $match_driver     = undef,
                            $addresses        = [],
                            $gateway4         = undef,
                            $gateway6         = undef,
                            $dns              = [],
                            $dhcp4            = false,
                            $dhcp6            = false,
                            $optional         = false,
                            $macaddress       = undef,
                            $order            = '91',
                          ) {
  include ::netplan

  file { "/etc/netplan/${order}-${dev}.yaml":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/interface.erb"),
  }

}
