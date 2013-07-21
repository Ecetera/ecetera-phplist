# Test the multisite installation
# TODO work in progress. Not ready yet
include phplist
include apache

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
