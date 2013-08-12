# == Class: phplist::app
#
# This module will install phplist newsletter application.
#
# === Parameters
#
# [*installation_name*]
# Specifies the phplist installation name. Default: newsletter

# [*pageroot*]
# Specifies the pageroot parameter of phplist. Default: /lists

# [*privileges*]
# Specifies the phplist database user privileges. Default: '['Select_priv', 'Insert_priv', 'Update_priv', 'Delete_priv','Create_priv']'

# [*adminpages*]
# Specifies the adminpages parameter of phplist. Default: /lists/admin


# === Variables
#
#
# [*install_type*]
# Specifies what type of phplist package to install. Default: 'true'
#
# [*version*]
# Specifies the version of the phplist applications to install. Default: 2.11.9

# [*release*]
# Specifies the release number of the phplist rpm. Default: 1

# [*database_host*]
# Specifies the database host to connect to. Default: 'localhost'

# [*database_user*]
# Specifies the database user. Default: 'phplist'

# [*database_password*]
# Specifies the database user's password in plaintext. Default: 'phplist'

# [*phplist_owner*]
# Specifies the owner of the phplist files, Default: root

# [*phplist_group*]
# Specifies the group of the phplist files. Default: 0 (*BSD/Darwin compatible GID)

# [*install_dir*]
# Specifies the directory into which phplist should be installed. Default: '/var/www/html'

# [*config_dir*]
# Specifies the directory into which phplist should be installed. Default: '/var/www/html/phplist-2.10.5/public_html/lists/config'
#
# [*url*]
# Specifies the url from which the phplist tarball should be downloaded. Default: 'http://www.phplist.com/download'
#
# [*db_name*]
# Specifies the database name which the phplist module should be configured to use. Default: 'phplist'
class phplist::app (
  $multisite = false,
  $database_name = 'phplist',
  $database_host = 'localhost',
  $database_user = 'phplist',
  $database_password = 'phplist',
  $phplist_owner = 'root',
  $phplist_group = 'root',
  $version = '2.11.9',
  $release = '1',
  $table_prefix = 'phplist_',
  $usertable_prefix = 'phplist_user_',
  $install_dir = '/var/www/html',
  $config_dir = '/var/www/html/phplist-2.10.5/public_html/lists/config',
  $installation_name = 'newsletter',
  $pageroot = '/lists',
  $adminpages = '/lists/admin',
  $install_type = 'tar',
  $url = 'http://sourceforge.net/projects/phplist/files/phplist/2.11.9/phplist-2.11.9.tgz/download',
) inherits phplist::params {
  
  $language_module = $phplist::params::language_module 
  $userhistory_systeminfo = $phplist::params::userhistory_systeminfo

  validate_bool($multisite)
  validate_string($db_name,$db_host,$db_user,$database_password,$phplist_owner,$phplist_group,$install_dir,$installation_name,$pageroot,$adminpages,$install_type,$url,$config_dir,$language_module)
  # TODO : validte the release as number

  if $multisite {

  package { 'phplist':
    ensure  => "${version}-${release}",
  }

  file { 'config.php':
    path    => "${install_dir}/config.php",
    owner   => $phplist_owner,
    group   => $phplist_group,
    replace => false,
    content => template("phplist/config.php-${version}-${release}.erb"),
    require => File['install_dir']
  }
  }
  else {

    case $install_type {
      rpm: {
        package { 'phplist':
          ensure  => "${version}-${release}",
        }
        file { 'config.php':
          path    => "${install_dir}/config.php",
          owner   => $phplist_owner,
          group   => $phplist_group,
          replace => true,
          content => template("phplist/config.php-${version}-${release}.erb"),
          require => Package['phplist'],
        }
      }

      tar: {

        archive { "phplist-${version}":
          ensure  => 'present',
          url     => $url,
          target  => $install_dir,
        }

        file { 'config.php':
          path    => "${config_dir}/config.php",
          owner   => $phplist_owner,
          group   => $phplist_group,
          replace => true,
          content => template("phplist/config.php-${version}-${release}.erb"),
          require => Archive["phplist-${version}"],
        }

      }
      default: {}
    }

  }

}
