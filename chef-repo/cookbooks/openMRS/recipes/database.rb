#
# Cookbook:: openMRS
# Recipe:: database
#
# Copyright:: 2016, The Authors, All Rights Reserved.

# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password 'redhat'
  action [:create, :start]
end

# Install the mysql2 Ruby gem which is used to connect to MYSQL.
mysql2_chef_gem 'default' do
  action :install
end

# Create the database instance.
mysql_database node['openmrs']['database']['dbname'] do
	connection(
		:host => node['openmrs']['database']['host'],
		:username => node['openmrs']['database']['username'],
		:password => node['openmrs']['database']['password']
	)
	action :create
end

#Add a database user.
mysql_database_user node['openmrs']['database']['admin_username'] do
	connection(
		:host => node['openmrs']['database']['host'],
		:username => node['openmrs']['database']['username'],
		:password => node['openmrs']['database']['password']
	)	
	password node['openmrs']['database']['admin_password']
	database_name node['openmrs']['database']['dbname']
	host  node['openmrs']['database']['host']
	action [:create, :grant]
end

# Create a path to the SQL file in the Chef cache.
create_tables_script_path = File.join(Chef::Config[:file_cache_path], 'create-tables.sql')

# Write the SQL script to the filesystem.
cookbook_file create_tables_script_path do
  source 'create-tables.sql'
  owner 'root'
  group 'root'
  mode '0600'
end

execute "initialize #{node['openmrs']['database']['dbname']} database" do
	command "mysql -h #{node['openmrs']['database']['host']} -u #{node['openmrs']['database']['admin_username']} -p#{node['openmrs']['database']['admin_password']} -D #{node['openmrs']['database']['dbname']} < #{create_tables_script_path}"
	not_if "mysql -h #{node['openmrs']['database']['host']} -u #{node['openmrs']['database']['admin_username']} -p#{node['openmrs']['database']['admin_password']} -D #{node['openmrs']['database']['dbname']} -e 'describe customers;'"
end
