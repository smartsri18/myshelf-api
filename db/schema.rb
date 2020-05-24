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

ActiveRecord::Schema.define(version: 2020_05_23_103528) do

  create_table "images", force: :cascade do |t|
    t.string "imagable_type", null: false
    t.integer "imagable_id", null: false
    t.string "image_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imagable_type", "imagable_id"], name: "index_images_on_imagable_type_and_imagable_id"
  end

  create_table "my_books", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.string "author", null: false
    t.string "genre"
    t.string "isbn"
    t.integer "categories", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_my_books_on_user_id"
  end

  create_table "my_movies", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.string "genre"
    t.string "released_date"
    t.integer "categories", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_my_movies_on_user_id"
  end

  create_table "my_notes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_my_notes_on_user_id"
  end

  create_table "my_quotes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_my_quotes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "password_reset_token"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name", "last_name"], name: "index_users_on_first_name_and_last_name"
  end

  add_foreign_key "my_books", "users"
  add_foreign_key "my_movies", "users"
  add_foreign_key "my_notes", "users"
  add_foreign_key "my_quotes", "users"
end
