class netplan(
                $manage_package        = true,
                $package_ensure        = 'installed',
                $manage_service        = true,
                $manage_docker_service = true,
                $service_ensure        = 'running',
                $service_enable        = true,
              ) inherits netplan::params{

  class { '::netplan::install': }
  -> class { '::netplan::config': }
  -> Class['::netplan']

}
