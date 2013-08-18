class phplist::params {

$bounce_protocol = 'pop'
$bounce_mailbox_host = 'localhost'
$bounce_mailbox_user = 'popuser'
$bounce_mailbox_password = 'password'
$bounce_mailbox_port = '110/pop3/notls'
$bounce_mailbox = '/var/spool/mail/listbounces'
$bounce_mailbox_purge = 1
$bounce_mailbox_purge_unprocessed = 1
$bounce_unsubscribe_threshold = 5
$require_login = 1
$commandline_users = 'array()'
$blacklist_gracetime = 5
$check_for_host = 0
$allowed_referrers = 'array()'
$attachment_repository = '/tmp'
$export_mimetype = 'application/csv'
$tmpdir = '/tmp'
$database_module = 'mysql.inc'
$adodb_driver = 'mysql'
$error_level = 'error_reporting(0)'
$userhistory_systeminfo = 'array(\'HTTP_USER_AGENT\',\'HTTP_REFERER\',\'REMOTE_ADDR\')'
$language_module = 'english.inc'
}
