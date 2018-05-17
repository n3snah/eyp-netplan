class netplan(
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
  -> class { '::netplan::config': }
  -> Class['::netplan']

  exec { 'netplan apply':
    command     => '/usr/sbin/netplan apply',
    refreshonly => true,
  }

}
