require "./spec_helper"

describe VLC do
  it "has a version" do
    VLC::VERSION.should_not be_nil
  end
end
