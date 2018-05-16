define netplan::route (
                        $dev,
                        $gw,
                        $network         = $name,
                        $ensure          = 'present',
                        $order           = '92',
                      ) {
  include ::netplan

  if(!defined(Concat["/etc/netplan/${order}-routes-${dev}.yaml"]))
  {
    concat { "/etc/netplan/${order}-routes-${dev}.yaml":
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      notify  => Exec['netplan apply'],
    }

    concat::fragment{ "/etc/netplan/${order}-routes-${dev}.yaml base":
      target  => "/etc/netplan/${order}-routes-${dev}.yaml",
      order   => '00',
      content => template("${module_name}/routes/base.erb")
    }
  }

  concat::fragment{ "/etc/netplan/${order}-routes-${dev}.yaml ${dev} ${gw} ${network}":
    target  => "/etc/netplan/${order}-routes-${dev}.yaml",
    order   => '99',
    content => template("${module_name}/routes/route.erb")
  }
}
