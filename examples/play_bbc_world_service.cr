require "../src/vlc"

LibVLC = VLC::LibVLC

# Simple example to play BBC World Service live stream.
# NOTE: BBC periodically changes stream URLs. If this one stops working,
# check community curated lists (e.g. https://gist.github.com/bpsib/67089b959e4fa898af69fea59ad74bc3 ).

STREAM_URL = "http://stream.live.vc.bbcmedia.co.uk/bbc_world_service"

puts "Playing BBC World Service: #{STREAM_URL}"

# Create VLC instance (no global options here because current binding exposes
# libvlc_new with a simplified second argument). Instead we add per-media options.
instance = LibVLC.new_instance(0, Pointer(LibC::Char).null)

# Create media from network location
media = LibVLC.new_media_from_location(instance, STREAM_URL)

# Add useful options (network caching and custom user agent)
LibVLC.add_media_option(media, "--network-caching=1000")
LibVLC.add_media_option(media, "--http-user-agent=VLC/3.0 libVLC; Crystal Player")

# Create player from media
player = LibVLC.new_media_player_from_media(media)

# Start playback
LibVLC.play_media_player(player)

Signal::INT.trap do
  LibVLC.free_media_player(player)
  LibVLC.free_media(media)
  LibVLC.free_instance(instance)
  exit(0)
end

# Play for up to 60 seconds (or until the stream reports Ended, which is rare for live)
while LibVLC.get_media_player_state(player) != LibVLC::State::Ended
  sleep 1.second
end
