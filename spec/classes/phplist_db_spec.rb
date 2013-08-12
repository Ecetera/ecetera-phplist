require 'spec_helper'

describe 'phplist::db', :type => :class do
  let(:params) do 
    {
      :database_name => 'phplist',
      :database_host => 'localhost',
      :database_user => 'phplist',
      :database_password => 'phplist',
      :create_db => true,
      :create_db_user => true,
      :privileges => ['Select_priv', 'Insert_priv', 'Update_priv', 'Delete_priv','Create_priv'],
    } 
  end

  # Should test the presence of validate function
  it 'should create database  when create_db is true' do
    if params[:create_db]
      should contain_database(params[:database_name]).with(
        :ensure => 'present'
      )
    end 
  end
  # Need to find a way to test the password hash 
  it 'should create the database user and set the privileges' do
    if params[:create_db_user]
      should contain_database_user("#{params[:database_user]}@#{params[:database_host]}").with(
        :ensure => 'present'
      )
      should contain_database_grant("#{params[:database_user]}@#{params[:database_host]}").with(
        :privileges => "#{params[:privileges]}",
        :require => "Database_user[#{params[:database_user]}@#{params[:database_host]}]"
      )
    end 
  end

end
