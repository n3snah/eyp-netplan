class netplan::service inherits netplan {

  #
  validate_bool($netplan::manage_docker_service)
  validate_bool($netplan::manage_service)
  validate_bool($netplan::service_enable)

  validate_re($netplan::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${netplan::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $netplan::manage_docker_service)
  {
    if($netplan::manage_service)
    {
      service { $netplan::params::service_name:
        ensure => $netplan::service_ensure,
        enable => $netplan::service_enable,
      }
    }
  }
}
