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

ActiveRecord::Schema.define(version: 2018_04_30_114626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pickups", force: :cascade do |t|
    t.datetime "departure_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "passenger_id"
    t.bigint "source_id"
    t.bigint "destination_id"
    t.index ["destination_id"], name: "index_pickups_on_destination_id"
    t.index ["passenger_id"], name: "index_pickups_on_passenger_id"
    t.index ["source_id"], name: "index_pickups_on_source_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "longitude"
    t.string "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["longitude", "latitude"], name: "index_places_on_longitude_and_latitude", unique: true
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "departure_time"
    t.string "number_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "driver_id"
    t.bigint "source_id"
    t.bigint "destination_id"
    t.index ["destination_id"], name: "index_trips_on_destination_id"
    t.index ["driver_id"], name: "index_trips_on_driver_id"
    t.index ["source_id"], name: "index_trips_on_source_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
