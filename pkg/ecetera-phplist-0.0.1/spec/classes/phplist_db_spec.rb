require 'spec_helper'

describe 'phplist::db', :type => :class do
let(:params) do 
	{
		:db_name => 'phplist',
		:db_host => 'localhost',
		:db_user => 'phplist',
		:db_password => 'phplist',
		:table_prefix => 'phplist_',
                :usertable_prefix => 'phplist_user_',
                :create_db => true,
                :create_db_user => true,
	} 
end

# Should test the presence of validate function
	it 'should create database  when create_db is true' do
		if params[:create_db]
		 should contain_database('phplist').with(
                    :ensure => 'present'
                )
		end 
         end
        # Need to find a way to test the password hash 
	it 'should  database user and with db_password as value when create_db_user is true' do
		if params[:create_db_user]
		 should contain_database_user("#{params[:db_user]}@#{params[:db_host]}").with(
                    :ensure => 'present'
                )
		end 
         end
end
