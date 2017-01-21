#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#osfamily=node[:platform_family]
#if osfamily == 'debian'
#	package_name="tomcat7"
#elsif osfamily == 'rhel'
#	package_name="tomcat6"
#else
#end

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
	source 'benefits.war'
	mode '0664'
	owner 'root'
#	group 'tomcat'
	action :create
end

