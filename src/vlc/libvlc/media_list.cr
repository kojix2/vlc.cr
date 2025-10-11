require "./types"

module VLC
  @[Link("vlc")]
  lib LibVLC
    # MediaList
    fun new_media_list = libvlc_media_list_new(instance : Instance*) : MediaList*
    fun free_media_list = libvlc_media_list_release(media_list : MediaList*)
    fun retain_media_list = libvlc_media_list_retain(media_list : MediaList*)

    fun get_media_list_media = libvlc_media_list_media(media_list : MediaList*) : Media*
    fun set_media_list_media = libvlc_media_list_set_media(media_list : MediaList*, media : Media*)
    fun unlock_media_list = libvlc_media_list_unlock(media_list : MediaList*)
    fun lock_media_list = libvlc_media_list_lock(media_list : MediaList*)

    fun remove_media_list_media = libvlc_media_list_remove_index(media_list : MediaList*, pos : LibC::Int) : LibC::Int
    fun get_media_list_item_at_index = libvlc_media_list_item_at_index(media_list : MediaList*, pos : LibC::Int) : Media*
    fun is_media_list_readonly? = libvlc_media_list_is_readonly(media_list : MediaList*) : LibC::Int
    fun index_of_media_list_media = libvlc_media_list_index_of_item(media_list : MediaList*, media : Media*) : LibC::Int
    fun insert_media_list_media = libvlc_media_list_insert_media(media_list : MediaList*, media : Media*, pos : LibC::Int) : LibC::Int
    fun add_media_list_media = libvlc_media_list_add_media(media_list : MediaList*, media : Media*) : LibC::Int
    fun get_media_list_count = libvlc_media_list_count(media_list : MediaList*) : LibC::Int
  end
end
