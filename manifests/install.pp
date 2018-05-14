class netplan::install inherits netplan {

  if($netplan::manage_package)
  {
    package { $netplan::params::package_name:
      ensure => $netplan::package_ensure,
    }
  }

}
