require 'spec_helper'

describe 'phplist::app', :type => :class do
let(:constant_parameter_defaults) do 
	{
		:db_name => 'phplist',
		:db_host => 'localhost',
		:db_user => 'phplist',
		:db_password => 'phplist',
		:phplist_owner => 'root',
		:phplist_group => 'root',
	 	:version => '2.10.19',
		:table_prefix => 'phplist_',
                :usertable_prefix => 'phplist_user_',
		:install_dir => '/var/www/html/newsletter/public_html/lists/config',
                :installation_name => 'newsletter',
                :pageroot => '/lists',
	} 
end
 context "standard conditions" do 
	let :params do
	 constant_parameter_defaults
	end


	 it { should contain_file('install_dir').with(
	      :path => "#{params[:install_dir]}",
	      :ensure => 'directory',
	      :owner => 'root',
	      :group => 'root'
	 )}

	 it { should contain_package('phplist').with(
	      :ensure => "#{params[:version]}",
	      :require => 'File[install_dir]'
	  ) }

	# TODO : Need to test the content with the sample in mysql module  mysql/spec/classes/mysql_config_spec.rb line 155.
	 it { should contain_file('config.php').with(
		 :path => "#{params[:install_dir]}/config.php",
		 :owner => 'root',
		 :group => 'root',
		 :replace => 'false',
		 :require => 'File[install_dir]'
	 )}

         context 'for the template file' do
		 it do 
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
end
