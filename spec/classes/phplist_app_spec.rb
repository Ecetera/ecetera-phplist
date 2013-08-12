require 'spec_helper'

describe 'phplist::app', :type => :class do

  context "standard conditions phplist 2.10.5-1" do 
    let(:constant_parameter_defaults) do 
      {
        :multisite => false,
        :database_name => 'phplist',
        :database_host => 'localhost',
        :database_user => 'phplist',
        :database_password => 'phplist',
        :phplist_owner => 'root',
        :phplist_group => 'root',
        :version => '2.10.5',
        :release => '1',
        :table_prefix => 'phplist_',
        :usertable_prefix => 'phplist_user_',
        :install_dir => '/phplist-2.10.5/public_html/lists/config',
        :config_dir => '/var/www/',
        :installation_name => 'newsletter',
        :pageroot => '/lists',
        :adminpages => '/lists/admin',
        :install_type => 'rpm',
        :url => 'http://sourceforge.net/projects/phplist/files/phplist'

      } 
    end
    # parameters from param.pp
    language_module = 'english.inc'
    bounce_protocol = 'pop'
    bounce_mailbox_host = 'localhost'
    bounce_mailbox_user = 'popuser'
    bounce_mailbox_password = 'password'
    bounce_mailbox_port = '110/pop3/notls'
    bounce_mailbox = '/var/spool/mail/listbounces'
    bounce_mailbox_purge = 1
    bounce_mailbox_purge_unprocessed = 1
    bounce_unsubscribe_threshold = 5
    require_login = 1
    commandline_users = 'array\(\)'
    blacklist_gracetime = 5
    check_for_host = 0
    userhistory_systeminfo = 'array\(\'HTTP_USER_AGENT\',\'HTTP_REFERER\',\'REMOTE_ADDR\'\)'
    attachment_repository = '/tmp'
    export_mimetype = 'application/csv'
    tmpdir = '/tmp'
    database_module = 'mysql.inc'
    error_level = 'error_reporting\(0\)'

    let :params do
      constant_parameter_defaults
    end


    it 'should install the package and set the configuration file' do
      if ! params[:multisite]
        should contain_package('phplist').with(
          :ensure => "#{params[:version]}-#{params[:release]}"
        )
        should contain_file('config.php').with(
          :path => "#{params[:install_dir]}/config.php",
          :owner => 'root',
          :group => 'root',
          :replace => 'true',
          :require => 'Package[phplist]'
        )
      end 
    end

    it "should contain a custom config.php" do 
      should contain_file('config.php').with_content(/\$language_module = \"#{language_module}\";/)
      should contain_file('config.php').with_content(/\$database_host = \"#{params[:database_host]}\";/)
      should contain_file('config.php').with_content(/\$database_name = \"#{params[:database_name]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:database_user]}\";/)
      should contain_file('config.php').with_content(/\$database_password = \"#{params[:database_password]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:database_user]}\";/)
      should contain_file('config.php').with_content(/\$installation_name = \"#{params[:installation_name]}\";/)
      should contain_file('config.php').with_content(/\$table_prefix = \"#{params[:table_prefix]}\";/)
      should contain_file('config.php').with_content(/\$usertable_prefix = \"#{params[:usertable_prefix]}\";/)
      should contain_file('config.php').with_content(/\$pageroot = \"#{params[:pageroot]}\";/)
      should contain_file('config.php').with_content(/\$adminpages = \"#{params[:adminpages]}\";/)
      should contain_file('config.php').with_content(/\$bounce_protocol = \"#{bounce_protocol}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_host = \"#{bounce_mailbox_host}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_user = \"#{bounce_mailbox_user}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_password = \"#{bounce_mailbox_password}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_port = \"#{bounce_mailbox_port}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox = \"#{bounce_mailbox}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_purge = \"#{bounce_mailbox_purge}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_purge_unprocessed = \"#{bounce_mailbox_purge_unprocessed}\";/)
      should contain_file('config.php').with_content(/\$bounce_unsubscribe_threshold = \"#{bounce_unsubscribe_threshold}\";/)
      should contain_file('config.php').with_content(/\$require_login = \"#{require_login}\";/)
      should contain_file('config.php').with_content(/\$commandline_users = \"#{commandline_users}\";/)
      should contain_file('config.php').with_content(/\$blacklist_gracetime = \"#{blacklist_gracetime}\";/)
      should contain_file('config.php').with_content(/\$check_for_host = \"#{check_for_host}\";/)
      should contain_file('config.php').with_content(/\$userhistory_systeminfo = \"#{userhistory_systeminfo}\";/)
      should contain_file('config.php').with_content(/\$attachment_repository = \"#{attachment_repository}\";/)
      should contain_file('config.php').with_content(/\$export_mimetype = \"#{export_mimetype}\";/)
      should contain_file('config.php').with_content(/\$tmpdir = \"#{tmpdir}\";/)
      should contain_file('config.php').with_content(/\$database_module = \"#{database_module}\";/)
      should contain_file('config.php').with_content(/\$error_level = \"#{error_level}\";/)





    end
  end

  context "install phplist 2.11.9-1 RPM" do
    let(:constant_parameter_defaults) do 
      {
        :multisite => false,
        :database_name => 'phplist',
        :database_host => 'localhost',
        :database_user => 'phplist',
        :database_password => 'phplist',
        :phplist_owner => 'root',
        :phplist_group => 'root',
        :version => '2.11.9',
        :release => '1',
        :table_prefix => 'phplist_',
        :usertable_prefix => 'phplist_user_',
        :install_dir => '/phplist-2.11.9/public_html/lists/config',
        :install_type => 'rpm',
        :config_dir => '/var/www/',
        :installation_name => 'newsletter',
        :pageroot => '/lists',
        :install_type => 'rpm',
        :url => 'http://sourceforge.net/projects/phplist/files/phplist'

      } 
    end
    let :params do
      constant_parameter_defaults
    end
    # parameters from param.pp
    language_module = 'english.inc'
    bounce_protocol = 'pop'
    bounce_mailbox_host = 'localhost'
    bounce_mailbox_user = 'popuser'
    bounce_mailbox_password = 'password'
    bounce_mailbox_port = '110/pop3/notls'
    bounce_mailbox = '/var/spool/mail/listbounces'
    bounce_mailbox_purge = 1
    bounce_mailbox_purge_unprocessed = 1
    bounce_unsubscribe_threshold = 5
    require_login = 1
    commandline_users = 'array\(\)'
    blacklist_gracetime = 5
    check_for_host = 0
    userhistory_systeminfo = 'array\(\'HTTP_USER_AGENT\',\'HTTP_REFERER\',\'REMOTE_ADDR\'\)'
    allowed_referrers = 'array\(\)'
    attachment_repository = '/tmp'
    export_mimetype = 'application/csv'
    tmpdir = '/tmp'
    database_module = 'mysql.inc'
    adodb_driver = 'mysql'
    error_level = 'error_reporting\(0\)'
    it 'should install the package and set the configuration file' do
      if ! params[:multisite]
        should contain_package('phplist').with(
          :ensure => "#{params[:version]}-#{params[:release]}"
        )
        should contain_file('config.php').with(
          :path => "#{params[:install_dir]}/config.php",
          :owner => 'root',
          :group => 'root',
          :replace => 'true',
          :require => 'Package[phplist]'
        )
      end 
    end

    it "should contain a custom config.php without adminpages variables" do 
      should contain_file('config.php').with_content(/\$database_host = \"#{params[:database_host]}\";/)
      should contain_file('config.php').with_content(/\$database_name = \"#{params[:database_name]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:database_user]}\";/)
      should contain_file("config.php").with_content(/\$database_password = \"#{params[:database_password]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:database_user]}\";/)
      should contain_file("config.php").with_content(/\$installation_name = \"#{params[:installation_name]}\";/)
      should contain_file('config.php').with_content(/\$table_prefix = \"#{params[:table_prefix]}\";/)
      should contain_file('config.php').with_content(/\$usertable_prefix = \"#{params[:usertable_prefix]}\";/)
      should contain_file('config.php').with_content(/\$pageroot = \"#{params[:pageroot]}\";/)
      should contain_file('config.php').with_content(/\$bounce_protocol = \"#{bounce_protocol}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_host = \"#{bounce_mailbox_host}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_user = \"#{bounce_mailbox_user}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_password = \"#{bounce_mailbox_password}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_port = \"#{bounce_mailbox_port}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox = \"#{bounce_mailbox}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_purge = \"#{bounce_mailbox_purge}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_purge_unprocessed = \"#{bounce_mailbox_purge_unprocessed}\";/)
      should contain_file('config.php').with_content(/\$bounce_unsubscribe_threshold = \"#{bounce_unsubscribe_threshold}\";/)
      should contain_file('config.php').with_content(/\$require_login = \"#{require_login}\";/)
      should contain_file('config.php').with_content(/\$commandline_users = \"#{commandline_users}\";/)
      should contain_file('config.php').with_content(/\$blacklist_gracetime = \"#{blacklist_gracetime}\";/)
      should contain_file('config.php').with_content(/\$check_for_host = \"#{check_for_host}\";/)
      should contain_file('config.php').with_content(/\$userhistory_systeminfo = \"#{userhistory_systeminfo}\";/)
      should contain_file('config.php').with_content(/\$allowed_referrers = \"#{allowed_referrers}\";/)
      should contain_file('config.php').with_content(/\$attachment_repository = \"#{attachment_repository}\";/)
      should contain_file('config.php').with_content(/\$export_mimetype = \"#{export_mimetype}\";/)
      should contain_file('config.php').with_content(/\$tmpdir = \"#{tmpdir}\";/)
      should contain_file('config.php').with_content(/\$database_module = \"#{database_module}\";/)
      should contain_file('config.php').with_content(/\$adodb_driver = \"#{adodb_driver}\";/)
      should contain_file('config.php').with_content(/\$error_level = \"#{error_level}\";/)
    end
    ##		    should contain_file('install_dir').with(
    ##			:path => "#{params[:install_dir]}",
    ##			:ensure => 'directory',
    ##			:owner => 'root',
    ##			:group => 'root'
    ##			)	
    #		    should contain_package('phplist').with(
    #		        :ensure => "#{params[:version]}",
    #		         :require => 'File[install_dir]'
    #		        )
    #		    should contain_file('config.php').with(
    #				    :path => "#{params[:install_dir]}/config.php",
    #				    :owner => 'root',
    #				    :group => 'root',
    #				    :replace => 'false',
    #				    :require => 'File[install_dir]'
    #				    )
  end

  context "standard conditions for phplist 2.11.9-1 install the tar version" do
    let(:constant_parameter_defaults) do 
      {
        :multisite => false,
        :database_name => 'phplist',
        :database_host => 'localhost',
        :database_user => 'phplist',
        :database_password => 'phplist',
        :phplist_owner => 'root',
        :phplist_group => 'root',
        :version => '2.11.9',
        :release => '1',
        :table_prefix => 'phplist_',
        :usertable_prefix => 'phplist_user_',
        :install_dir => '/var/www',
        :config_dir => '/var/www',
        :installation_name => 'newsletter',
        :pageroot => 'lists',
        :adminpages => '/lists/admin',
        :install_type => 'tar',
        :url => 'http://sourceforge.net/projects/phplist/files/phplist'

      } 
    end
    let :params do
      constant_parameter_defaults
    end
    # parameters from param.pp
    language_module = 'english.inc'
    bounce_protocol = 'pop'
    bounce_mailbox_host = 'localhost'
    bounce_mailbox_user = 'popuser'
    bounce_mailbox_password = 'password'
    bounce_mailbox_port = '110/pop3/notls'
    bounce_mailbox = '/var/spool/mail/listbounces'
    bounce_mailbox_purge = 1
    bounce_mailbox_purge_unprocessed = 1
    bounce_unsubscribe_threshold = 5
    require_login = 1
    commandline_users = 'array\(\)'
    blacklist_gracetime = 5
    check_for_host = 0
    userhistory_systeminfo = 'array\(\'HTTP_USER_AGENT\',\'HTTP_REFERER\',\'REMOTE_ADDR\'\)'
    allowed_referrers = 'array\(\)'
    attachment_repository = '/tmp'
    export_mimetype = 'application/csv'
    tmpdir = '/tmp'
    database_module = 'mysql.inc'
    adodb_driver = 'mysql'
    error_level = 'error_reporting\(0\)'
    it 'should install the archive and set the configuration file' do
      if ! params[:multisite]
        case 
        when params[:install_type] == 'tar'


          should contain_archive("phplist-#{params[:version]}").with(
            :ensure => 'present',
              :url => "#{params[:url]}"
          )

          should contain_file('config.php').with(
            :path => "#{params[:config_dir]}/config.php",
            :owner => 'root',
            :group => 'root',
            :replace => 'true',
            :require => "Archive[phplist-#{params[:version]}]"
          )
        end
      end 
    end

    it "should contain a custom config.php without adminpages variables" do 
      should contain_file('config.php').with_content(/\$database_host = \"#{params[:database_host]}\";/)
      should contain_file('config.php').with_content(/\$database_name = \"#{params[:database_name]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:database_user]}\";/)
      should contain_file("config.php").with_content(/\$database_password = \"#{params[:database_password]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:database_user]}\";/)
      should contain_file('config.php').with_content(/\$installation_name = \"#{params[:installation_name]}\";/)
      should contain_file('config.php').with_content(/\$table_prefix = \"#{params[:table_prefix]}\";/)
      should contain_file('config.php').with_content(/\$usertable_prefix = \"#{params[:usertable_prefix]}\";/)
      should contain_file('config.php').with_content(/\$pageroot = \"#{params[:pageroot]}\";/)
      should contain_file('config.php').with_content(/\$bounce_protocol = \"#{bounce_protocol}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_host = \"#{bounce_mailbox_host}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_user = \"#{bounce_mailbox_user}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_password = \"#{bounce_mailbox_password}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_port = \"#{bounce_mailbox_port}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox = \"#{bounce_mailbox}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_purge = \"#{bounce_mailbox_purge}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_purge_unprocessed = \"#{bounce_mailbox_purge_unprocessed}\";/)
      should contain_file('config.php').with_content(/\$bounce_unsubscribe_threshold = \"#{bounce_unsubscribe_threshold}\";/)
      should contain_file('config.php').with_content(/\$require_login = \"#{require_login}\";/)
      should contain_file('config.php').with_content(/\$commandline_users = \"#{commandline_users}\";/)
      should contain_file('config.php').with_content(/\$blacklist_gracetime = \"#{blacklist_gracetime}\";/)
      should contain_file('config.php').with_content(/\$check_for_host = \"#{check_for_host}\";/)
      should contain_file('config.php').with_content(/\$userhistory_systeminfo = \"#{userhistory_systeminfo}\";/)
      should contain_file('config.php').with_content(/\$allowed_referrers = \"#{allowed_referrers}\";/)
      should contain_file('config.php').with_content(/\$attachment_repository = \"#{attachment_repository}\";/)
      should contain_file('config.php').with_content(/\$export_mimetype = \"#{export_mimetype}\";/)
      should contain_file('config.php').with_content(/\$tmpdir = \"#{tmpdir}\";/)
      should contain_file('config.php').with_content(/\$database_module = \"#{database_module}\";/)
      should contain_file('config.php').with_content(/\$adodb_driver = \"#{adodb_driver}\";/)
      should contain_file('config.php').with_content(/\$error_level = \"#{error_level}\";/)
    end
  end
  context "standard conditions for phplist 2.11.9-1 using default value of install_type" do
    let(:constant_parameter_defaults) do 
      {
        :multisite => false,
        :database_name => 'phplist',
        :database_host => 'localhost',
        :database_user => 'phplist',
        :database_password => 'phplist',
        :phplist_owner => 'root',
        :phplist_group => 'root',
        :version => '2.11.9',
        :release => '1',
        :table_prefix => 'phplist_',
        :usertable_prefix => 'phplist_user_',
        :install_dir => '/var/www',
        :config_dir => '/var/www',
        :installation_name => 'newsletter',
        :pageroot => 'lists',
        :adminpages => '/lists/admin',
        :install_type => 'tar',
        :url => 'http://sourceforge.net/projects/phplist/files/phplist'

      } 
    end
    let :params do
      constant_parameter_defaults
    end
    # parameters from param.pp
    language_module = 'english.inc'
    bounce_protocol = 'pop'
    bounce_mailbox_host = 'localhost'
    bounce_mailbox_user = 'popuser'
    bounce_mailbox_password = 'password'
    bounce_mailbox_port = '110/pop3/notls'
    bounce_mailbox = '/var/spool/mail/listbounces'
    bounce_mailbox_purge = 1
    bounce_mailbox_purge_unprocessed = 1
    bounce_unsubscribe_threshold = 5
    require_login = 1
    commandline_users = 'array\(\)'
    blacklist_gracetime = 5
    check_for_host = 0
    userhistory_systeminfo = 'array\(\'HTTP_USER_AGENT\',\'HTTP_REFERER\',\'REMOTE_ADDR\'\)'
    allowed_referrers = 'array\(\)'
    attachment_repository = '/tmp'
    export_mimetype = 'application/csv'
    tmpdir = '/tmp'
    database_module = 'mysql.inc'
    adodb_driver = 'mysql'
    error_level = 'error_reporting\(0\)'
    it 'should install the archive and set the configuration file' do
      if ! params[:multisite]

          should contain_archive("phplist-#{params[:version]}").with(
            :ensure => 'present',
              :url => "#{params[:url]}"
          )

          should contain_file('config.php').with(
            :path => "#{params[:config_dir]}/config.php",
            :owner => 'root',
            :group => 'root',
            :replace => 'true',
            :require => "Archive[phplist-#{params[:version]}]"
          )
      end 
    end

    it "should contain a custom config.php without adminpages variables" do 
      should contain_file('config.php').with_content(/\$database_host = \"#{params[:database_host]}\";/)
      should contain_file('config.php').with_content(/\$database_name = \"#{params[:database_name]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:database_user]}\";/)
      should contain_file("config.php").with_content(/\$database_password = \"#{params[:database_password]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:database_user]}\";/)
      should contain_file('config.php').with_content(/\$installation_name = \"#{params[:installation_name]}\";/)
      should contain_file('config.php').with_content(/\$table_prefix = \"#{params[:table_prefix]}\";/)
      should contain_file('config.php').with_content(/\$usertable_prefix = \"#{params[:usertable_prefix]}\";/)
      should contain_file('config.php').with_content(/\$pageroot = \"#{params[:pageroot]}\";/)
      should contain_file('config.php').with_content(/\$bounce_protocol = \"#{bounce_protocol}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_host = \"#{bounce_mailbox_host}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_user = \"#{bounce_mailbox_user}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_password = \"#{bounce_mailbox_password}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_port = \"#{bounce_mailbox_port}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox = \"#{bounce_mailbox}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_purge = \"#{bounce_mailbox_purge}\";/)
      should contain_file('config.php').with_content(/\$bounce_mailbox_purge_unprocessed = \"#{bounce_mailbox_purge_unprocessed}\";/)
      should contain_file('config.php').with_content(/\$bounce_unsubscribe_threshold = \"#{bounce_unsubscribe_threshold}\";/)
      should contain_file('config.php').with_content(/\$require_login = \"#{require_login}\";/)
      should contain_file('config.php').with_content(/\$commandline_users = \"#{commandline_users}\";/)
      should contain_file('config.php').with_content(/\$blacklist_gracetime = \"#{blacklist_gracetime}\";/)
      should contain_file('config.php').with_content(/\$check_for_host = \"#{check_for_host}\";/)
      should contain_file('config.php').with_content(/\$userhistory_systeminfo = \"#{userhistory_systeminfo}\";/)
      should contain_file('config.php').with_content(/\$allowed_referrers = \"#{allowed_referrers}\";/)
      should contain_file('config.php').with_content(/\$attachment_repository = \"#{attachment_repository}\";/)
      should contain_file('config.php').with_content(/\$export_mimetype = \"#{export_mimetype}\";/)
      should contain_file('config.php').with_content(/\$tmpdir = \"#{tmpdir}\";/)
      should contain_file('config.php').with_content(/\$database_module = \"#{database_module}\";/)
      should contain_file('config.php').with_content(/\$adodb_driver = \"#{adodb_driver}\";/)
      should contain_file('config.php').with_content(/\$error_level = \"#{error_level}\";/)
    end
  end
end

