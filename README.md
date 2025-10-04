# vlc.cr

[![test](https://github.com/kojix2/vlc.cr/actions/workflows/test.yml/badge.svg)](https://github.com/kojix2/vlc.cr/actions/workflows/test.yml)

:orange: [VLC](https://www.videolan.org/) media player library - for Crystal :gem:

This project was forked from [data-niklas/vlc](https://github.com/data-niklas/vlc).

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
