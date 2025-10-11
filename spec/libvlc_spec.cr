require "./spec_helper"

describe "VLC::LibVLC" do
  it "returns libvlc version string" do
    ver_ptr = VLC::LibVLC.version
    version = String.new(ver_ptr)
    version.should match(/\A\d+\.\d+\.\d+.*\z/)
  end
end
