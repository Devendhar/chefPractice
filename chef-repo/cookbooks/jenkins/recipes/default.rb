#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'java'
include_recipe 'jenkins::maven'
include_recipe 'jenkins::tomcat'
