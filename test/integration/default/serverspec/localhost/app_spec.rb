require "spec_helper"

describe "tram package" do

  it "should have a tram user" do
    expect(user "tram").to exist
  end

  it "should have a tram group" do
    expect(group "tram").to exist
  end

  describe file("/home/tram/tram") do
    it { should be_file }
    it { should be_owned_by "tram" }
    it { should be_grouped_into "tram" }
    it { should be_executable }
  end

end
