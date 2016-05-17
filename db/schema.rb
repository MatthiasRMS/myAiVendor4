# encoding: UTF-8


ActiveRecord::Schema.define(version: 20160516162308) do

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

  add_foreign_key "messages", "rooms"
end
