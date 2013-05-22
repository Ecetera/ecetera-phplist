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
 $install_dir = '/var/www/html/phplist',
 $install_url = 'http://www.phplist.com/download',
 $created_db  = 'true',
 $created_db_user = 'true',
 $db_name = 'phplist',
 $db_host = 'localhost',
 $db_user = 'phplist',
 $db_password = 'phplist',
 $phplist_owner = 'root',
 $phplist_group = 'root',
) {


}
