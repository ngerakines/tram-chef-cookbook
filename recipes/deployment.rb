#
# Cookbook Name:: tram
# Recipe:: deployment
#
# Copyright (C) 2014 Nick Gerakines <nick@gerakines.net>
# 
# This project and its contents are open source under the MIT license.
#

cookbook_file '/etc/init.d/tram' do
  source 'tram'
  mode 00777
  owner 'root'
  group 'root'
end

service 'tram' do
  provider Chef::Provider::Service::Init
  action [:start]
end
