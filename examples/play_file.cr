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

instance = LibVLC.new_instance(0, Pointer(LibC::Char).null)
media = LibVLC.new_media_from_path(instance, file_path)
player = LibVLC.new_media_player_from_media(media)

LibVLC.play_media_player(player)

while LibVLC.get_media_player_state(player) != LibVLC::State::Ended
  sleep 1.second
end

LibVLC.free_media_player(player)
LibVLC.free_media(media)
LibVLC.free_instance(instance)
