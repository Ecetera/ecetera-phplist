# == Class: phplist::db
#
# This module will install phplist newsletter database.
#
# === Parameters
#
# [*privileges*]
# Specifies the phplist database user privileges. Default: '['Select_priv', 'Insert_priv', 'Update_priv', 'Delete_priv','Create_priv']'
# === Variables
#
#
# [*database_host*]
# Specifies the database host to connect to. Default: 'localhost'

# [*database_user*]
# Specifies the database user. Default: 'phplist'

# [*database_password*]
# Specifies the database user's password in plaintext. Default: 'phplist'

# [*database_name*]
# Specifies the database name which the phplist module should be configured to use. Default: 'phplist'

# [*created_db*]
# Specifies whether to create the db or not. Default: 'true'

# [*created_db_user*]
# Specifies whether to create the db user oor not. Default: 'true'

class phplist::db (
  $create_db  = true,
  $create_db_user = true,
  $multisite = false,
  $database_name = 'phplist',
  $database_host = 'localhost',
  $database_user = 'phplist',
  $database_password = 'phplist',
  $privileges = ['Select_priv', 'Insert_priv', 'Update_priv', 'Delete_priv','Create_priv'],
) {

  validate_bool($create_db, $create_db_user)
  validate_string($database_name,$database_host,$database_user,$database_password)
  validate_array($privileges)

  ## Set up DB using puppetlabs-mysql defined type
  if $create_db {
    database { $database_name:
      ensure  => 'present',
    }
  }

  if $create_db_user {
    database_user { "${database_name}@${database_host}":
      ensure        => 'present',
      password_hash => mysql_password($database_password),
    }

    database_grant { "${database_name}@${database_host}":
      privileges => $privileges,
      require    => Database_user["${database_name}@${database_host}"]
    }

  }

}
