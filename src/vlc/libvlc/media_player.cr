require "./types"

module VLC
  @[Link("vlc")]
  lib LibVLC
    # Media player
    fun new_media_player = libvlc_media_player_new(instance : Instance*) : MediaPlayer*
    fun new_media_player_from_media = libvlc_media_player_new_from_media(media : Media*) : MediaPlayer*
    fun free_media_player = libvlc_media_player_release(media_player : MediaPlayer*)
    fun retain_media_player = libvlc_media_player_retain(media_player : MediaPlayer*)

    fun set_audio_callbacks = libvlc_audio_set_callbacks(media_player : MediaPlayer*, play : AudioPlayCallback, pause : AudioPauseCallback, resume : AudioResumeCallback, flush : AudioFlushCallback, drain : AudioDrainCallback, opaque : Void*)
    fun set_audio_format_callbacks = libvlc_audio_set_format_callbacks(media_player : MediaPlayer*, setup : AudioSetupCallback, cleanup : AudioCleanupCallback)
    fun set_audio_volume_callback = libvlc_audio_set_volume_callback(media_player : MediaPlayer*, callback : AudioVolumeCallback)

    fun set_audio_channel = libvlc_audio_set_channel(media_player : MediaPlayer*, channel : LibC::Int) : LibC::Int
    fun set_audio_delay = libvlc_audio_set_delay(media_player : MediaPlayer*, delay : Int64) : LibC::Int
    fun set_audio_mute = libvlc_audio_set_mute(media_player : MediaPlayer*, status : LibC::Int)
    fun set_audio_track = libvlc_audio_set_track(media_player : MediaPlayer*, track : LibC::Int) : LibC::Int
    fun set_audio_volume = libvlc_audio_set_volume(media_player : MediaPlayer*, volume : LibC::Int) : LibC::Int
    fun set_audio_format = libvlc_audio_set_format(media_player : MediaPlayer*, format : LibC::Char*, rate : LibC::UInt, channels : LibC::UInt)

    fun set_media_player_media = libvlc_media_player_set_media(media_player : MediaPlayer*, media : Media*)
    fun get_media_player_media = libvlc_media_player_get_media(media_player : MediaPlayer*) : Media*

    fun can_media_player_pause? = libvlc_media_player_can_pause(media_player : MediaPlayer*) : LibC::Int
    fun is_media_player_playing? = libvlc_media_player_is_playing(media_player : MediaPlayer*) : LibC::Int
    fun is_media_player_seekable? = libvlc_media_player_is_seekable(media_player : MediaPlayer*) : LibC::Int
    fun is_media_player_program_scrambled? = libvlc_media_player_program_scrambled(media_player : MediaPlayer*) : LibC::Int

    fun get_media_player_length = libvlc_media_player_get_length(media_player : MediaPlayer*) : Time
    fun get_media_player_position = libvlc_media_player_get_position(media_player : MediaPlayer*) : LibC::Float
    fun get_media_player_state = libvlc_media_player_get_state(media_player : MediaPlayer*) : State
    fun get_media_player_time = libvlc_media_player_get_time(media_player : MediaPlayer*) : Time
    fun get_media_player_title = libvlc_media_player_get_title(media_player : MediaPlayer*) : LibC::Int
    fun get_media_player_title_count = libvlc_media_player_get_title_count(media_player : MediaPlayer*) : LibC::Int
    fun get_media_player_vout_count = libvlc_media_player_has_vout(media_player : MediaPlayer*) : LibC::Int

    fun add_media_player_slave = libvlc_media_player_add_slave(media_player : MediaPlayer*, slave_type : SlaveType, uri : LibC::Char*, select : Bool) : LibC::Int

    # Direct MediaPlayer control
    fun play_media_player = libvlc_media_player_play(player : MediaPlayer*)
    fun pause_media_player = libvlc_media_player_pause(player : MediaPlayer*)
    fun next_media_player_frame = libvlc_media_player_next_frame(media_player : MediaPlayer*)
    fun set_media_player_pause = libvlc_media_player_set_pause(media_player : MediaPlayer*, do_pause : LibC::Int)
    fun set_media_player_position = libvlc_media_player_set_position(media_player : MediaPlayer*, position : LibC::Float)
    fun set_media_player_rate = libvlc_media_player_set_rate(media_player : MediaPlayer*, rate : LibC::Float) : LibC::Int
    fun set_media_player_time = libvlc_media_player_set_time(media_player : MediaPlayer*, time : Time)
    fun stop_media_player = libvlc_media_player_stop(media_player : MediaPlayer*)

    # Windowing
    fun set_media_player_xwindow = libvlc_media_player_set_xwindow(mp : MediaPlayer*, id : UInt32)
    fun set_media_player_hwnd = libvlc_media_player_set_hwnd(mp : MediaPlayer*, hwnd : Void*)
    fun set_media_player_nsobject = libvlc_media_player_set_nsobject(mp : MediaPlayer*, nsobject : Void*)
    fun get_media_player_xwindow = libvlc_media_player_get_xwindow(mp : MediaPlayer*) : UInt32
    fun get_media_player_hwnd = libvlc_media_player_get_hwnd(mp : MediaPlayer*) : Void*
    fun get_media_player_nsobject = libvlc_media_player_get_nsobject(mp : MediaPlayer*) : Void*
  end
end
