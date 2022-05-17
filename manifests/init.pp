# @summary Manages the Netplan service on the local Linux machine.
#
# This class helps bind all other classes together to install and manage the netplan service on the local machine.
#
# @param manage_package
#
# @param package_ensure
#
# @param manage_service
#
# @param manage_docker_service
#
# @param service_ensure
#
# @param service_eneable
#
# @param netplan_dir_purge
#
# @example
#   include netplan
class netplan (
                $manage_package        = true,
                $package_ensure        = 'installed',
                $manage_service        = true,
                $manage_docker_service = true,
                $service_ensure        = 'running',
                $service_enable        = true,
                $netplan_dir_purge     = false,
              ) inherits netplan::params{

  include ::systemd::resolved

  Class['::systemd::resolved'] ->
  class { '::netplan::install': }
  -> class { '::netplan::config':
  dir_purge => $netplan_dir_purge }
  -> Class['::netplan']

  exec { 'netplan apply':
    command     => '/usr/sbin/netplan apply',
    refreshonly => true,
  }
}
