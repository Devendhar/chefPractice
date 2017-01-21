#
# Cookbook:: openMRS
# Recipe:: default
#
# Copyright:: 2016, The Authors, All Rights Reserved.

include_recipe 'selinux::permissive'
include_recipe 'openMRS::tomcat'
include_recipe 'openMRS::database'
