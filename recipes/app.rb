#
# Cookbook Name:: tram
# Recipe:: app
#
# Copyright (C) 2014 Nick Gerakines <nick@gerakines.net>
# 
# This project and its contents are open source under the MIT license.
#

include_recipe 'apt'
include_recipe 'yum'

user 'tram' do
  username 'tram'
  home '/home/tram'
  action :remove
  action :create
  supports ({ :manage_home => true })
end

group 'tram' do
  group_name 'tram'
  members 'tram'
  action :remove
  action :create
end

case node[:tram][:install_type]
when 'package'

  package node[:tram][:package]

when 'archive'

  %w{unzip}.each do |pkg|
    package pkg
  end

  remote_file "#{Chef::Config[:file_cache_path]}/tram.zip" do
    source node[:tram][:package_source]
  end

  bash 'extract_app' do
    cwd '/home/tram/'
    code <<-EOH
      unzip #{Chef::Config[:file_cache_path]}/tram.zip
      EOH
    not_if { ::File.exists?('/home/tram/tram') }
  end

  execute 'chown -R tram:tram /home/tram/'

  file '/home/tram/tram' do
    mode 00777
  end

end
