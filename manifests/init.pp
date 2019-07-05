# Class: vision_keepalived
# ===========================
#
# Parameters
# ----------
#
# Examples
# --------
#
# @example
# contain ::vision_keepalived
#

class vision_keepalived (

  String $auth_pass,
  String $vrt_ip_address,
  String $interface,
  String $package = 'keepalived',
  String $service = 'keepalived',

) {

  package { $package:
    ensure  => present,
  }

  file { '/etc/keepalived/keepalived.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    content => template('vision_keepalived/keepalived.conf.erb'),
    notify  => Service[$service],
    require => Package[$package],
  }

  service { $service:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package[$package],
  }

}
