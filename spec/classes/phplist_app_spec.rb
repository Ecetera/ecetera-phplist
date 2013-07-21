require 'spec_helper'

describe 'phplist::app', :type => :class do

  context "standard conditions phplist 2.10.5-1" do 
    let(:constant_parameter_defaults) do 
      {
        :multisite => false,
        :db_name => 'phplist',
        :db_host => 'localhost',
        :db_user => 'phplist',
        :db_password => 'phplist',
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
      should contain_file('config.php').with_content(/\$database_host = \"#{params[:db_host]}\";/)
      should contain_file('config.php').with_content(/\$database_name = \"#{params[:db_name]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:db_user]}\";/)
      should contain_file('config.php').with_content(/\$database_password = \'#{params[:db_password]}\';/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:db_user]}\";/)
      should contain_file('config.php').with_content(/\$installation_name = \'#{params[:installation_name]}\';/)
      should contain_file('config.php').with_content(/\$table_prefix = \"#{params[:table_prefix]}\";/)
      should contain_file('config.php').with_content(/\$usertable_prefix = \"#{params[:usertable_prefix]}\";/)
      should contain_file('config.php').with_content(/\$pageroot = \'#{params[:pageroot]}\';/)
      should contain_file('config.php').with_content(/\$adminpages = \'#{params[:adminpages]}\';/)
    end
  end

  context "install phplist 2.11.9-1 RPM" do
    let(:constant_parameter_defaults) do 
      {
        :multisite => false,
        :db_name => 'phplist',
        :db_host => 'localhost',
        :db_user => 'phplist',
        :db_password => 'phplist',
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
        :adminpages => '/lists/admin',
        :install_type => 'rpm',
        :url => 'http://sourceforge.net/projects/phplist/files/phplist'

      } 
    end
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

    it "should contain a custom config.php without adminpages variables" do 
      should contain_file('config.php').with_content(/\$database_host = \"#{params[:db_host]}\";/)
      should contain_file('config.php').with_content(/\$database_name = \"#{params[:db_name]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:db_user]}\";/)
      should contain_file('config.php').with_content(/\$database_password = \'#{params[:db_password]}\';/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:db_user]}\";/)
      should contain_file('config.php').with_content(/\$installation_name = \'#{params[:installation_name]}\';/)
      should contain_file('config.php').with_content(/\$table_prefix = \"#{params[:table_prefix]}\";/)
      should contain_file('config.php').with_content(/\$usertable_prefix = \"#{params[:usertable_prefix]}\";/)
      should contain_file('config.php').with_content(/\$pageroot = \'#{params[:pageroot]}\';/)
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
        :db_name => 'phplist',
        :db_host => 'localhost',
        :db_user => 'phplist',
        :db_password => 'phplist',
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
      should contain_file('config.php').with_content(/\$database_host = \"#{params[:db_host]}\";/)
      should contain_file('config.php').with_content(/\$database_name = \"#{params[:db_name]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:db_user]}\";/)
      should contain_file('config.php').with_content(/\$database_password = \'#{params[:db_password]}\';/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:db_user]}\";/)
      should contain_file('config.php').with_content(/\$installation_name = \'#{params[:installation_name]}\';/)
      should contain_file('config.php').with_content(/\$table_prefix = \"#{params[:table_prefix]}\";/)
      should contain_file('config.php').with_content(/\$usertable_prefix = \"#{params[:usertable_prefix]}\";/)
      should contain_file('config.php').with_content(/\$pageroot = \'#{params[:pageroot]}\';/)
    end
  end
  context "standard conditions for phplist 2.11.9-1 using default value of install_type" do
    let(:constant_parameter_defaults) do 
      {
        :multisite => false,
        :db_name => 'phplist',
        :db_host => 'localhost',
        :db_user => 'phplist',
        :db_password => 'phplist',
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
      should contain_file('config.php').with_content(/\$database_host = \"#{params[:db_host]}\";/)
      should contain_file('config.php').with_content(/\$database_name = \"#{params[:db_name]}\";/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:db_user]}\";/)
      should contain_file('config.php').with_content(/\$database_password = \'#{params[:db_password]}\';/)
      should contain_file('config.php').with_content(/\$database_user = \"#{params[:db_user]}\";/)
      should contain_file('config.php').with_content(/\$installation_name = \'#{params[:installation_name]}\';/)
      should contain_file('config.php').with_content(/\$table_prefix = \"#{params[:table_prefix]}\";/)
      should contain_file('config.php').with_content(/\$usertable_prefix = \"#{params[:usertable_prefix]}\";/)
      should contain_file('config.php').with_content(/\$pageroot = \'#{params[:pageroot]}\';/)
    end
  end
end

