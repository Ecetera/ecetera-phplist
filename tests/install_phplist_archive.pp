# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation errors
# and view a log of events) or by fully applying the test in a virtual environment
# (to compare the resulting system state to the desired state).
#
# Learn more about module testing here: http://docs.puppetlabs.com/guides/tests_smoke.html
#
# Test a standard phplist installation with an archive
class { 'apache': } 

class { 'apache::mod::php': }

file { '/var/www/html/phplist-2.11.9':
   ensure => directory,
}

file { '/var/www/html/phplist-2.11.9/public_html':
   ensure  => directory,
   require => File['/var/www/html/phplist-2.11.9']
}

file { '/var/www/html/phplist-2.11.9/public_html/lists':
   ensure  => directory,
   require => File['/var/www/html/phplist-2.11.9/public_html']
}

# TODO : Use a generic name to identify the phplist and set a link to default value.
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
   install_type => 'tar',
   url          => 'http://download.example.com/phplist-2.11.9.tgz',
  } 
