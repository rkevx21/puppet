class mysql {
  $packages_list = ['mysql-server-5.7','php7.2-mysql']
  package { $packages_list:
    ensure => 'latest',
  }

  service { 'mysql':
    ensure 	=> running,
    enable 	=> true,
    require => Package['mysql-server-5.7'],
  }
}
