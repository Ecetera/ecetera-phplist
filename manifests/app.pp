class phplist::app (
 $install_dir,
 $install_url,
 $db_name,
 $db_host,
 $db_user,
 $db_password,
 $phplist_owner,
 $phplist_group,
 $version,
 $installation_name,
 $table_prefix,
 $usertable_prefix,
 $pageroot,
) {

 #Got Unknow function don't know how to fix that. Will see later
 #validate_string($install_dir,$install_url,$db_name,$db_host,$db_user,$db_password,$phplist_owner,$phplist_group)

 ## Resource defaults
  File {
    owner  => $phplist_owner,
    group  => $phplist_group,
    mode   => '0644',
  }

  file { $install_dir:
    ensure => directory,
    recurse => true,
  }

  package { 'phplist':
    ensure => $version
  }

  file { "config.php":
    name => "${install_dir}/public_html/lists/config/config.php",
    owner => $phplist_owner,
    group => $phplist_group,
  }

#  concat { "${install_dir}/public_html/lists/config/config.php":
#    ensure => present,
#    content => template('phplist/config.php.erb'),
#    replace => false,
#    require => Package['phplist']
#  }
}
