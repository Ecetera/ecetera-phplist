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
 $install_dir,
 $installation_name,
 $pageroot,
) {

 #Got Unknow function don't know how to fix that. Will see later
 validate_string($db_name,$db_host,$db_user,$db_password,$phplist_owner,$phplist_group,$install_dir,$installation_name,$pageroot)


  file { 'install_dir':
      path    => "${install_dir}",
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
  }
      
  package { 'phplist':
    ensure  => $version,
    require => File['install_dir'],
  }

  file { 'config.php':
    path => "${install_dir}/config.php",
    owner => $phplist_owner,
    group => $phplist_group,
    replace => false,
    content => template('phplist/config.php.erb'),
    require => File['install_dir']
  }

}
