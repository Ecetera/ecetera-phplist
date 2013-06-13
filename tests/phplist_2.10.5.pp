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
# Test a standard phplist installation with RPM
class { 'apache': } 

class { 'apache::mod::php': }

file { '/phplist-2.10.5':
   ensure => directory,
}

file { '/var/wwww/html/phplist-2.10.5/public_html':
   ensure  => directory,
   require => File['/phplist-2.10.5']
}

# TODO : Use a generic name to identify the phplist and set a link to default value.
	apache::vhost { 'testphplist.example.com':
		priority   => '10',
		vhost_name => '*',
		port       => '80',
		docroot    => '/var/wwww/html/phplist-2.10.5/public_html',
    require    => File['/var/wwww/html/phplist-2.10.5/public_html'],
	} -> 
  class { 'phplist': } 
