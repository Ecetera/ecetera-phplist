class phplist::app (
 $multisite,
 $db_name,
 $db_host,
 $db_user,
 $db_password,
 $phplist_owner,
 $phplist_group,
 $version,
 $release,
 $table_prefix,
 $usertable_prefix,
 $install_dir,
 $config_dir,
 $installation_name,
 $pageroot,
 $adminpages,
 $install_type,
 $url,
) {
 validate_bool($multisite)
 validate_string($db_name,$db_host,$db_user,$db_password,$phplist_owner,$phplist_group,$install_dir,$installation_name,$pageroot,$adminpages,$install_type,$url,$config_dir)
 # TODO : validte the release as number

 if $multisite { 
   file { 'install_dir':
     path    => "${install_dir}",
     ensure  => 'directory',
     owner   => 'root',
     group   => 'root',
   }

   package { 'phplist':
     ensure  => "${version}-${release}",
   }

   file { 'config.php':
     path => "${install_dir}/config.php",
     owner => $phplist_owner,
     group => $phplist_group,
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
              require => File['install_dir'],
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
            archive { 'phplist':
              ensure  => 'present',
              url     => $url,
              target  => $install_dir,
              require => File['install_dir'],
            }
            file { 'config.php':
              path    => "${install_dir}/config.php",
                      owner   => $phplist_owner,
                      group   => $phplist_group,
                      replace => true,
                      content => template("phplist/config.php-${version}-${release}.erb"),
                      require => Archive['phplist'],
            }
      }
   }



 }

}
