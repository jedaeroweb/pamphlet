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

ActiveRecord::Schema[7.1].define(version: 2022_08_29_171007) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_login_logs", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.integer "client_ip", limit: 8, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_login_logs_on_admin_id"
  end

  create_table "admin_pictures", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.string "picture", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_pictures_on_admin_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", limit: 100, null: false
    t.string "name", limit: 100, null: false
    t.string "encrypted_password", limit: 60, null: false
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "blog_categories", force: :cascade do |t|
    t.integer "blog_category_id"
    t.string "title", limit: 60, null: false
    t.integer "blogs_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_category_id"], name: "index_blog_categories_on_blog_category_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "blog_category_id", null: false
    t.string "title", limit: 60, null: false
    t.string "description", limit: 255, null: false
    t.string "photo"
    t.integer "blog_comments_count", default: 0, null: false
    t.integer "count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_category_id"], name: "index_blogs_on_blog_category_id"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "contact_categories", force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.integer "contacts_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_contents", force: :cascade do |t|
    t.text "content", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "contact_category_id", null: false
    t.string "name", limit: 60, null: false
    t.string "phone", limit: 40, null: false
    t.string "address", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_category_id"], name: "index_contacts_on_contact_category_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.integer "gallery_category_id", null: false
    t.string "title", limit: 60, null: false
    t.string "location", limit: 255
    t.string "photo", null: false
    t.string "content", limit: 255, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gallery_category_id"], name: "index_galleries_on_gallery_category_id"
  end

  create_table "gallery_categories", force: :cascade do |t|
    t.integer "gallery_category_id"
    t.string "title", limit: 60, null: false
    t.integer "galleries_count", default: 0, null: false
    t.integer "gallery_categories_count", default: 0, null: false
    t.boolean "leaf", default: true
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gallery_category_id"], name: "index_gallery_categories_on_gallery_category_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.integer "users_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "year", limit: 40, null: false
    t.string "title", limit: 60, null: false
    t.text "content", null: false
    t.integer "count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type", limit: 100
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name", limit: 60
    t.string "action_name", limit: 60
    t.string "view_name", limit: 60
    t.string "request_hash", limit: 130
    t.string "ip_address", limit: 60
    t.string "session_hash", limit: 100
    t.text "message"
    t.text "referrer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "notices", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", limit: 60, null: false
    t.boolean "enable", default: true, null: false
    t.integer "count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_photos", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "photo", null: false
    t.string "alt", limit: 60, null: false
    t.boolean "default", default: false, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 100, null: false
    t.string "nickname", limit: 60, null: false
    t.string "photo", limit: 100
    t.string "encrypted_password", limit: 100, null: false
    t.string "description", limit: 150
    t.string "alternate_name", limit: 100
    t.string "name", limit: 60
    t.boolean "gender", default: false
    t.datetime "birth_date", precision: nil
    t.string "job", limit: 60
    t.string "url", limit: 150
    t.string "reset_password_token", limit: 150
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "admin", default: false, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
