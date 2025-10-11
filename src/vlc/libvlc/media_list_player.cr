require "./types"

module VLC
  @[Link("vlc")]
  lib LibVLC
    # MediaListPlayer
    fun new_media_list_player = libvlc_media_list_player_new(instance : Instance*) : MediaListPlayer*
    fun free_media_list_player = libvlc_media_list_player_release(mlp : MediaListPlayer*)
    fun retain_media_list_player = libvlc_media_list_player_retain(mlp : MediaListPlayer*)

    fun next_media_list_player = libvlc_media_list_player_next(mlp : MediaListPlayer*) : LibC::Int
    fun previous_media_list_player = libvlc_media_list_player_previous(mlp : MediaListPlayer*) : LibC::Int
    fun pause_media_list_player = libvlc_media_list_player_pause(mlp : MediaListPlayer*)
    fun play_media_list_player = libvlc_media_list_player_play(mlp : MediaListPlayer*)
    fun play_media_list_player_item = libvlc_media_list_player_play_item(mlp : MediaListPlayer*, media : Media*) : LibC::Int
    fun play_media_list_player_index = libvlc_media_list_player_play_item_at_index(mlp : MediaListPlayer*, index : LibC::Int) : LibC::Int
    fun set_media_list_player_pause = libvlc_media_list_player_set_pause(mlp : MediaListPlayer*, pause : LibC::Int)
    fun set_media_list_player_media_list = libvlc_media_list_player_set_media_list(mlp : MediaListPlayer*, list : MediaList*)
    fun set_media_list_player_media_player = libvlc_media_list_player_set_media_player(mlp : MediaListPlayer*, player : MediaPlayer*)
    fun stop_media_list_player = libvlc_media_list_player_stop(media_list_player : MediaListPlayer*)
    fun set_media_list_player_playback_mode = libvlc_media_list_player_set_playback_mode(media_list_player : MediaListPlayer*, mode : PlaybackMode)

    fun get_media_list_player_media_player = libvlc_media_list_player_get_media_player(mlp : MediaListPlayer*) : MediaPlayer*
    fun get_media_list_player_state = libvlc_media_list_player_get_state(mlp : MediaListPlayer*) : State
    fun is_media_list_player_playing? = libvlc_media_list_player_is_playing(mlp : MediaListPlayer*) : LibC::Int
  end
end
