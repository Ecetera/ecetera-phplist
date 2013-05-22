require 'spec_helper'

describe 'phplist', :type => :class do
let(:params) { 
	{
		:install_dir => '/var/www/html/phplist', 
		:install_url => 'http://www.phplist.com/download',
		:created_db  => 'true',
		:created_db_user => 'true',
		:db_name => 'phplist',
		:db_host => 'localhost',
		:db_user => 'phplist',
		:db_password => 'phplist',
		:phplist_owner => 'root',
		:phplist_group => 'root',
	} 
}
it { should contain_class('phplist') }

end
