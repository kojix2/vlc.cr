require "./spec_helper"

describe Vlc do
  it "has a version" do
    Vlc::VERSION.should_not be_nil
  end
end
