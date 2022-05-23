# @summary Create interface configurations for Netplan
#
# This defined type allows Puppet to create multiple interface configuration files.
#
# @param dev
# @param filename
#   The name of the interface file
# @param match
# @param match_name
#   Match on interface name
# @param match_macaddress
#   Match a devices MAC address. Globs are not allowed
# @param match_driver
#   Match a kernel driver name. Matching on driver is only supported with NetworkD.
# @param addresses
# @param gateway4
#   Set the default gateway for IPv4
# @param gateway6
#   Set the default gateway for IPv6
# @param dns
#   A list of DNS server IP addresses
# @param search
#   A list of DNS search suffixes
# @param dhcp4
#   Should the interface use DHCP v4 to obtain an IP address
# @param dhcp6
#   Should the interface use DHCP v6 to obtain an IP address
# @param optional
#   Should the interface be flagged as optional. Does the system require the interface to boot?
# @param macaddress
#   Sets the device MAC address.
# @param order
#   The order in which the interface files are loaded
#
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
                            $search           = [],
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
