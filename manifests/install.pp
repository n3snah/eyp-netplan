# @summary Manages the installation of Netplan
#
# This class defines how Puppet should manage the package and installation of Netplan.
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
class netplan::install (
    Boolean $manage_package = true,
    String $package_ensure = 'installed'
) {

  $package_name = 'netplan.io'

  if($manage_package) {
    package { $package_name:
      ensure => $package_ensure,
    }
  }
}
