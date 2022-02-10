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

ActiveRecord::Schema[6.1].define(version: 2022_01_12_212755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "biodiversity_reports", id: :serial, force: :cascade do |t|
    t.date "measured_on"
    t.time "measured_at"
    t.float "temperature"
    t.float "biomass_estimate"
    t.integer "species_richness"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "author_id"
    t.integer "plot_id"
    t.float "diversity_index"
    t.float "species_evenness"
  end

  create_table "biodiversity_reports_lichen_samples", id: false, force: :cascade do |t|
    t.bigint "biodiversity_report_id", null: false
    t.bigint "lichen_sample_id", null: false
    t.index ["biodiversity_report_id"], name: "index_biodiversity_reports_lichen_samples_on_bd_report_id"
    t.index ["lichen_sample_id"], name: "index_biodiversity_reports_lichen_samples_on_lichen_sample_id"
  end

  create_table "biodiversity_reports_macroinvertebrate_samples", id: false, force: :cascade do |t|
    t.bigint "biodiversity_report_id", null: false
    t.bigint "macroinvertebrate_sample_id", null: false
    t.index ["biodiversity_report_id"], name: "index_bd_reports_macroinvertebrate_samples_on_bd_report_id"
    t.index ["macroinvertebrate_sample_id"], name: "index_biodiversity_reports_mi_samples_on_mi_sample_id"
  end

  create_table "biodiversity_reports_plant_samples", id: false, force: :cascade do |t|
    t.bigint "biodiversity_report_id", null: false
    t.bigint "plant_sample_id", null: false
    t.index ["biodiversity_report_id"], name: "index_biodiversity_reports_plant_samples_on_bd_report_id"
    t.index ["plant_sample_id"], name: "index_biodiversity_reports_plant_samples_on_plant_sample_id"
  end

  create_table "biodiversity_reports_soil_samples", id: false, force: :cascade do |t|
    t.bigint "biodiversity_report_id", null: false
    t.bigint "soil_sample_id", null: false
    t.index ["biodiversity_report_id"], name: "index_biodiversity_reports_soil_samples_on_bd_report_id"
    t.index ["soil_sample_id"], name: "index_biodiversity_reports_soil_samples_on_soil_sample_id"
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
    t.datetime "photo_updated_at", precision: 6
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plot_id"], name: "index_fungi_samples_on_plot_id"
    t.index ["user_id"], name: "index_fungi_samples_on_user_id"
  end

  create_table "lichen_samples", force: :cascade do |t|
    t.string "location_within_plot"
    t.string "description"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "collected_on"
    t.bigint "plot_id"
    t.bigint "user_id"
    t.index ["plot_id"], name: "index_lichen_samples_on_plot_id"
    t.index ["user_id"], name: "index_lichen_samples_on_user_id"
  end

  create_table "macroinvertebrate_samples", force: :cascade do |t|
    t.string "phylum"
    t.string "location_within_plot"
    t.integer "quantity"
    t.string "ecosystem_service"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "collected_on"
    t.bigint "plot_id"
    t.bigint "user_id"
    t.index ["plot_id"], name: "index_macroinvertebrate_samples_on_plot_id"
    t.index ["user_id"], name: "index_macroinvertebrate_samples_on_user_id"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.index ["plant_id"], name: "index_mycorrhizal_fungi_samples_on_plant_id"
    t.index ["plot_id"], name: "index_mycorrhizal_fungi_samples_on_plot_id"
    t.index ["user_id"], name: "index_mycorrhizal_fungi_samples_on_user_id"
  end

  create_table "nonvascular_plant_samples", force: :cascade do |t|
    t.date "collected_on", null: false
    t.bigint "plot_id", null: false
    t.string "location_within_plot", null: false
    t.string "description", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plot_id"], name: "index_nonvascular_plant_samples_on_plot_id"
    t.index ["user_id"], name: "index_nonvascular_plant_samples_on_user_id"
  end

  create_table "nutrients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "level"
    t.float "amount"
    t.bigint "soil_sample_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["soil_sample_id"], name: "index_nutrients_on_soil_sample_id"
  end

  create_table "plant_samples", id: :serial, force: :cascade do |t|
    t.integer "abundance"
    t.integer "percent_cover"
    t.float "biomass_estimate"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "plant_id"
    t.date "collected_on"
    t.bigint "plot_id"
    t.bigint "user_id"
    t.index ["plot_id"], name: "index_plant_samples_on_plot_id"
    t.index ["user_id"], name: "index_plant_samples_on_user_id"
  end

  create_table "plants", id: :serial, force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name"
    t.string "habitat_type"
    t.string "tolerance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.integer "featured_plant_id"
  end

  create_table "soil_samples", id: :serial, force: :cascade do |t|
    t.float "ph_level"
    t.float "temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "moisture"
    t.integer "collection_method"
    t.date "collected_on"
    t.bigint "plot_id"
    t.bigint "user_id"
    t.index ["plot_id"], name: "index_soil_samples_on_plot_id"
    t.index ["user_id"], name: "index_soil_samples_on_user_id"
  end

  create_table "species_variation_observations", force: :cascade do |t|
    t.date "observed_on", null: false
    t.bigint "user_id", null: false
    t.bigint "plot_id", null: false
    t.bigint "plant_id", null: false
    t.float "average_height", null: false
    t.float "average_width", null: false
    t.string "description"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plant_id"], name: "index_species_variation_observations_on_plant_id"
    t.index ["plot_id"], name: "index_species_variation_observations_on_plot_id"
    t.index ["user_id"], name: "index_species_variation_observations_on_user_id"
  end

  create_table "tree_samples", force: :cascade do |t|
    t.date "collected_on", null: false
    t.bigint "plot_id"
    t.bigint "user_id"
    t.bigint "plant_id"
    t.integer "tag_number", null: false
    t.integer "growth_stage", null: false
    t.float "dbh", null: false
    t.float "lower_canopy_height"
    t.float "upper_canopy_height"
    t.float "latitude"
    t.float "longitude"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plant_id"], name: "index_tree_samples_on_plant_id"
    t.index ["plot_id"], name: "index_tree_samples_on_plot_id"
    t.index ["user_id"], name: "index_tree_samples_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password"
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "biodiversity_reports_lichen_samples", "biodiversity_reports"
  add_foreign_key "biodiversity_reports_lichen_samples", "lichen_samples"
  add_foreign_key "biodiversity_reports_macroinvertebrate_samples", "biodiversity_reports"
  add_foreign_key "biodiversity_reports_macroinvertebrate_samples", "macroinvertebrate_samples"
  add_foreign_key "biodiversity_reports_plant_samples", "biodiversity_reports"
  add_foreign_key "biodiversity_reports_plant_samples", "plant_samples"
  add_foreign_key "biodiversity_reports_soil_samples", "biodiversity_reports"
  add_foreign_key "biodiversity_reports_soil_samples", "soil_samples"
  add_foreign_key "fungi_samples", "plots"
  add_foreign_key "fungi_samples", "users"
  add_foreign_key "lichen_samples", "plots"
  add_foreign_key "lichen_samples", "users"
  add_foreign_key "macroinvertebrate_samples", "plots"
  add_foreign_key "macroinvertebrate_samples", "users"
  add_foreign_key "mycorrhizal_fungi_samples", "plants"
  add_foreign_key "mycorrhizal_fungi_samples", "plots"
  add_foreign_key "mycorrhizal_fungi_samples", "users"
  add_foreign_key "nonvascular_plant_samples", "plots"
  add_foreign_key "nonvascular_plant_samples", "users"
  add_foreign_key "nutrients", "soil_samples"
  add_foreign_key "plant_samples", "plots"
  add_foreign_key "plant_samples", "users"
  add_foreign_key "soil_samples", "plots"
  add_foreign_key "soil_samples", "users"
  add_foreign_key "species_variation_observations", "plants"
  add_foreign_key "species_variation_observations", "plots"
  add_foreign_key "species_variation_observations", "users"
  add_foreign_key "tree_samples", "plants"
  add_foreign_key "tree_samples", "plots"
  add_foreign_key "tree_samples", "users"
end
