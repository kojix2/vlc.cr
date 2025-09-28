# vlc.cr

VLC media player library bindings for Crystal.

## Installation

Add to your `shard.yml`:

```yaml
dependencies:
  vlc:
    github: kojix2/vlc.cr
```

Run `shards install`

## Usage

```crystal
require "vlc"

# Create VLC instance
instance = LibVlc.new_instance(0, nil)

# Create media from file
media = LibVlc.new_media_from_path(instance, "path/to/video.mp4")

# Create media player
player = LibVlc.new_media_player_from_media(media)

# Play
LibVlc.play_media_player(player)

# Cleanup
LibVlc.free_media_player(player)
LibVlc.free_media(media)
LibVlc.free_instance(instance)
```

## License

MIT
