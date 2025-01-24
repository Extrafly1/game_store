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

ActiveRecord::Schema[8.0].define(version: 2025_01_24_163955) do
  create_table "client_games", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_games_on_client_id"
    t.index ["game_id"], name: "index_client_games_on_game_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email", null: false
    t.decimal "balance", precision: 10, scale: 2, default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.string "game_name", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "client_games", "clients"
  add_foreign_key "client_games", "games"
end
