# Class: vision_keepalived
# ===========================
#
# Parameters
# ----------
#  Example $vrt_ip_address = 192.168.0.123\24
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
  String $is_active_command,
  String $package = 'keepalived',
  String $service = 'keepalived',

) {

  package { $package:
    ensure  => present,
  }

  user { 'keepalived_script':
    ensure     => present,
    managehome => false,
    shell      => '/bin/false',
    require    => Package[$package],
  }

  file { '/etc/keepalived/is_active.sh':
    ensure  => present,
    mode    => '0755',
    owner   => 'keepalived_script',
    group   => 'keepalived_script',
    content => template('vision_keepalived/is_active.sh.erb'),
    notify  => Service[$service],
    require => User['keepalived_script'],
  }

  file { '/etc/keepalived/keepalived.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
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
