# Test a standard phplist installation with RPM
# The test assumes that the RPM is available through a YUM repo.
# TODO Must update the test because the module default behavior is to install a
# tar package not a RPM. Need to update the code to specify the use of RPM
class { 'apache': }

class { 'apache::mod::php': }

file { '/var/www/html/phplist-2.11.9':
  ensure => directory,
}

file { '/var/www/html/phplist-2.11.9/public_html':
  ensure  => directory,
  require => File['/var/www/html/phplist-2.11.9']
}

apache::vhost { 'testphplist.example.com':
  priority   => '10',
  vhost_name => '*',
  port       => '80',
  docroot    => '/var/www/html/phplist-2.11.9/public_html',
  require    => File['/var/www/html/phplist-2.11.9/public_html'],
  } ->
  class { 'phplist':
  version      => '2.11.9',
  install_dir  => '/var/www/html/phplist-2.11.9/public_html/lists/config',
  install_type => 'rpm',
  }
