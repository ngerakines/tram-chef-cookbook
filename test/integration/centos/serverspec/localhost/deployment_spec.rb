require 'spec_helper'

describe 'tram deployment' do

  describe file("/etc/init/tram.conf") do
    it { should be_file }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    its(:content) { should match /\/home\/tram\/tram/ }
  end

  describe port(7040) do
    it { should be_listening }
  end

end
