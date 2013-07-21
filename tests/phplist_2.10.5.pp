# Test a standard phplist installation with RPM
# The test assumes that the RPM is available through a YUM repo.
# TODO Must update the test because the module default behavior is to install a
# tar package not a RPM. Need to update the code to specify the use of RPM
class { 'apache': }

class { 'apache::mod::php': }

file { '/var/www/html/phplist-2.10.5':
  ensure => directory,
}

file { '/var/www/html/phplist-2.10.5/public_html':
  ensure  => directory,
  require => File['/var/www/html/phplist-2.10.5']
}


apache::vhost { 'testphplist.example.com':
  priority   => '10',
  vhost_name => '*',
  port       => '80',
  docroot    => '/var/www/html/phplist-2.10.5/public_html',
  require    => File['/var/www/html/phplist-2.10.5/public_html'],
} ->
class { 'phplist': }
