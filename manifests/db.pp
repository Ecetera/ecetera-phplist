class phplist::db (
 $db_name,
 $db_host,
 $db_user,
 $db_password,
 $create_db,
 $create_db_user,
) {

 validate_bool($create_db, $create_db_user)
 validate_string($db_name,$db_host,$db_user,$db_password)

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
     require => Class['phplist::app'],
   }
 }

}
