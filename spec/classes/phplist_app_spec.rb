require 'spec_helper'

describe 'phplist::app', :type => :class do
let(:params) { 
	{
		:install_dir => '/var/www/html/phplist', 
		:install_url => 'http://sourceforge.net/projects/phplist/files/phplist/',
		:db_name => 'phplist',
		:db_host => 'localhost',
		:db_user => 'phplist',
		:db_password => 'phplist',
		:phplist_owner => 'root',
		:phplist_group => 'root',
	 	:version => '2.10.19',
		:installation_name => 'phplist',
		:table_prefix => 'phplist_',
                :usertable_prefix => 'phplist_user_',
		:pageroot => '/lists',
	} 
}


 it { should contain_file('/var/www/html/phplist').with(
      :recurse => true,
      :ensure => 'directory'
    ) }

 it { should contain_package('phplist').with(
      :ensure => '2.10.19' 
  ) }

 it { should contain_file('config.php').with(
                 :name => '/var/www/html/phplist/public_html/lists/config/config.php',
		 :owner => 'root',
		 :group => 'root',
                 :content => "template('phplist/config.php.erb')",
                 :repace => 'false',
                 :require => "Package['phplist']"
 )}
     
end
