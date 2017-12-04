# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171204090232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_conversations_on_participant_id"
    t.index ["user_id", "participant_id"], name: "index_conversations_on_user_id_and_participant_id", unique: true
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "data_endpoints", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "method", null: false
    t.string "path", null: false
    t.bigint "data_source_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_source_id"], name: "index_data_endpoints_on_data_source_id"
    t.index ["description"], name: "index_data_endpoints_on_description"
    t.index ["name"], name: "index_data_endpoints_on_name"
    t.index ["user_id"], name: "index_data_endpoints_on_user_id"
  end

  create_table "data_source_accesses", force: :cascade do |t|
    t.bigint "data_source_id", null: false
    t.bigint "user_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_source_id"], name: "index_data_source_accesses_on_data_source_id"
    t.index ["user_group_id"], name: "index_data_source_accesses_on_user_group_id"
  end

  create_table "data_sources", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "base_url", default: ""
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_url"], name: "index_data_sources_on_base_url"
    t.index ["description"], name: "index_data_sources_on_description"
    t.index ["name"], name: "index_data_sources_on_name"
    t.index ["user_id"], name: "index_data_sources_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "user_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_group_id"], name: "index_memberships_on_user_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "conversation_id"
    t.text "body", null: false
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", default: 1, null: false
    t.string "visibility", default: "public", null: false
    t.index ["name"], name: "index_user_groups_on_name"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
    t.index ["visibility"], name: "index_user_groups_on_visibility"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "data_endpoints", "data_sources"
  add_foreign_key "data_endpoints", "users"
  add_foreign_key "data_source_accesses", "data_sources"
  add_foreign_key "data_source_accesses", "user_groups"
  add_foreign_key "data_sources", "users"
  add_foreign_key "memberships", "user_groups"
  add_foreign_key "memberships", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "user_groups", "users"
end
