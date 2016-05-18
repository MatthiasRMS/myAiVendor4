# encoding: UTF-8


ActiveRecord::Schema.define(version: 20160518091533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "room_id"
    t.string   "sender"
    t.jsonb    "structured_messages"
    t.index ["room_id"], name: "index_messages_on_room_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.bigint   "facebook_id"
    t.string   "first_name"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint   "facebook_id"
    t.jsonb    "context"
    t.string   "status"
    t.datetime "last_exchange"
    t.integer  "count_messages"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "messages", "rooms"
end
