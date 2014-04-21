require 'spec_helper'

describe 'tram deployment' do

  describe file("/etc/init/tram.conf") do
    it { should be_file }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    its(:content) { should match /\/home\/tram\/tram/ }
  end

  describe service('tram') do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('curl -v http://localhost:7040/') do
    its(:stdout) { should match /HTTP\/1.1 404/ }
  end

  describe file("/var/log/upstart/tram.log") do
    it { should be_file }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    its(:content) { should match /\[martini\] Completed 404 Not Found/ }
  end

  describe port(7040) do
    it { should be_listening }
  end

end
