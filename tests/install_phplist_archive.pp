# Test a standard phplist installation with an archive

# Install dependencies
class { 'apache': }
class { 'apache::mod::php': }


class { 'phplist':
version      => '2.11.9',
install_dir  => '/var/www/html/phplist',
config_dir   => '/var/www/html/phplist/phplist-2.11.9/public_html/lists/config',
install_type => 'tar',
url          => 'http://download.example.com/phplist-2.11.9.tar.gz',
} ->
apache::vhost { 'testphplist.example.com':
  priority   => '10',
  vhost_name => '*',
  port       => '80',
  docroot    => '/var/www/html/phplist',
}
