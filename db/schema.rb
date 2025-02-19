# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_02_171732) do
  create_table "account_requests", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email"
    t.string "login"
    t.integer "entity_type"
    t.integer "status", default: 0
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "moderated_by_id"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_account_requests_on_user_id"
  end

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata", size: :medium
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.string "service_name", default: "filesystem", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assets", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "mp3_content_type"
    t.string "mp3_file_name"
    t.integer "mp3_file_size"
    t.datetime "created_at"
    t.string "title"
    t.integer "thumbnails_count", default: 0
    t.integer "user_id"
    t.integer "length"
    t.string "album"
    t.string "permalink"
    t.integer "samplerate"
    t.integer "bitrate"
    t.string "genre"
    t.string "artist"
    t.integer "listens_count", default: 0
    t.text "description", size: :long
    t.text "credits", size: :long
    t.string "youtube_embed"
    t.float "hotness"
    t.integer "favorites_count", default: 0
    t.text "lyrics", size: :long
    t.text "description_html", size: :long
    t.float "listens_per_week"
    t.integer "comments_count", default: 0
    t.datetime "updated_at"
    t.boolean "private", default: false, null: false
    t.integer "id3_track_num", default: 1
    t.boolean "is_spam", default: false
    t.datetime "deleted_at"
    t.index ["hotness"], name: "index_assets_on_hotness"
    t.index ["permalink"], name: "index_assets_on_permalink"
    t.index ["updated_at"], name: "index_assets_on_updated_at"
    t.index ["user_id", "listens_per_week"], name: "index_assets_on_user_id_and_listens_per_day"
    t.index ["user_id"], name: "index_assets_on_user_id"
  end

  create_table "audio_features", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "asset_id"
    t.text "waveform", size: :long
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_audio_features_on_asset_id"
  end

  create_table "comments", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "commentable_type"
    t.integer "commentable_id"
    t.text "body", size: :medium
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "commenter_id"
    t.integer "user_id"
    t.string "remote_ip"
    t.string "user_agent"
    t.string "referrer"
    t.boolean "is_spam", default: false
    t.boolean "private", default: false
    t.text "body_html", size: :medium
    t.datetime "deleted_at"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type", "is_spam", "private"], name: "index_comments_on_commentable_type_and_is_spam_and_private"
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
    t.index ["user_id", "commentable_type", "is_spam", "private"], name: "by_user_id_type_spam_private"
  end

  create_table "featured_tracks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "position", default: 1
    t.integer "feature_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "featured_user_id"
    t.integer "writer_id"
    t.integer "views_count", default: 0
    t.text "body", size: :medium
    t.text "teaser_text", size: :medium
    t.boolean "published", default: false
    t.boolean "published_at"
    t.boolean "datetime"
    t.string "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followings", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["follower_id"], name: "index_followings_on_follower_id"
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "friendly_id_slugs", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "slug", limit: 191, null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope", limit: 191
    t.datetime "created_at", null: false
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description", size: :medium
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "permalink"
  end

  create_table "listens", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "listener_id"
    t.integer "track_owner_id"
    t.string "source"
    t.string "ip"
    t.string "user_agent"
    t.string "city"
    t.string "country"
    t.datetime "deleted_at"
    t.index ["asset_id"], name: "index_listens_on_asset_id"
    t.index ["created_at"], name: "index_listens_on_created_at"
    t.index ["listener_id"], name: "index_listens_on_listener_id"
    t.index ["track_owner_id", "created_at"], name: "index_listens_on_track_owner_id_and_created_at"
    t.index ["track_owner_id"], name: "index_listens_on_track_owner_id"
  end

  create_table "mass_invite_signups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "mass_invite_id"
    t.index ["mass_invite_id"], name: "index_mass_invite_signups_on_mass_invite_id"
    t.index ["user_id"], name: "index_mass_invite_signups_on_user_id"
  end

  create_table "mass_invites", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "name", null: false
    t.string "token", null: false
    t.boolean "archived", default: false, null: false
    t.integer "users_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_mass_invites_on_token", unique: true
  end

  create_table "memberships", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.boolean "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patrons", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at"
    t.index ["user_id"], name: "index_patrons_on_user_id"
  end

  create_table "playlists", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "permalink"
    t.integer "tracks_count", default: 0
    t.boolean "is_mix"
    t.boolean "published", default: false
    t.boolean "is_favorite", default: false
    t.string "year"
    t.integer "position", default: 1
    t.string "link1"
    t.string "link2"
    t.string "link3"
    t.text "credits", size: :long
    t.boolean "has_details", default: false
    t.string "theme"
    t.datetime "published_at"
    t.integer "cover_quality", default: 2
    t.datetime "deleted_at"
    t.index ["permalink"], name: "index_playlists_on_permalink"
    t.index ["position"], name: "index_playlists_on_position"
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "profiles", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.text "bio", size: :medium
    t.string "city"
    t.string "country"
    t.string "apple"
    t.string "twitter"
    t.string "spotify"
    t.string "bandcamp"
    t.string "instagram"
    t.string "website"
    t.string "user_agent"
    t.datetime "updated_at"
    t.string "youtube"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "settings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "display_listen_count", default: true
    t.boolean "block_guest_comments", default: false
    t.boolean "most_popular", default: true
    t.boolean "increase_ego", default: false
    t.boolean "email_comments", default: true
    t.boolean "email_new_tracks", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "thredded_categories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "messageboard_id", null: false
    t.text "name", size: :medium, null: false
    t.text "description", size: :medium
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "slug", size: :medium, null: false
    t.index ["messageboard_id", "slug"], name: "index_thredded_categories_on_messageboard_id_and_slug", unique: true, length: { slug: 191 }
    t.index ["messageboard_id"], name: "index_thredded_categories_on_messageboard_id"
    t.index ["name"], name: "thredded_categories_name_ci", length: 191
  end

  create_table "thredded_messageboard_groups", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thredded_messageboard_notifications_for_followed_topics", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "messageboard_id", null: false
    t.string "notifier_key", limit: 90, null: false
    t.boolean "enabled", default: true, null: false
    t.index ["user_id", "messageboard_id", "notifier_key"], name: "thredded_messageboard_notifications_for_followed_topics_unique", unique: true
  end

  create_table "thredded_messageboard_users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "thredded_user_detail_id", null: false
    t.bigint "thredded_messageboard_id", null: false
    t.datetime "last_seen_at", null: false
    t.index ["thredded_messageboard_id", "last_seen_at"], name: "index_thredded_messageboard_users_for_recently_active"
    t.index ["thredded_messageboard_id", "thredded_user_detail_id"], name: "index_thredded_messageboard_users_primary", unique: true
    t.index ["thredded_messageboard_id"], name: "index_thredded_messageboard_users_on_thredded_messageboard_id"
    t.index ["thredded_user_detail_id"], name: "index_thredded_messageboard_users_on_thredded_user_detail_id"
  end

  create_table "thredded_messageboards", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.text "name", size: :medium, null: false
    t.text "slug", size: :medium
    t.text "description", size: :medium
    t.integer "topics_count", default: 0
    t.integer "posts_count", default: 0
    t.integer "position", null: false
    t.bigint "last_topic_id"
    t.bigint "messageboard_group_id"
    t.boolean "locked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["last_topic_id"], name: "index_thredded_messageboards_on_last_topic_id"
    t.index ["messageboard_group_id"], name: "index_thredded_messageboards_on_messageboard_group_id"
    t.index ["slug"], name: "index_thredded_messageboards_on_slug", unique: true, length: 191
  end

  create_table "thredded_notifications_for_followed_topics", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "notifier_key", limit: 90, null: false
    t.boolean "enabled", default: true, null: false
    t.index ["user_id", "notifier_key"], name: "thredded_notifications_for_followed_topics_unique", unique: true
  end

  create_table "thredded_notifications_for_private_topics", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "notifier_key", limit: 90, null: false
    t.boolean "enabled", default: true, null: false
    t.index ["user_id", "notifier_key"], name: "thredded_notifications_for_private_topics_unique", unique: true
  end

  create_table "thredded_post_moderation_records", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "messageboard_id"
    t.text "post_content", size: :medium
    t.bigint "post_user_id"
    t.text "post_user_name", size: :medium
    t.bigint "moderator_id"
    t.integer "moderation_state", null: false
    t.integer "previous_moderation_state", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["messageboard_id", "created_at"], name: "index_thredded_moderation_records_for_display"
    t.index ["messageboard_id"], name: "index_thredded_post_moderation_records_on_messageboard_id"
    t.index ["moderator_id"], name: "index_thredded_post_moderation_records_on_moderator_id"
    t.index ["post_id"], name: "index_thredded_post_moderation_records_on_post_id"
    t.index ["post_user_id"], name: "index_thredded_post_moderation_records_on_post_user_id"
  end

  create_table "thredded_post_notifications", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email", limit: 191, null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "post_type", limit: 191
    t.index ["post_id", "post_type"], name: "index_thredded_post_notifications_on_post"
    t.index ["post_id"], name: "index_thredded_post_notifications_on_post_id"
  end

  create_table "thredded_posts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.text "content", size: :medium
    t.string "source", limit: 191, default: "web"
    t.bigint "postable_id", null: false
    t.bigint "messageboard_id", null: false
    t.integer "moderation_state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "thredded_posts_content_fts", type: :fulltext
    t.index ["messageboard_id"], name: "index_thredded_posts_on_messageboard_id"
    t.index ["moderation_state", "updated_at"], name: "index_thredded_posts_for_display"
    t.index ["postable_id"], name: "index_thredded_posts_on_postable_id"
    t.index ["postable_id"], name: "index_thredded_posts_on_postable_id_and_postable_type"
    t.index ["user_id"], name: "index_thredded_posts_on_user_id"
  end

  create_table "thredded_private_posts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content", size: :medium
    t.bigint "postable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postable_id", "created_at"], name: "index_thredded_private_posts_on_postable_id_and_created_at"
    t.index ["postable_id"], name: "index_thredded_private_posts_on_postable_id"
    t.index ["user_id"], name: "index_thredded_private_posts_on_user_id"
  end

  create_table "thredded_private_topics", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "last_user_id"
    t.text "title", size: :medium, null: false
    t.text "slug", size: :medium, null: false
    t.integer "posts_count", default: 0
    t.string "hash_id", limit: 20, null: false
    t.datetime "last_post_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_thredded_private_topics_on_hash_id"
    t.index ["last_post_at"], name: "index_thredded_private_topics_on_last_post_at"
    t.index ["last_user_id"], name: "index_thredded_private_topics_on_last_user_id"
    t.index ["slug"], name: "index_thredded_private_topics_on_slug", unique: true, length: 191
    t.index ["user_id"], name: "index_thredded_private_topics_on_user_id"
  end

  create_table "thredded_private_users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "private_topic_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["private_topic_id"], name: "index_thredded_private_users_on_private_topic_id"
    t.index ["user_id"], name: "index_thredded_private_users_on_user_id"
  end

  create_table "thredded_topic_categories", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_thredded_topic_categories_on_category_id"
    t.index ["topic_id"], name: "index_thredded_topic_categories_on_topic_id"
  end

  create_table "thredded_topics", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "last_user_id"
    t.text "title", size: :medium, null: false
    t.string "slug", limit: 191, null: false
    t.bigint "messageboard_id", null: false
    t.integer "posts_count", default: 0, null: false
    t.boolean "sticky", default: false, null: false
    t.boolean "locked", default: false, null: false
    t.string "hash_id", limit: 20, null: false
    t.integer "moderation_state", null: false
    t.datetime "last_post_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_thredded_topics_on_hash_id"
    t.index ["last_post_at"], name: "index_thredded_topics_on_last_post_at"
    t.index ["last_user_id"], name: "index_thredded_topics_on_last_user_id"
    t.index ["messageboard_id", "slug"], name: "index_thredded_topics_on_messageboard_id_and_slug", unique: true
    t.index ["messageboard_id"], name: "index_thredded_topics_on_messageboard_id"
    t.index ["moderation_state", "sticky", "updated_at"], name: "index_thredded_topics_for_display"
    t.index ["slug"], name: "index_thredded_topics_on_slug", unique: true
    t.index ["title"], name: "thredded_topics_title_fts", type: :fulltext
    t.index ["user_id"], name: "index_thredded_topics_on_user_id"
  end

  create_table "thredded_user_details", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "latest_activity_at"
    t.integer "posts_count", default: 0
    t.integer "topics_count", default: 0
    t.datetime "last_seen_at"
    t.integer "moderation_state", default: 1, null: false
    t.timestamp "moderation_state_changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latest_activity_at"], name: "index_thredded_user_details_on_latest_activity_at"
    t.index ["moderation_state", "moderation_state_changed_at"], name: "index_thredded_user_details_for_moderations"
    t.index ["user_id"], name: "index_thredded_user_details_on_user_id"
  end

  create_table "thredded_user_messageboard_preferences", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "messageboard_id", null: false
    t.boolean "follow_topics_on_mention", default: true, null: false
    t.boolean "auto_follow_topics", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messageboard_id"], name: "index_thredded_user_messageboard_preferences_on_messageboard_id"
    t.index ["user_id", "messageboard_id"], name: "thredded_user_messageboard_preferences_user_id_messageboard_id", unique: true
    t.index ["user_id"], name: "index_thredded_user_messageboard_preferences_on_user_id"
  end

  create_table "thredded_user_post_notifications", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "notified_at", null: false
    t.index ["post_id"], name: "index_thredded_user_post_notifications_on_post_id"
    t.index ["user_id", "post_id"], name: "index_thredded_user_post_notifications_on_user_id_and_post_id", unique: true
  end

  create_table "thredded_user_preferences", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "follow_topics_on_mention", default: true, null: false
    t.boolean "auto_follow_topics", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_thredded_user_preferences_on_user_id"
  end

  create_table "thredded_user_private_topic_read_states", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "postable_id", null: false
    t.timestamp "read_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "unread_posts_count", default: 0, null: false
    t.integer "read_posts_count", default: 0, null: false
    t.index ["user_id", "postable_id"], name: "thredded_user_private_topic_read_states_user_postable", unique: true
    t.index ["user_id"], name: "index_thredded_user_private_topic_read_states_on_user_id"
  end

  create_table "thredded_user_topic_follows", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "topic_id", null: false
    t.datetime "created_at", null: false
    t.integer "reason", limit: 1
    t.index ["user_id", "topic_id"], name: "thredded_user_topic_follows_user_topic", unique: true
    t.index ["user_id"], name: "index_thredded_user_topic_follows_on_user_id"
  end

  create_table "thredded_user_topic_read_states", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "postable_id", null: false
    t.timestamp "read_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "unread_posts_count", default: 0, null: false
    t.integer "read_posts_count", default: 0, null: false
    t.bigint "messageboard_id", null: false
    t.index ["messageboard_id"], name: "index_thredded_user_topic_read_states_on_messageboard_id"
    t.index ["user_id", "messageboard_id"], name: "thredded_user_topic_read_states_user_messageboard"
    t.index ["user_id", "postable_id"], name: "thredded_user_topic_read_states_user_postable", unique: true
    t.index ["user_id"], name: "index_thredded_user_topic_read_states_on_user_id"
  end

  create_table "tracks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "asset_id"
    t.integer "position", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "is_favorite", default: false
    t.integer "user_id"
    t.datetime "deleted_at"
    t.index ["asset_id"], name: "index_tracks_on_asset_id"
    t.index ["is_favorite"], name: "index_tracks_on_is_favorite"
    t.index ["playlist_id"], name: "index_tracks_on_playlist_id"
    t.index ["user_id"], name: "index_tracks_on_user_id"
  end

  create_table "updates", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.text "content", size: :medium
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "revision"
    t.text "content_html", size: :medium
    t.string "permalink"
  end

  create_table "user_reports", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "category"
    t.text "description", size: :medium
    t.string "params"
    t.string "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "spam", default: false
    t.float "spaminess"
    t.string "signature"
    t.text "description_html", size: :medium
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "login", limit: 40
    t.string "email", limit: 100
    t.string "salt", limit: 128, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
    t.datetime "last_login_at"
    t.string "crypted_password", limit: 128, default: "", null: false
    t.integer "assets_count", default: 0, null: false
    t.string "display_name"
    t.integer "playlists_count", default: 0, null: false
    t.integer "listens_count", default: 0
    t.string "itunes"
    t.integer "comments_count", default: 0
    t.string "last_login_ip"
    t.text "settings", size: :long
    t.boolean "moderator", default: false
    t.integer "followers_count", default: 0
    t.integer "login_count", default: 0, null: false
    t.datetime "current_login_at"
    t.string "current_login_ip"
    t.string "persistence_token"
    t.string "perishable_token"
    t.datetime "last_request_at"
    t.integer "bandwidth_used", default: 0
    t.boolean "dark_theme", default: false
    t.boolean "is_spam", default: false
    t.datetime "deleted_at"
    t.integer "invited_by_id"
    t.index ["updated_at"], name: "index_users_on_updated_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "patrons", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "thredded_messageboard_users", "thredded_messageboards"
  add_foreign_key "thredded_messageboard_users", "thredded_user_details"
  add_foreign_key "thredded_user_post_notifications", "thredded_posts", column: "post_id", on_delete: :cascade
  add_foreign_key "thredded_user_post_notifications", "users", on_delete: :cascade
end
