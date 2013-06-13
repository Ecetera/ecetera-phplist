# == Class: phplist
#
# This module will install phplist newsletter manager on RedHat style distributions.
#
# === Parameters
#
# Document parameters here.
#
# [*install_dir*]
# Specifies the directory into which phplist should be installed. Default: '/var/www/html/phplist'
#
# [*install_url*]
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




# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { phplist:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
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
 $version = '2.10.5',
 $release = '1',
 $install_dir = '/phplist-2.11.9/public_html/lists/config',
 $installation_name = 'newsletter',
 $pageroot = '/lists',
 $privileges = ['Select_priv', 'Insert_priv', 'Update_priv', 'Delete_priv','Create_priv'],
 $adminpages = '/lists/admin',

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
    installation_name => $installation_name,
    pageroot          => $pageroot,
    adminpages        => $adminpages,

  }
  -> class { 'phplist::db':
    create_db  => $create_db,
    create_db_user => $create_db_user,
    db_name => $db_name,
    db_host => $db_host,
    db_user => $db_user,
    db_password => $db_password,
    privileges        => $privileges,
  }
}
