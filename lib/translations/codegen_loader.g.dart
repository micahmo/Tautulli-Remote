// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "activity_empty": "Nothing is currently being played",
  "activity_page_title": "Activity",
  "history_page_title": "History",
  "recently_added_page_title": "Recently Added",
  "libraries_page_title": "Libraries",
  "users_page_title": "Users",
  "statistics_page_title": "Statistics",
  "graphs_page_title": "Graphs",
  "synced_items_page_title": "Synced Items",
  "announcements_page_title": "Announcements",
  "donate_page_title": "Donate",
  "settings_page_title": "Settings",
  "media_details_audio": "AUDIO",
  "media_details_transcode": "Transcode",
  "media_details_direct_stream": "Direct Stream",
  "media_details_direct_play": "Direct Play",
  "media_details_unknown": "Unknown",
  "media_details_bandwidth": "BANDWIDTH",
  "media_details_container": "CONTAINER",
  "media_details_converting": "Converting",
  "media_details_na": "N/A",
  "masked_info_ip_address": "Hidden IP Address",
  "media_details_location": "LOCATION",
  "media_details_relay_message": "This stream is using Plex Relay",
  "masked_info_location": "Hidden Location",
  "media_details_optimized": "OPTIMIZED",
  "media_details_player": "PLAYER",
  "media_details_product": "PRODUCT",
  "media_details_quality": "QUALITY",
  "media_details_throttled": "Throttled",
  "media_details_speed": "Speed",
  "media_details_stream": "STREAM",
  "media_details_subtitle": "SUBTITLE",
  "media_details_burn": "Burn",
  "media_details_none": "None",
  "media_details_synced": "SYNCED",
  "media_details_video": "VIDEO",
  "button_view_user": "View User",
  "button_view_media": "View Media",
  "button_terminate_stream": "Terminate Stream",
  "button_learn_more": "LEARN MORE",
  "masked_info_user": "Hidden User",
  "termination_request_sent_alert": "Termination request sent to Plex",
  "termination_default_message": "The server owner has ended the stream",
  "termination_photo_alert": "Photo streams cannot be terminated",
  "termination_synced_alert": "Synced content cannot be terminated",
  "termination_dialog_title": "Are you sure you want to terminate this stream",
  "termination_terminate_message_label": "Terminate Message",
  "button_cancel": "CANCEL",
  "button_terminate": "TERMINATE",
  "button_go_to_settings": "Go to settings",
  "button_retry": "Retry",
  "media_details_location_error": "ERROR: IP Address not in GeoIP map",
  "media_details_location_loading": "Loading location data",
  "activity_time_left": "left",
  "settings_not_loaded_error": "ERROR: Settings not loaded",
  "general_unknown_error": "Unknown Error",
  "donate_thank_you_alert": "Thank you for your donation",
  "donate_error_alert": "Something went wrong.",
  "donate_message_title": "Tautulli Remote is free and open source.",
  "donate_message_body": "However, any contributions you can make towards the app are appreciated!",
  "donate_one_time_heading": "One-Time Donations",
  "donate_cone": "Buy Me A Cone",
  "donate_slice": "Buy Me A Slice",
  "donate_burger": "Buy Me A Burger",
  "donate_meal": "Buy Me A Meal",
  "donate_recurring_heading": "Recurring Donations",
  "donate_tip_jar": "Tip Jar",
  "donate_big_tip": "Big Tip",
  "donate_supporter": "Supporter",
  "donate_patron": "Patron",
  "donate_load_failed": "Failed to load donation items.",
  "donate_month": "month",
  "graphs_media_type_tab": "Media Type",
  "graphs_stream_type_tab": "Stream Type",
  "graphs_play_totals_tab": "Play Totals",
  "general_filter_plays": "Plays",
  "general_filter_duration": "Duration",
  "general_tooltip_y_axis": "Y Axis",
  "general_tooltip_time_range": "Time Range",
  "general_filter_days": "Days",
  "general_filter_custom": "Custom",
  "general_time_range_dialog_title": "Custom Time Range",
  "general_time_range_dialog_hint_text": "Enter a time range in days",
  "general_time_range_dialog_validator_integer": "Please enter an integer",
  "general_time_range_dialog_validator_larger": "Please enter an integer larger than 1",
  "general_time_range_dialog_notice": "It is recommended you do not exceed 90 days for most screen sizes.",
  "button_save": "SAVE",
  "button_close": "CLOSE",
  "masked_info_hidden": "Hidden",
  "graphs_no_plays": "No plays for the selected time range",
  "graphs_load_fail": "Failed to load graph",
  "graphs_media_type_daily_play": "Daily Play {} by Media Type",
  "graphs_media_type_day_of_week": "Play {} by Day of the Week",
  "graphs_media_type_hour_of_day": "Play {} by Hour of the Day",
  "graphs_media_type_top_platforms": "Play {} by Top 10 Platforms",
  "graphs_media_type_top_users": "Play {} by Top 10 Users",
  "general_filter_count": "Count",
  "graphs_play_totals_last_12_months": "Total Play {} for Last 12 Months",
  "graphs_stream_type_daily_play": "Daily Play {} by Stream Type",
  "graphs_stream_type_source_resolution": "Play {} by Source Resolution",
  "graphs_stream_type_stream_resolution": "Play {} by Stream Resolution",
  "graphs_stream_type_platform": "Play {} by Platform Stream Type",
  "graphs_stream_type_user": "Play {} by User Stream Type",
  "help_help_topics_heading": "Help Topics",
  "help_support_heading": "Support",
  "help_bugs_features_heading": "Bugs/Feature Requests",
  "help_logs_heading": "Logs",
  "help_tautulli_remote_logs": "View Tautulli Remote logs",
  "help_page_title": "Help & Support",
  "history_empty": "No history found.",
  "history_filter_empty": "No history for the selected filters found.",
  "general_filter_users": "Users",
  "general_filter_users_loading": "Loading users",
  "general_filter_users_failed": "Users failed to load",
  "general_filter_history": "Filter history",
  "general_movies": "Movies",
  "general_tv": "TV",
  "general_live_tv": "Live TV",
  "general_tv_shows": "TV Shows",
  "general_music": "Music",
  "general_videos": "Videos",
  "general_all": "All",
  "history_details_user": "USER",
  "history_details_platform": "PLATFORM",
  "history_details_product": "PRODUCT",
  "history_details_player": "PLAYER",
  "history_details_ip_address": "IP ADDRESS",
  "history_details_date": "DATE",
  "history_details_started": "STARTED",
  "history_details_stopped": "STOPPED",
  "history_details_paused": "PAUSED",
  "history_details_watched": "WATCHED",
  "libraries_empty": "No libraries found.",
  "general_tooltip_sort_libraries": "Sort libraries",
  "general_filter_name": "Name",
  "general_never": "never",
  "libraries_details_streamed": "STREAMED",
  "libraries_details_tab_stats": "Stats",
  "libraries_details_tab_new": "New",
  "libraries_details_tab_media": "Media",
  "libraries_details_movies": "MOVIES",
  "libraries_details_shows": "SHOWS",
  "libraries_details_seasons": "SEASONS",
  "libraries_details_episodes": "EPISODES",
  "libraries_details_artists": "ARTISTS",
  "libraries_details_albums": "ALBUMS",
  "libraries_details_tracks": "TRACKS",
  "libraries_details_photos": "PHOTOS",
  "libraries_details_videos": "VIDEOS",
  "libraries_details_plays": "PLAYS",
  "general_details_duration": "DURATION",
  "general_details_days": "days",
  "general_details_hrs": "hrs",
  "general_details_mins": "mins",
  "general_details_secs": "secs",
  "libraries_media_tab_empty": "No items found.",
  "libraries_full_refresh": "Performing a full refresh of library media.",
  "libraries_details_recent_tab_failure": "Failed to fetch items.",
  "libraries_details_all_time": "All Time",
  "general_details_min": "min",
  "libraries_details_hours": "Hours",
  "statistics_empty": "No statistics found.",
  "libraries_details_user_stats_heading": "User Stats",
  "libraries_details_global_stats_heading": "Global Stats",
  "logs_page_title": "Tautulli Remote Logs",
  "logs_export": "Export logs",
  "logs_clear": "Clear logs",
  "logs_exported": "Logs exported",
  "button_access_logs": "HOW TO ACCESS LOGS",
  "logs_failed": "Failed to load logs.",
  "logs_clear_dialog_title": "Are you sure you want to clear the Tautulli Remote logs?",
  "button_confirm": "CONFIRM",
  "logs_timestamp": "Timestamp",
  "logs_level": "Level",
  "logs_message": "Message",
  "logs_empty": "No logs found.",
  "general_tooltip_more": "More options",
  "media_go_to_season": "Go to season",
  "media_go_to_show": "Go to show",
  "media_go_to_artist": "Go to artist",
  "media_view_on_plex": "View on Plex",
  "general_read_more": "READ MORE",
  "general_read_less": "READ LESS",
  "media_details_items": "ITEMS",
  "media_details_year": "YEAR",
  "media_details_studio": "STUDIO",
  "media_details_aired": "AIRED",
  "media_details_runtime": "RUNTIME",
  "media_details_rated": "RATED",
  "media_details_genres": "GENRES",
  "media_details_directed_by": "DIRECTED BY",
  "media_details_written_by": "WRITTEN BY",
  "media_details_starring": "STARRING",
  "media_details_bitrate": "BITRATE",
  "media_details_file_size": "FILE SIZE",
  "media_details_taken": "TAKEN",
  "media_tab_details": "Details",
  "media_tab_seasons": "Seasons",
  "media_tab_episodes": "Episodes",
  "media_tab_albums": "Albums",
  "media_tab_tracks": "Tracks",
  "media_tab_movies": "Movies",
  "media_tab_media": "Media"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
