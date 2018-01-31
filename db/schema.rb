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

ActiveRecord::Schema.define(version: 20180131045633) do

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
    t.float "species_evenness"
  end

  create_table "fungi_samples", force: :cascade do |t|
    t.date "collected_on", null: false
    t.bigint "plot_id", null: false
    t.string "location_within_plot", null: false
    t.float "size", null: false
    t.string "description", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_fungi_samples_on_plot_id"
    t.index ["user_id"], name: "index_fungi_samples_on_user_id"
  end

  create_table "lichen_samples", force: :cascade do |t|
    t.string "location_within_plot"
    t.string "description"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer "biodiversity_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "macroinvertebrate_samples", force: :cascade do |t|
    t.string "phylum"
    t.string "location_within_plot"
    t.integer "quantity"
    t.string "ecosystem_service"
    t.integer "biodiversity_report_id"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mycorrhizal_fungi_samples", force: :cascade do |t|
    t.date "collected_on", null: false
    t.integer "length", null: false
    t.integer "magnification", null: false
    t.integer "vesicle_count", null: false
    t.integer "arbuscule_count", null: false
    t.boolean "visible_hyphae", null: false
    t.integer "hyphae_coverage"
    t.bigint "user_id", null: false
    t.bigint "plot_id", null: false
    t.bigint "plant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_mycorrhizal_fungi_samples_on_plant_id"
    t.index ["plot_id"], name: "index_mycorrhizal_fungi_samples_on_plot_id"
    t.index ["user_id"], name: "index_mycorrhizal_fungi_samples_on_user_id"
  end

  create_table "nonvascular_plant_samples", force: :cascade do |t|
    t.string "location_within_plot"
    t.string "description"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer "biodiversity_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutrients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "level"
    t.float "amount"
    t.bigint "soil_sample_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["soil_sample_id"], name: "index_nutrients_on_soil_sample_id"
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
    t.integer "collection_method"
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

  add_foreign_key "fungi_samples", "plots"
  add_foreign_key "fungi_samples", "users"
  add_foreign_key "mycorrhizal_fungi_samples", "plants"
  add_foreign_key "mycorrhizal_fungi_samples", "plots"
  add_foreign_key "mycorrhizal_fungi_samples", "users"
  add_foreign_key "nutrients", "soil_samples"
end
