# @summary Manages the Netplan service on the local Linux machine.
#
# This class helps bind all other classes together to install and manage the netplan service on the local machine.
#
# @param manage_package
#   Tells Puppet to manage the package or not.
#   true - Puppet will ensure that the package is managed.
#   false - Puppet will not manage the package.
#
# @param package_ensure
#   Determins whether the package is installed or absent. Requires manage_package to be true.
#   installed - Will ensure that Netplan is installed
#   absent - Will ensure that Netplan is absent
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
#   Configures puppet to manage all contents inside the /etc/netplan directory.
#   true  - Puppet will purge any file or directory which doesn't have an associated resource defined in the catalog.
#   false - Puppet will manage only files which have an associated resource and leave all other items alone.
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

  Class['::systemd::resolved']
  -> class { '::netplan::install':
    manage_package => $manage_package,
    package_ensure => $package_ensure
   }
  -> class { '::netplan::config':
  dir_purge => $netplan_dir_purge }
  -> Class['::netplan']

  exec { 'netplan apply':
    command     => '/usr/sbin/netplan apply',
    refreshonly => true,
  }
}
