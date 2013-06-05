class phplist::app (
 $db_name,
 $db_host,
 $db_user,
 $db_password,
 $phplist_owner,
 $phplist_group,
 $version,
 $table_prefix,
 $usertable_prefix,
) {

 #Got Unknow function don't know how to fix that. Will see later
 validate_string($db_name,$db_host,$db_user,$db_password,$phplist_owner,$phplist_group)

  package { 'phplist':
    ensure => $version,
  }

  file { 'config.php':
    path => "${install_dir}/public_html/lists/config/config.php",
    owner => $phplist_owner,
    group => $phplist_group,
    replace => false,
    content => template('phplist/config.php.erb'),
    require => Package['phplist'],
  }

}
