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

ActiveRecord::Schema.define(version: 20170718205642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "biodiversity_reports", id: :serial, force: :cascade do |t|
    t.date "measured_on"
    t.time "measured_at"
    t.float "temperature"
    t.float "biomass_estimate"
    t.integer "species_richness"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
    t.integer "plot_id"
    t.float "diversity_index"
  end

  create_table "plant_samples", id: :serial, force: :cascade do |t|
    t.integer "abundance"
    t.integer "percent_cover"
    t.float "biomass_estimate"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "biodiversity_report_id"
    t.integer "plant_id"
  end

  create_table "plants", id: :serial, force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name"
    t.string "habitat_type"
    t.string "tolerance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.text "description"
    t.text "citation"
    t.boolean "invasive"
  end

  create_table "plots", id: :serial, force: :cascade do |t|
    t.integer "plot_id"
    t.float "latitude"
    t.float "longitude"
    t.float "elevation"
    t.float "area"
    t.text "location_description"
    t.string "aspect"
    t.string "origin"
    t.boolean "inoculated"
    t.string "initial_planting_date"
    t.string "initial_succession"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer "featured_plant_id"
  end

  create_table "soil_samples", id: :serial, force: :cascade do |t|
    t.float "ph_level"
    t.float "temperature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "biodiversity_report_id"
    t.float "moisture"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
