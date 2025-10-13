require "./types"

module VLC
  lib LibVLC
    # Media
    fun new_media_from_path = libvlc_media_new_path(instance : Instance*, path : LibC::Char*) : Media*
    fun new_media_from_location = libvlc_media_new_location(instance : Instance*, path : LibC::Char*) : Media*
    fun new_media_from_file_descriptor = libvlc_media_new_fd(instance : Instance*, descriptor : LibC::Int) : Media*
    fun new_media_from_callbacks = libvlc_media_new_callbacks(instance : Instance*, open_cb : MediaOpenCallback, read_cb : MediaReadCallback, seek_cb : MediaSeekCallback, close_cb : MediaCloseCallback, opaque : Void*) : Media*
    fun free_media = libvlc_media_release(media : Media*)
    fun retain_media = libvlc_media_retain(media : Media*)
    fun duplicate_media = libvlc_media_duplicate(media : Media*) : Media*

    fun new_media_as_node = libvlc_media_new_as_node(instance : Instance*, name : LibC::Char*) : Media*

    fun get_media_resource_locator = libvlc_media_get_mrl(media : Media*) : LibC::Char*
    fun get_media_duration = libvlc_media_get_duration(media : Media*) : Time
    fun get_media_tracks = libvlc_media_tracks_get(media : Media*, tracks : MediaTrack***) : LibC::UInt
    fun free_media_tracks = libvlc_media_tracks_release(tracks : MediaTrack**, count : LibC::UInt)
    fun get_media_type = libvlc_media_get_type(media : Media*) : MediaType
    fun get_media_state = libvlc_media_get_state(media : Media*) : State
    fun get_media_codec_description = libvlc_media_get_codec_description(track_type : TrackType, codec : UInt32) : LibC::Char*
    fun get_media_statistics = libvlc_media_get_stats(media : Media*, stats : MediaStats*) : LibC::Int
    fun get_media_parsed_status = libvlc_media_get_parsed_status(media : Media*) : MediaParsedStatus
    fun get_media_subitems = libvlc_media_subitems(media : Media*) : MediaList*
    # event manager is declared in core.cr

    fun set_media_user_data = libvlc_media_set_user_data(media : Media*, user_data : Void*)
    fun add_media_slave = libvlc_media_slaves_add(media : Media*, slave_type : SlaveType, priority : LibC::UInt, uri : LibC::Char*) : LibC::Int
    fun clear_media_slaves = libvlc_media_slaves_clear(media : Media*)
    fun get_media_slaves = libvlc_media_slaves_get(media : Media*, slaves : MediaSlave***) : LibC::UInt
    fun free_media_slaves = libvlc_media_slaves_release(slaves : MediaSlave**, count : LibC::UInt)

    fun get_media_meta = libvlc_media_get_meta(media : Media*, meta : Meta) : LibC::Char*
    fun set_media_meta = libvlc_media_set_meta(media : Media*, meta : Meta, value : LibC::Char*)
    fun save_media_meta = libvlc_media_save_meta(media : Media*) : LibC::Int

    fun add_media_option = libvlc_media_add_option(media : Media*, option : LibC::Char*)
    fun add_media_option_flag = libvlc_media_add_option_flag(media : Media*, option : LibC::Char*, flags : LibC::UInt)
    fun get_media_user_data = libvlc_media_get_user_data(media : Media*) : Void*
    fun stop_media_parse = libvlc_media_parse_stop(media : Media*)
    fun parse_media_with_options = libvlc_media_parse_with_options(media : Media*, options : MediaParseFlag, timeout : LibC::Int) : LibC::Int
  end
end
