# @summary Manages the /etc/netplan directory
#
# This class configures the behaviour of puppets responsibility for /etc/netplan directory.
#
# @param dir_purge
#   Configures puppet to manage all contents inside the /etc/netplan directory.
#   true  - Puppet will purge any file or directory which doesn't have an associated resource defined in the catalog.
#   false - Puppet will manage only files which have an associated resource and leave all other items alone.
#
class netplan::config (
    Boolean $dir_purge = false,
) {

  file { '/etc/netplan':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => $dir_purge,
    purge   => $dir_purge,
  }

}
