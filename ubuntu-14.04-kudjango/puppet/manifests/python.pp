# execute 'apt-get update'
exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
}

# install  package
$python = [ 'python', 'python-pip', 'python-mysqldb' ]
package { $python:
  require => Exec['apt-update'],        # require 'apt-update' before installing
  ensure => installed,
}

exec { 'pip-update':
    command => '/usr/bin/pip install -U pip',
}
