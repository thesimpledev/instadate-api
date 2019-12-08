# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_08_222207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "instadates", force: :cascade do |t|
    t.string "activity", null: false
    t.time "time"
    t.bigint "creator_id", null: false
    t.bigint "partner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address", null: false
    t.string "city", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.index ["creator_id"], name: "index_instadates_on_creator_id"
    t.index ["latitude"], name: "index_instadates_on_latitude"
    t.index ["longitude"], name: "index_instadates_on_longitude"
    t.index ["partner_id"], name: "index_instadates_on_partner_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.boolean "verified", default: false, null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "sparks", force: :cascade do |t|
    t.bigint "instadate_id", null: false
    t.bigint "user_id", null: false
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "denied", default: false
    t.index ["instadate_id"], name: "index_sparks_on_instadate_id"
    t.index ["user_id", "instadate_id"], name: "index_sparks_on_user_id_and_instadate_id", unique: true
    t.index ["user_id"], name: "index_sparks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.text "session_token", null: false
    t.integer "age", null: false
    t.string "location", null: false
    t.string "sex", null: false
    t.string "interested_in", default: [], null: false, array: true
    t.string "outcomes", default: [], null: false, array: true
    t.string "name", null: false
    t.text "bio", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "instadates", "users", column: "creator_id"
  add_foreign_key "instadates", "users", column: "partner_id"
  add_foreign_key "pictures", "users"
  add_foreign_key "sparks", "instadates"
  add_foreign_key "sparks", "users"
end
