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

ActiveRecord::Schema.define(version: 2020_01_26_175828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enneagram_numbers", force: :cascade do |t|
    t.integer "enneagram_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enneagram_scores", force: :cascade do |t|
    t.integer "enneagram_one_score"
    t.integer "enneagram_two_score"
    t.integer "enneagram_three_score"
    t.integer "enneagram_four_score"
    t.integer "enneagram_five_score"
    t.integer "enneagram_six_score"
    t.integer "enneagram_seven_score"
    t.integer "enneagream_eight_score"
    t.integer "enneagram_nine_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_enneagram_scores_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.bigint "enneagram_number_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enneagram_number_id"], name: "index_questions_on_enneagram_number_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "answer"
    t.bigint "user_id"
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "enneagram_scores", "users"
  add_foreign_key "questions", "enneagram_numbers"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "users"
end
