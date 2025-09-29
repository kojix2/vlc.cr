require "../src/vlc"

unless ARGV.size == 1
  puts "Usage: crystal run examples/play_file.cr -- <file_path>"
  exit 1
end

file_path = ARGV[0]

unless File.exists?(file_path)
  puts "File not found: #{file_path}"
  exit 1
end

puts "Playing: #{file_path}"

instance = LibVlc.new_instance(0, Pointer(LibC::Char).null)
media = LibVlc.new_media_from_path(instance, file_path)
player = LibVlc.new_media_player_from_media(media)

LibVlc.play_media_player(player)

while LibVlc.get_media_player_state(player) != LibVlc::State::Ended
  sleep 1.second
end

LibVlc.free_media_player(player)
LibVlc.free_media(media)
LibVlc.free_instance(instance)
