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
	} 
end


let :params do
 constant_parameter_defaults
end

 it { should contain_package('phplist').with(
      :ensure => "#{params[:version]}" 
  ) }

# TODO : Need to test the content with the sample in mysql module  mysql/spec/classes/mysql_config_spec.rb line 155.
 it { should contain_file('config.php').with(
	 :path => "#{params[:install_dir]}/public_html/lists/config/config.php",
	 :owner => 'root',
	 :group => 'root',
	 :replace => 'false',
	 :require => 'Package[phplist]'
 )}
     
end
