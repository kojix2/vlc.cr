module VLC
  @[Link("vlc")]
  lib LibVLC
    # Opaque handles and common aliases
    alias Instance = Void*
    alias MediaPlayer = Void*
    alias MediaListPlayer = Void*
    alias Media = Void*
    alias MediaList = Void*
    alias Time = Int64
    alias EventManager = Void*
    alias EventType = LibC::Int

    alias Callback = Proc(EventData*, Void*, Nil)
    alias AudioPlayCallback = Proc(Void*, Void*, LibC::UInt, Int64, Nil)
    alias AudioPauseCallback = Proc(Void*, Int64, Nil)
    alias AudioResumeCallback = Proc(Void*, Int64, Nil)
    alias AudioFlushCallback = Proc(Void*, Int64, Nil)
    alias AudioDrainCallback = Proc(Void*, Nil)
    alias AudioCleanupCallback = Proc(Void*, Nil)
    alias AudioVolumeCallback = Proc(Void*, LibC::Float, Bool, Nil)
    alias AudioSetupCallback = Proc(Void**, LibC::Char*, LibC::UInt*, LibC::UInt*, LibC::Int)

    alias Picture = Void*
    alias Equalizer = Void*
    alias Log = Void

    # Enums
    enum State
      NothingSpecial
      Opening
      Buffering
      Playing
      Paused
      Stopped
      Ended
      Error
    end

    enum MediaType
      Unknown
      File
      Directory
      Disc
      Stream
      Playlist
    end

    enum TrackType
      Unknown = -1
      Audio   =  0
      Video   =  1
      Text    =  2
    end

    enum PlaybackMode
      Default
      Loop
      Repeat
    end

    enum Meta
      Title
      Artist      = 1
      Genre
      Copyright
      Album
      TrackNumber
      Description
      Rating
      Date
      Setting
      URL
      Language
      NowPlaying
      Publisher
      EncodedBy
      ArtworkURL
      TrackID
      TrackTotal
      Director
      Season
      Episode
      ShowName
      Actors
      AlbumArtist
      DiscNumber
      DiscTotal
    end

    enum MediaParsedStatus
      Skipped = 1
      Failed  = 2
      Timeout = 3
      Done    = 4
    end

    enum Event
      MediaMetaChanged      = 0
      MediaSubItemAdded
      MediaDurationChanged
      MediaParsedChanged
      MediaFreed
      MediaStateChanged
      MediaSubItemTreeAdded

      MediaPlayerMediaChanged     = 0x100
      MediaPlayerNothingSpecial
      MediaPlayerOpening
      MediaPlayerBuffering
      MediaPlayerPlaying
      MediaPlayerPaused
      MediaPlayerStopped
      MediaPlayerForward
      MediaPlayerBackward
      MediaPlayerEndReached
      MediaPlayerEncounteredError
      MediaPlayerTimeChanged
      MediaPlayerPositionChanged
      MediaPlayerSeekableChanged
      MediaPlayerPausableChanged
      MediaPlayerTitleChanged
      MediaPlayerSnapshotTaken
      MediaPlayerLengthChanged
      MediaPlayerVout
      MediaPlayerScrambledChanged
      MediaPlayerESAdded
      MediaPlayerESDeleted
      MediaPlayerESSelected
      MediaPlayerCorked
      MediaPlayerUncorked
      MediaPlayerMuted
      MediaPlayerUnmuted
      MediaPlayerAudioVolume
      MediaPlayerAudioDevice
      MediaPlayerChapterChanged

      MediaListItemAdded      = 0x200
      MediaListWillAddItem
      MediaListItemDeleted
      MediaListWillDeleteItem
      MediaListEndReached

      MediaListViewItemAdded      = 0x300
      MediaListViewWillAddItem
      MediaListViewItemDeleted
      MediaListViewWillDeleteItem

      MediaListPlayerPlayed      = 0x400
      MediaListPlayerNextItemSet
      MediaListPlayerStopped

      MediaDiscovererStarted = 0x500
      MediaDiscovererEnded

      RendererDiscovererItemAdded
      RendererDiscovererItemDeleted
    end

    enum Role
      None
      Music
      Video
      Communication
      Game
      Notification
      Animation
      Production
      Accessibility
    end

    @[Flags]
    enum MediaParseFlag
      ParseLocal   = 0x00
      ParseNetwork = 0x01
      FetchLocal   = 0x02
      FetchNetwork = 0x04
      DoInteract   = 0x08
    end

    enum SlaveType
      Subtitle
      Audio
    end

    # Structs
    struct MediaStats
      i_read_bytes : LibC::Int
      f_input_bitrate : LibC::Float
      i_demux_read_bytes : LibC::Int
      f_demux_bitrate : LibC::Float
      i_demux_corrupted : LibC::Int
      i_demux_discontinuity : LibC::Int
      i_decoded_video : LibC::Int
      i_decoded_audio : LibC::Int
      i_displayed_pictures : LibC::Int
      i_lost_pictures : LibC::Int
      i_played_abuffers : LibC::Int
      i_lost_abuffers : LibC::Int
      i_sent_packets : LibC::Int
      i_sent_bytes : LibC::Int
      f_send_bitrate : LibC::Float
    end

    struct EventData
      type : Event
      p_obj : Void*
      u : EventUnion
    end

    union EventUnion
      new_state : State
      meta_type : Meta
      new_child : Media*
      new_duration : Int64
      md : Media*
      item : Media*
      new_status : LibC::Int
      new_cache : LibC::Float
      new_chapter : LibC::Int
      new_position : LibC::Float
      new_time : Time
      new_title : LibC::Int
      new_seekable : LibC::Int
      new_pausable : LibC::Int
      new_scrambled : LibC::Int
      new_count : LibC::Int
      index : LibC::Int
      new_length : Time
      new_media : Media*
      i_type : TrackType
      i_id : LibC::Int
      volume : LibC::Float
      device : LibC::Char*
      psz_filename : LibC::Char*
      psz_instance_name : LibC::Char*
      renderer_item : Void*
    end

    struct AudioOutput
      psz_name : LibC::Char*
      psz_description : LibC::Char*
      p_next : AudioOutput*
    end

    struct TrackDescription
      i_id : LibC::Int
      psz_name : LibC::Char*
      p_next : TrackDescription*
    end

    struct OutputDevice
      psz_device : LibC::Char*
      psz_description : LibC::Char*
      p_next : OutputDevice*
    end

    struct MediaSlave
      psz_uri : LibC::Char*
      i_type : SlaveType
      i_priority : LibC::UInt
    end

    struct AudioTrack
      channels : LibC::UInt
      rate : LibC::UInt
    end

    struct SubtitleTrack
      psz_encoding : LibC::Char*
    end

    struct VideoViewpoint
      f_yaw : LibC::Float
      f_pitch : LibC::Float
      f_roll : LibC::Float
      f_field_of_view : LibC::Float
    end

    struct VideoTrack
      i_height : LibC::UInt
      i_width : LibC::UInt
      i_sar_num : LibC::UInt
      i_sar_den : LibC::UInt
      i_frame_rate_num : LibC::UInt
      i_frame_rate_den : LibC::UInt
      i_orientation : LibC::Int
      i_projection : LibC::Int
      pose : VideoViewpoint
    end

    union TrackUnion
      audio : AudioTrack*
      video : VideoTrack*
      subtitle : SubtitleTrack*
    end

    struct MediaTrack
      i_codec : UInt32
      i_original_fourcc : UInt32
      i_id : LibC::Int
      i_type : TrackType
      i_profile : LibC::Int
      i_level : LibC::Int
      track : TrackUnion
      i_bitrate : LibC::UInt
      psz_language : LibC::Char*
      psz_description : LibC::Char*
    end

    struct ModuleDescription
      psz_name : LibC::Char*
      psz_shortname : LibC::Char*
      psz_longname : LibC::Char*
      psz_help : LibC::Char*
      p_next : ModuleDescription*
    end
  end
end
