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

ActiveRecord::Schema[7.1].define(version: 2024_03_17_231256) do
  create_table "exercise_groups", force: :cascade do |t|
    t.integer "muscle_exercise_id", null: false
    t.integer "muscle_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["muscle_exercise_id"], name: "index_exercise_groups_on_muscle_exercise_id"
    t.index ["muscle_group_id"], name: "index_exercise_groups_on_muscle_group_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status_id"
  end

  create_table "muscle_exercises", force: :cascade do |t|
    t.integer "repetition"
    t.integer "set"
    t.string "observation"
    t.integer "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status_id"
    t.index ["exercise_id"], name: "index_muscle_exercises_on_exercise_id"
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name"
    t.integer "training_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_plan_id"], name: "index_muscle_groups_on_training_plan_id"
  end

  create_table "training_plans", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_training_plans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exercise_groups", "muscle_exercises"
  add_foreign_key "exercise_groups", "muscle_groups"
  add_foreign_key "muscle_exercises", "exercises"
  add_foreign_key "muscle_groups", "training_plans"
  add_foreign_key "training_plans", "users"
end
