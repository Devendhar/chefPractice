#
# Cookbook:: openMRS
# Recipe:: tomcat
#
# Copyright:: 2016, The Authors, All Rights Reserved.

tomcat_packageName = node['installation']['appserver']

package tomcat_packageName do
	action :install
end

service tomcat_packageName do
	action [:enable, :start]
end

template node['appserver']['userauthfile'] do
	source 'tomcat-users.erb'
	mode '0640'
	owner 'root'
#	group 'tomcat'
	action :create
	notifies :restart, "service[#{tomcat_packageName}]"
end

package node['appserver']['additionalPackages'] do
	action :install
	notifies :restart, "service[#{tomcat_packageName}]"
end

cookbook_file node['appserver']['warlocation'] do
	source 'openmrs.war'
	mode '0664'
	owner 'root'
#	group 'tomcat'
	action :create
end

