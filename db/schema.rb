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

ActiveRecord::Schema[7.2].define(version: 2025_04_09_130942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_options", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "text"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answer_options_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "survey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_categories_on_survey_id"
  end

  create_table "kpi_analyses", force: :cascade do |t|
    t.bigint "survey_response_id", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_response_id"], name: "index_kpi_analyses_on_survey_response_id"
  end

  create_table "question_answers", force: :cascade do |t|
    t.bigint "survey_response_id", null: false
    t.bigint "question_id", null: false
    t.bigint "answer_option_id", null: false
    t.integer "score"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_option_id"], name: "index_question_answers_on_answer_option_id"
    t.index ["category_id"], name: "index_question_answers_on_category_id"
    t.index ["question_id"], name: "index_question_answers_on_question_id"
    t.index ["survey_response_id"], name: "index_question_answers_on_survey_response_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "text"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "survey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_responses_on_survey_id"
    t.index ["user_id"], name: "index_survey_responses_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answer_options", "questions"
  add_foreign_key "categories", "surveys"
  add_foreign_key "kpi_analyses", "survey_responses"
  add_foreign_key "question_answers", "answer_options"
  add_foreign_key "question_answers", "categories"
  add_foreign_key "question_answers", "questions"
  add_foreign_key "question_answers", "survey_responses"
  add_foreign_key "questions", "categories"
  add_foreign_key "survey_responses", "surveys"
  add_foreign_key "survey_responses", "users"
end
