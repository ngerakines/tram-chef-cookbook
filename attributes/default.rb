
default[:tram][:platform] = 'amd64'

default[:tram][:version] = '0.1.0'
default[:tram][:install_type] = 'archive'
default[:tram][:package] = 'tram'
default[:tram][:package_source] = "https://github.com/ngerakines/tram/releases/download/v#{node[:tram][:version]}/tram-#{node[:tram][:version]}.linux_#{node[:tram][:platform]}.zip"
