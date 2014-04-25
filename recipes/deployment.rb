#
# Cookbook Name:: tram
# Recipe:: deployment
#
# Copyright (C) 2014 Nick Gerakines <nick@gerakines.net>
# 
# This project and its contents are open source under the MIT license.
#

template "/etc/init/tram.conf" do
  source "tram-upstart.conf.erb"
  mode 0444
  owner "root"
  group "root"
  only_if { ::File.exists?("/etc/init/") }
end

service "tram" do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
  only_if { ::File.exists?("/etc/init/") }
end
