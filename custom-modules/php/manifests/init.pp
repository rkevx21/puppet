class php {
  $packages_list = ['php7.2-fpm', 'php7.2-cli']
  package { $packages_list:
    ensure => 'latest',
  }

  service { 'php7.2-fpm':
    ensure  => running,
    enable  => true,
    require => Package['php7.2-fpm'],
  }

  file { '/var/www/html':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    recurse => 'true',
    mode    => '775',
  }

  file { "index.php":
    ensure  => 'present',
    mode    => '775',
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/php/index.php",
    path    => "/var/www/html/index.php",
    require => Package['php7.2-fpm'],
  }  
  
  file { "index.nginx-debian.html":
    ensure  => "absent",
    path    => "/var/www/html/index.nginx-debian.html"
  }

}