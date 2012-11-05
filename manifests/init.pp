class apt {

  file { '/etc/apt/sources.list':
    content => template('apt/etc/apt/sources.list.erb'),
    ensure => present,
  }

  exec { '/usr/bin/apt-get update':
    alias => "aptgetupdate",
    require => File['/etc/apt/sources.list'],
    subscribe => File['/etc/apt/sources.list'],
    refreshonly => true,
  }

  schedule { 'maintenance':
    period => daily,
    range  => '2 - 4',
  }

  exec { 'maintenance-apt-get-update':
    command => '/usr/bin/apt-get update',
    require => File['/etc/apt/sources.list'],
    schedule => 'maintenace',
  }

}
