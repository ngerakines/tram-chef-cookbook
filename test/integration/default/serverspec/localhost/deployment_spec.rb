require 'spec_helper'

describe 'tram deployment' do

  describe file("/etc/init/tram.conf") do
    it { should be_file }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    its(:content) { should match /\/home\/tram\/tram/ }
  end

  it 'should be running the tram service' do
    expect(service 'tram').to be_running
    expect(service 'tram').to be_enabled
  end

  describe file("/var/log/upstart/tram.log") do
    it { should be_file }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
  end

  it "is listening on port 3000" do
    expect(port(3000)).to be_listening
  end

end
