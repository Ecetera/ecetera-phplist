class phplist::db (
 $db_name,
 $db_host,
 $db_user,
 $db_password,
 $create_db,
 $create_db_user,
 $privileges,
) {

 validate_bool($create_db, $create_db_user)
 validate_string($db_name,$db_host,$db_user,$db_password)
 validate_array($privileges)

 ## Set up DB using puppetlabs-mysql defined type
 if $create_db {
   database { $db_name:
     ensure => 'present',
     require => Class['phplist::app'],
   }
 }

 if $create_db_user {
   database_user { "${db_name}@${db_host}":
     ensure => 'present',
     password_hash => mysql_password($db_password),
   }

   database_grant { "${db_name}@${db_host}":
     privileges => $privileges,
     require    => Database_user["${db_name}@${db_host}"]
   }

 }

}
