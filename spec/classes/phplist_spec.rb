require 'spec_helper'

describe 'phplist', :type => :class do
let(:params) { 
	{
		:create_db  => true,
		:create_db_user => true,
		:db_name => 'phplist',
		:db_host => 'localhost',
		:db_user => 'phplist',
		:db_password => 'phplist',
		:phplist_owner => 'root',
		:phplist_group => 'root',
                :table_prefix => 'phplist_',
		:installation_name => 'newsletter',
                :pageroot => '/lists',
                :multisite => true,
		:version => '2.10.5',
                :release => '1',
                :adminpages => '/lists/admin',
	} 
}
 context 'standard conditions' do
	it { should contain_class('phplist') }

	end
 end
