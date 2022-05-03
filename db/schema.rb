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

ActiveRecord::Schema[7.1].define(version: 2022_05_03_205948) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "employment_types", force: :cascade do |t|
    t.bigint "offer_id"
    t.string "name"
    t.integer "from"
    t.integer "to"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_employment_types_on_offer_id"
  end

  create_table "multilocations", force: :cascade do |t|
    t.bigint "offer_id"
    t.string "city"
    t.string "slug"
    t.string "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_multilocations_on_offer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.string "street"
    t.string "city"
    t.string "country_code"
    t.string "address_text"
    t.string "marker_icon"
    t.string "workplace_type"
    t.string "company_name"
    t.string "company_url"
    t.string "company_size"
    t.string "experience_level"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "published_at"
    t.boolean "remote_interview"
    t.boolean "open_to_hire_ukrainians"
    t.string "jjit_id"
    t.boolean "display_offer"
    t.boolean "remote"
    t.boolean "way_of_apply"
    t.string "company_logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jjit_id"], name: "index_offers_on_jjit_id"
  end

  create_table "offers_skills", id: false, force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "skill_id", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
