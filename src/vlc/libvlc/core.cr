require "./types"

module VLC
  @[Link("vlc")]
  lib LibVLC
    # Instance and core utils
    fun new_instance = libvlc_new(arguments_count : LibC::Int, arguments : LibC::Char**) : Instance*
    fun free = libvlc_free(Void*)
    fun free_instance = libvlc_release(instance : Instance*)
    fun retain_instance = libvlc_retain(instance : Instance*)
    fun version = libvlc_get_version : LibC::Char*
    fun compiler_version = libvlc_get_compiler : LibC::Char*
    fun changeset = libvlc_get_changeset : LibC::Char*

    # Events
    fun get_media_event_manager = libvlc_media_event_manager(media : Media*) : EventManager*
    fun get_media_player_event_manager = libvlc_media_player_event_manager(media_player : MediaPlayer*) : EventManager*
    fun get_media_list_event_manager = libvlc_media_list_event_manager(media_list : MediaList*) : EventManager*
    fun get_media_list_player_event_manager = libvlc_media_list_player_event_manager(media_list_player : MediaListPlayer*) : EventManager*
    fun attach_event = libvlc_event_attach(event_manager : EventManager*, event_type : EventType, callback : Callback, user_data : Void*) : LibC::Int
    fun detach_event = libvlc_event_detach(event_manager : EventManager*, event_type : EventType, callback : Callback, user_data : Void*)
    fun event_type_name = libvlc_event_type_name(event_type : EventType) : LibC::Char*

    # Logging
    alias LogCallback = Proc(Void*, LibC::Int, Log*, LibC::Char*, Void*, Nil)
    fun log_unset = libvlc_log_unset(instance : Instance*)
    fun log_set = libvlc_log_set(instance : Instance*, cb : LogCallback, data : Void*)
    fun log_set_file = libvlc_log_set_file(instance : Instance*, stream : Void*)
    fun log_get_context = libvlc_log_get_context(ctx : Log*, module : LibC::Char**, file : LibC::Char**, line : LibC::UInt*)
    fun log_get_object = libvlc_log_get_object(ctx : Log*, name : LibC::Char**, header : LibC::Char**, id : UInt64*)

    # Modules (filters)
    fun module_description_list_release = libvlc_module_description_list_release(list : ModuleDescription*)
    fun get_audio_filter_list = libvlc_audio_filter_list_get(instance : Instance*) : ModuleDescription*
    fun get_video_filter_list = libvlc_video_filter_list_get(instance : Instance*) : ModuleDescription*
  end
end
