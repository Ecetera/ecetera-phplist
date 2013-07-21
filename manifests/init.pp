# == Class: phplist
#
# This module will install phplist newsletter manager on RedHat style distributions.
#
# === Parameters
#
# [*table_prefix*]
# Specifies the table prefix of the phplist database tables. Default: phplist_

# [*usertable_prefix*]
# Specifies the table prefix of the phplist database tables. Default: phplist_user_

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

# [*db_host*]
# Specifies the database host to connect to. Default: 'localhost'

# [*db_user*]
# Specifies the database user. Default: 'phplist'

# [*db_password*]
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
# [*created_db*]
# Specifies whether to create the db or not. Default: 'true'
#
# [*created_db_user*]
# Specifies whether to create the db user oor not. Default: 'true'
#
# [*db_name*]
# Specifies the database name which the phplist module should be configured to use. Default: 'phplist'

# === Examples
#
#class { 'phplist':
#  version      => '2.11.9',
#  install_dir  => '/var/www/html/phplist',
#  config_dir   => '/var/www/html/phplist/phplist-2.11.9/public_html/lists/config',
#  install_type => 'tar',
#  url          => 'http://download.example.com/phplist-2.11.9.tar.gz',
#  }
#
# === Authors
#
# Author Name <issa.moussa@ecetera.com.au>
#
# === Copyright
#
# Copyright 2013 Issa Moussa
#
class phplist (
  $create_db  = true,
  $create_db_user = true,
  $multisite = false,
  $db_name = 'phplist',
  $db_host = 'localhost',
  $db_user = 'phplist',
  $db_password = 'phplist',
  $phplist_owner = 'root',
  $phplist_group = 'root',
  $table_prefix = 'phplist_',
  $usertable_prefix = 'phplist_user_',
  $version = '2.11.9',
  $release = '1',
  $install_dir = '/var/www/html',
  $config_dir = '/var/www/html/phplist-2.10.5/public_html/lists/config',
  $installation_name = 'newsletter',
  $pageroot = '/lists',
  $privileges = ['Select_priv', 'Insert_priv', 'Update_priv', 'Delete_priv','Create_priv'],
  $adminpages = '/lists/admin',
  $install_type = 'tar',
  $url = 'http://sourceforge.net/projects/phplist/files/phplist/2.11.9/phplist-2.11.9.tgz/download',

) {
  class { 'phplist::app':
    multisite         => $multisite,
    db_name           => $db_name,
    db_host           => $db_host,
    db_user           => $db_user,
    db_password       => $db_password,
    phplist_owner     => $phplist_owner,
    phplist_group     => $phplist_group,
    table_prefix      => $table_prefix,
    usertable_prefix  => $usertable_prefix,
    version           => $version,
    release           => $release,
    install_dir       => $install_dir,
    config_dir        => $config_dir,
    installation_name => $installation_name,
    pageroot          => $pageroot,
    adminpages        => $adminpages,
    install_type      => $install_type,
    url               => $url,

  } ->
  class { 'phplist::db':
    create_db      => $create_db,
    create_db_user => $create_db_user,
    db_name        => $db_name,
    db_host        => $db_host,
    db_user        => $db_user,
    db_password    => $db_password,
    privileges     => $privileges,
  }
}
