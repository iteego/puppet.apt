class apt {

  file { '/etc/apt/sources.list':
    content => template("apt/etc/apt/sources-${distrib_id}.list.erb"),
    ensure => present,
  }

  exec { '/usr/bin/apt-get update':
    alias => "aptgetupdate",
    require => File['/etc/apt/sources.list'],
    subscribe => File['/etc/apt/sources.list'],
    refreshonly => true,
  }

}
