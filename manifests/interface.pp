define netplan::interface (
                            $dev              = $name,
                            $filename         = $name,
                            $match            = false,
                            $match_name       = undef,
                            $match_macaddress = undef,
                            $match_driver     = undef,
                            $addresses        = [],
                            $gateway4         = undef,
                            $gateway6         = undef,
                            $dns              = [],
                            $dhcp4            = undef,
                            $dhcp6            = undef,
                            $optional         = undef,
                            $macaddress       = undef,
                            $order            = '91',
                          ) {
  include ::netplan

  file { "/etc/netplan/${order}-${filename}.yaml":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/interface.erb"),
    notify  => Exec['netplan apply'],
  }

}
