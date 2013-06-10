require 'spec_helper'

describe 'phplist::db', :type => :class do
let(:params) do 
	{
		:db_name => 'phplist',
		:db_host => 'localhost',
		:db_user => 'phplist',
		:db_password => 'phplist',
                :create_db => true,
                :create_db_user => true,
                :privileges => ['Select_priv', 'Insert_priv', 'Update_priv', 'Delete_priv','Create_priv'],
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
	it 'should create the database user and set the privileges' do
		if params[:create_db_user]
		 should contain_database_user("#{params[:db_user]}@#{params[:db_host]}").with(
                    :ensure => 'present'
                )
		  should contain_database_grant("#{params[:db_user]}@#{params[:db_host]}").with(
		     :privileges => "#{params[:privileges]}",
                     :require => "Database_user[#{params[:db_user]}@#{params[:db_host]}]"
		 )
		end 
         end

end
