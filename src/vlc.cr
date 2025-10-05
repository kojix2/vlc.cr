require "./vlc/libvlc.cr"

module VLC
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end
