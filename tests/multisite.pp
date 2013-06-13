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
include phplist
include apache
# TODO : Use a generic name to identify the phplist and set a link to default value.
	apache::vhost { 'testphplist.example.com':
		priority   => '10',
		vhost_name => '*',
		port       => '80',
		docroot    => '/phplist-2.11.9/public_html',
    require    => Class['phplist']
	}  

  $directories = ['/var/www/html/newsletter', '/var/www/html/newsletter/public_html', '/var/www/html/newsletter/public_html/lists' ]

    file { $directories: 
      ensure => 'directory',
      require => [ Class['apache']]
    }
