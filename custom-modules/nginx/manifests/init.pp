class nginx {

  package { 'nginx':
    ensure => 'latest',
  }

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
  }

  file { "/etc/nginx/sites-enabled/default":
    ensure => "absent",
  }

  file { "default.conf":
    ensure  => 'present',
    mode    => "755",
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/nginx/default.conf",
    path    => "/etc/nginx/sites-enabled/default.conf",
    notify  => Service["nginx"],
  }

}






